import java.util.Date;

public class main {


	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// create Department
		Department department1 = new Department();
		department1.departmentID = 1;
		department1.departmentName = "Sale";
		
		Department department2 = new Department();
		department2.departmentID = 2;
		department2.departmentName = "Marketing";
		
		Department department3 = new Department();
		department3.departmentID = 3;
		department3.departmentName = "Giam Doc";
		
		Department department4 = new Department();
		department4.departmentID = 4;
		department4.departmentName = "Bao Ve";
		
		// create Position
		Position position1 = new Position();
		position1.positionID = 1;
		position1.positionName = "Developer";
		
		Position position2 = new Position();
		position2.positionID = 2;
		position2.positionName = "Tester";
		
		Position position3 = new Position();
		position3.positionID = 3;
		position3.positionName = "Comtor";
		
		Position position4 = new Position();
		position4.positionID = 4;
		position4.positionName = "Business Analysis";
		
		Position position5 = new Position();
		position5.positionID = 5;
		position5.positionName = "Quality Assurance";
		
		Position position6 = new Position();
		position6.positionID = 6;
		position6.positionName = "Project Manager";
		
		// create TypeQuestion
		TypeQuestion typeQuestion1 = new TypeQuestion();
		typeQuestion1.typeID = 1;
		typeQuestion1.typeName = typeName.Essay;
		
		TypeQuestion typeQuestion2 = new TypeQuestion();
		typeQuestion2.typeID = 2;
		typeQuestion2.typeName = typeName.Multiple_Choice;
		
		TypeQuestion typeQuestion3 = new TypeQuestion();
		typeQuestion3.typeID = 3;
		typeQuestion3.typeName = typeName.RankOrder;
		
		TypeQuestion typeQuestion4 = new TypeQuestion();
		typeQuestion4.typeID = 4;
		typeQuestion4.typeName = typeName.ScalingQuestion;
		
		TypeQuestion typeQuestion5 = new TypeQuestion();
		typeQuestion5.typeID = 5;
		typeQuestion5.typeName = typeName.SemanticDifferentialScale;
		
		TypeQuestion typeQuestion6 = new TypeQuestion();
		typeQuestion6.typeID = 6;
		typeQuestion6.typeName = typeName.StapelScaleQuestion;
		
		
		// create CategoryQuestion
		CategoryQuestion categoryQuestion1 = new CategoryQuestion();
		categoryQuestion1.categoryID = 1;
		categoryQuestion1.categoryName = categoryName.Java;
		
		CategoryQuestion categoryQuestion2 = new CategoryQuestion();
		categoryQuestion2.categoryID = 2;
		categoryQuestion2.categoryName = categoryName.NET;
		
		CategoryQuestion categoryQuestion3 = new CategoryQuestion();
		categoryQuestion3.categoryID = 3;
		categoryQuestion3.categoryName = categoryName.Postman;
		
		CategoryQuestion categoryQuestion4 = new CategoryQuestion();
		categoryQuestion4.categoryID = 4;
		categoryQuestion4.categoryName = categoryName.Ruby;
		
		CategoryQuestion categoryQuestion5 = new CategoryQuestion();
		categoryQuestion5.categoryID = 5;
		categoryQuestion5.categoryName = categoryName.SQL;
		
		// create Group
		Group group1 = new Group();
		group1.groupID = 1;
		group1.groupName = "jave fresher";
		group1.createDate = new Date("2020/02/09");
		group1.creatorID = 1;
		
		
		
		Group group2 = new Group();
		group2.groupID = 2;
		group2.groupName = "C# fresher";
		group2.createDate = new Date("2019/02/04");
		group2.creatorID = 2;
		
		// create Account
		Account account1 = new Account();
		account1.accountID = 1;
		account1.fullName = "Nguyen Van Huy";
		account1.departments = department1;
		account1.email = "nguyenvanhuy16041995@gmail.com";
		Group[] groupaccount1 = {group1,group2};
		account1.groups = groupaccount1 ;
		account1.createDate = new Date("2021/04/16");
		
		Account account2 = new Account();
		account2.accountID = 1;
		account2.fullName = "Nguyen Van b";
		account2.departments = department1;
		account2.email = "nnhuy16041995@gmail.com";
		Group[] groupaccount2 = {group2};
		account2.groups = groupaccount2 ;
		account2.createDate = new Date("2021/04/17");	
		
		Account account3 = new Account();
		account3.accountID = 3;
		account3.fullName = "Nguyen b";
		account3.departments = department1;
		account3.email = "n995@gmail.com";
		Group[] groupaccount3 = {group2};
		account2.groups = groupaccount3 ;
		account2.createDate = new Date("2021/04/19");		
		
		
		// create Question
		Question question1 = new Question();
		question1.questionID = 1;
		question1.accountID = account1.accountID;
		question1.fullName = account1.fullName;
		question1.content = "Please explain what you understand by computer programming";
		question1.categoryID = categoryQuestion1.categoryID;
		question1.typeID = typeQuestion1.typeID;
		question1.creatDate = new Date("2021/12/12");
		
		Question question2 = new Question();
		question2.questionID = 2;
		question2.accountID = account2.accountID;
		question2.fullName = account2.fullName;
		question2.content = "Please explain what you understand by computer programming";
		question2.categoryID = categoryQuestion2.categoryID;
		question2.typeID = typeQuestion2.typeID;
		question2.creatDate = new Date("2021/12/12");
		
		Question question3 = new Question();
		question3.questionID = 3;
		question3.accountID = account3.accountID;
		question3.fullName = account3.fullName;
		question3.content = "Please explain what you understand by computer programming";
		question3.categoryID = categoryQuestion3.categoryID;
		question3.typeID = typeQuestion3.typeID;
		question3.creatDate = new Date("2021/12/12");
		
		
		// create Answer
		Answer answer1 = new Answer();
		answer1.answerID = 1;
		answer1.questionID = question1.questionID;
		answer1.isCorrect = isCorrect.SAI;
		
		Answer answer2 = new Answer();
		answer2.answerID = 2;
		answer2.questionID = question2.questionID;
		answer2.isCorrect = isCorrect.ĐÚNG;
		
		Answer answer3 = new Answer();
		answer3.answerID = 3;
		answer3.questionID = question3.questionID;
		answer3.isCorrect = isCorrect.SAI;
		
				 
		// create Exam
		Exam exam1 = new Exam();
		exam1.examID = 1;
		exam1.code = "E01";
		exam1.title = "Exam for Java";
		
		Exam exam2 = new Exam();
		exam2.examID = 2;
		exam2.code = "E02";
		exam2.title = "Exam for SQL";
		
		Exam exam3 = new Exam();
		exam3.examID = 3;
		exam3.code = "E03";
		exam3.title = "Exam for python";
		
		Exam exam4 = new Exam();
		exam4.examID = 4;
		exam4.code = "E04";
		exam4.title = "Exam for C#";
		
		
		
		// Thông tin phòng ban
		System.out.println("Thong tin phong ban 1");
		System.out.println("Ten :"+ department1.departmentName);
		System.out.println("id :"+ department1.departmentID);
		System.out.println("\n");
		
		// Thông tin account
		System.out.println("Thong tin account 1");
		System.out.println("ten phong ban :"+ department1.departmentName);
		System.out.println("id phong ban :"+ department1.departmentID);
		System.out.println("Ten :"+ account1.fullName);
		System.out.println("id :"+ account1.accountID);
		System.out.println("email : "+ account1.email);
		System.out.println("Group :"+ groupaccount1);
		System.out.println("Ngay tao :"+ account1.createDate);
		System.out.println("\n");
		
		// Thông tin exam
		System.out.println("Thông tin exam");
		System.out.println("ExamID :"+ exam1.examID);
		System.out.println("Code :"+ exam1.code);
		System.out.println("Title :"+ exam1.title);
		System.out.println("\n");
		
		
		// Thông tin Question
		System.out.println("Thông tin Question");
		System.out.println("id :"+ question1.questionID);
		System.out.println("id người tạo :"+ question1.accountID);
		System.out.println("Tên người tạo :"+ question1.fullName);
		System.out.println("Content :"+question1.content);
		System.out.println("categoryID :"+ question1.categoryID);
		System.out.println("typeID :"+ question1.typeID);
		System.out.println("Ngày tạo :"+question1.creatDate);
		System.out.println("\n");
		
		
		//Thông tin CategoryQuestion
		System.out.println("Thông tin CategoryQuestion");
		System.out.println("ID :"+categoryQuestion1.categoryID);
		System.out.println("Name :"+categoryQuestion1.categoryName);
		System.out.println("\n");
		
		
		// Thông tin TypeQuestion
		System.out.println("Thông tin TypeQuestion");
		System.out.println("id :"+ typeQuestion1.typeID);
		System.out.println("Name :"+ typeQuestion1.typeName);
		System.out.println("\n");
		
		//Thông tin Group
		System.out.println("Thông tin Group");
		System.out.println("id :"+ group1.groupID);
		System.out.println("name :"+ group1.groupName);
		System.out.println("id Người tạo :"+group1.creatorID);
		System.out.println("Ngày tạo :"+ group1.createDate);
		
	}
}

