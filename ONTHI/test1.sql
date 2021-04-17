DROP DATABASE IF EXISTS Requirement_1;
CREATE DATABASE IF NOT EXISTS Requirement_1;
USE Requirement_1;
DROP TABLE IF EXISTS CUSTOMER;
CREATE TABLE IF NOT EXISTS CUSTOMER(
    CustomerID  TINYINT PRIMARY KEY AUTO_INCREMENT,
    `Name`      VARCHAR(50) NOT NULL,
    Phone       VARCHAR(50) UNIQUE KEY,
    Email       VARCHAR(50) UNIQUE KEY,
    Address     VARCHAR(50) NOT NULL,
    Note        VARCHAR(50)
);
INSERT INTO CUSTOMER(`name`,phone,email,address,note) VALUES
                    ('Nguyễn Văn A','099996295','huy16041995@gmail.com','THANH HÓA','abc'),
                    ('Nguyễn Văn B','0980678795','B@gmail.com','HÀ NỘI',NULL),
                    ('Nguyễn Văn C','098065495','C@gmail.com','THÁI BÌNH','OK'),
                    ('Nguyễn Văn D','098064645','D@gmail.com','CÀ MAU','UK'),
                    ('Nguyễn Văn E','098887295','E@gmail.com','THANH HÓA','IIK');
                    
DROP TABLE IF EXISTS CAR;
CREATE TABLE IF NOT EXISTS CAR(
    CarID       TINYINT PRIMARY KEY AUTO_INCREMENT,
    Maker       ENUM('HONDA','TOYOTA','NISSAN'),
    Model       VARCHAR(50) UNIQUE NOT NULL,
    `YEAR`      DATE NOT NULL,
    Color       ENUM('black','white','yellow') NOT NULL,
    Note        VARCHAR(50)
);
INSERT INTO CAR(MAKER,MODEL,`YEAR`,COLOR,NOTE) VALUES
                   ('HONDA','M45','1996-12-02','black','ok'),
                   ('TOYOTA','R5','1999-01-02','white','ok'),
                   ('HONDA','R6','2000-09-08','yellow','ok'),
                   ('NISSAN','TR5','2010-05-06','black','ok'),
                   ('NISSAN','TY7','2021-12-21','black','ok');
                   
DROP TABLE IF EXISTS CAR_ORDER;
CREATE TABLE IF NOT EXISTS CAR_ORDER(
    OrderID         TINYINT PRIMARY KEY AUTO_INCREMENT,
    CustomerID      TINYINT NOT NULL,
    CarID           TINYINT NOT NULL,
    Amount          TINYINT NOT NULL DEFAULT 1,
    SalePrice       BIGINT NOT NULL DEFAULT 0,
    OderDate        DATE NOT NULL,
    DeliveryDate    DATE NOT NULL,
    DeliveryAddress VARCHAR(50),
    `Status`        ENUM('0','1','2') DEFAULT 1,
    Note            VARCHAR(50),
    CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT fk_order FOREIGN KEY (CarID) REFERENCES CAR(CarID) 
    ON DELETE CASCADE
);
INSERT INTO CAR_ORDER(CustomerID,CarID,Amount,SalePrice,OderDate,DeliveryDate,DeliveryAddress,`Status`,Note) VALUES
                     (     1    ,  2  ,  1   ,650000000 ,'2020-04-01','2020-04-16','THANH HÓA', '2'      ,'ĐÃ HỦY'),
                     (     2    ,  3  ,  1   ,850000000 ,'2020-04-08','2020-04-14','HÀ NỘI', '1 '     ,'THÀNH CÔNG'),
                     (     3    ,  2  ,  1   ,750000000 ,'2021-04-04','2021-04-14','THÁI BÌNH', '1 '     ,'THÀNH CÔNG'),
                     (     4    ,  4  ,  1   ,350000000 ,'2021-04-06','2021-04-13','CÀ MAU',  '1'     ,'THÀNH CÔNG'),
                     (     5    ,  5  ,  1   ,250000000 ,'2021-04-04','2021-04-12','THANH HÓA', '1 '     ,'THÀNH CÔNG'),
                     (     5    ,  1  ,  1   ,750000000 ,'2021-04-04','2021-04-12','THANH HÓA', '2'     ,'ĐÃ HỦY'),
                     (     5    ,  2  ,  1   ,650000000 ,'2021-04-04','2021-04-4','THANH HÓA', '1 '     ,'THÀNH CÔNG'),
                     (     3    ,  4  ,  1   ,350000000 ,'2021-04-04','2021-04-4','THANH HÓA', '1 '     ,'THÀNH CÔNG'),
                     (     1    ,  4  ,  1   ,350000000 ,'2019-04-04','2019-04-4','THANH ', '2 '     ,'ĐÃ HỦY'),
                     (     2    ,  4  ,  1   ,350000000 ,'2019-04-04','2019-04-4','THANH ', '2 '     ,'ĐÃ HỦY');
          
-- Q2 Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã mua và sắp sếp tăng dần theo số lượng oto đã mua.

SELECT a.`name` , count(b.amount)
FROM       CUSTOMER a 
INNER JOIN CAR_ORDER b ON a.CustomerID=b.CustomerID
GROUP BY   b.CustomerID
ORDER BY   count(b.amount);

-- Q3 Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều oto nhất trong năm nay.

DROP PROCEDURE IF EXISTS Q3;
DELIMITER $$
CREATE PROCEDURE Q3()
BEGIN 
    SELECT count(a.amount),a.CarID,b.maker,b.model,b.`year`
    FROM car_order a
    INNER JOIN CAR b ON a.CarID=b.CarID
    WHERE year(a.deliverydate)=year(now()) 
    GROUP BY a.CarID
    HAVING count(a.amount)=(SELECT count(amount)
                            FROM car_order 
                            WHERE year(deliverydate)=year(now()) 
                            GROUP BY CarID
                            ORDER BY count(amount) DESC LIMIT 1);
    END $$
 DELIMITER ;
    
CALL Q3();     
                        
 -- Q4 Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của những năm trước. In ra số lượng bản ghi đã bị xóa.                           
 
 SELECT count(`status`) AS 'số đơn hàng bị hủy những năm trước' FROM CAR_ORDER WHERE year(oderdate)< year(now()) GROUP BY `status` HAVING `status`='2';
 
DROP TABLE IF EXISTS car_oder_delete;    
CREATE TABLE car_oder_delete (
    OrderID         TINYINT PRIMARY KEY AUTO_INCREMENT,
    CustomerID      TINYINT NOT NULL,
    CarID           TINYINT NOT NULL,
    Amount          TINYINT NOT NULL DEFAULT 1,
    SalePrice       BIGINT NOT NULL DEFAULT 0,
    OderDate        DATE NOT NULL,
    DeliveryDate    DATE NOT NULL,
    DeliveryAddress VARCHAR(50),
    `Status`        ENUM('0','1','2') DEFAULT 1,
    Note            VARCHAR(50),
    deletedAt TIMESTAMP DEFAULT NOW()
);

DROP TRIGGER IF EXISTS before_oder_car_delete;
DELIMITER $$
CREATE TRIGGER before_oder_car_delete
BEFORE DELETE ON CAR_ORDER
FOR EACH ROW 
BEGIN 
INSERT INTO car_oder_delete(CustomerID,CarID,Amount,SalePrice,OderDate,DeliveryDate,DeliveryAddress,`Status`,Note) VALUES
                            (OLD.CustomerID,OLD.CarID,OLD.Amount,OLD.SalePrice,OLD.OderDate,OLD.DeliveryDate,OLD.DeliveryAddress,OLD.`Status`,OLD.Note);
END $$
 DELIMITER ;
    
-- DELETE FROM CAR_ORDER WHERE  year(oderDate)< year(now()) AND `Status`='2';
-- SELECT * FROM car_oder_delete;

DROP PROCEDURE IF EXISTS Q4;
DELIMITER $$
CREATE PROCEDURE Q4()
BEGIN 
    DELETE FROM CAR_ORDER WHERE  year(oderDate)< year(now()) AND `Status`='2';
    SELECT count(OrderID) AS 'số đơn hàng bị hủy những năm trước' FROM car_oder_delete;
END $$
DELIMITER ;
CALL Q4();

-- Q5 Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto và tên hãng sản xuất.

DROP PROCEDURE IF EXISTS Q5;
DELIMITER $$
CREATE PROCEDURE Q5(IN CUSTOMERID_ INT)
BEGIN 
    SELECT a.`Name`,b.OrderID,b.Amount,c.Maker
    FROM customer  a 
    JOIN car_order b ON a.CustomerID=b.CustomerID
    JOIN car       c ON b.CarID=c.CarID
    WHERE b.CustomerID=CUSTOMERID_;
    END $$
DELIMITER ;

 CALL Q5('5');   
    
-- Q6 Viết trigger để tránh trường hợp người dụng nhập thông tin không hợp lệ vào database (DeliveryDate < OrderDate + 15).

DROP TRIGGER IF EXISTS Q6;
DELIMITER $$
CREATE TRIGGER Q6
BEFORE INSERT ON car_order
FOR EACH ROW
BEGIN 
    IF NEW.DeliveryDate < NEW.OderDate + 15 THEN
       SIGNAL SQLSTATE '12345'
       SET MESSAGE_TEXT='(DỮ LIỆU NHẬP KHÔNG HỢP LỆ (DeliveryDate < OrderDate + 15))';
	END IF;
END $$
DELIMITER ;

INSERT INTO CAR_ORDER(CustomerID,CarID,Amount,SalePrice,OderDate,DeliveryDate,DeliveryAddress,`Status`,Note) VALUES
                     (    3   ,  3  ,  2   ,650000000 ,'2021-04-01','2021-04-17','THANH HÓA', '1'      ,'THÀNH CÔNG');
SELECT * FROM Car_order;