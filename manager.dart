import 'dart:io';
import 'email.dart';
import 'person.dart';
import 'employee.dart';

class Manager extends Person {
  static int idGenerator = 1;
  int id;
  int contractLength;
  String title;
  List<Employee> employees = [];
  List<Email> sentEmails = [];
  List<Email> receivedReplies = [];
  DateTime hiringDate;
  DateTime endHiringDate;

  Manager({required super.name, required super.address, required super.email, required super.password, required super.phoneNumber, required super.salary, required super.gender, required this.title, required this.contractLength})
      : id = idGenerator++,
        hiringDate = DateTime.now(),
        endHiringDate = DateTime.now().add(Duration(days: contractLength * 365));

  bool login(String inputEmail, String inputPassword) {
    if (inputEmail == email && inputPassword == password) {
      print('Hello, Manager $name have a nice day doing your job');
      return true;
    } else {
      print('Wrong Credentials');
      return false;
    }
  }

  void addEmployee() {
    print('Please enter employee name');
    String newEmployeeName = stdin.readLineSync()!;
    print('Please enter the Gender');
    String newEmployeeGender = stdin.readLineSync()!;
    print('Please enter employee address');
    String newEmployeeAddress = stdin.readLineSync()!;
    print('Please enter employee salary');
    num newEmployeeSalary = num.parse(stdin.readLineSync()!);
    print('Please Enter phoneNumber');
    String newEmployeePhoneNumber = stdin.readLineSync()!;
    print('Please enter email');
    String newEmployeeEmail = stdin.readLineSync()!;
    print('Please enter a temporary password');
    String newEmployeeTemporaryPassword = stdin.readLineSync()!;
    print('Please enter employee title');
    String newEmployeeTitle = stdin.readLineSync()!;
    print('Please enter employee contract Length (in years)');
    int newEmployeeContractLength = int.parse(stdin.readLineSync()!);

    Employee newEmployee = Employee(
      name: newEmployeeName,
      gender: newEmployeeGender,
      address: newEmployeeAddress,
      salary: newEmployeeSalary,
      phoneNumber: newEmployeePhoneNumber,
      email: newEmployeeEmail,
      password: newEmployeeTemporaryPassword,
      title: newEmployeeTitle,
      contractLength: newEmployeeContractLength,
      managerName: super.name,
      managerTitle: title,
      managerGender: super.gender,
      managerEmail: super.email,
    );
    employees.add(newEmployee);
    print('Employee Added successfully');
  }

  @override
  void viewDetails() {
    print('ID: $id');
    super.viewDetails();
    print('Title: $title');
    print('Hiring Date: $hiringDate');
    print('End work date: $endHiringDate');
  }

  bool editEmployeeInformation() {
    num? newSalary;
    String? newAddress;
    String? newTitle;
    String? newPhoneNumber;
    print('Please enter employee ID you want to edit in information');
    int id = int.parse(stdin.readLineSync()!);
    print('Select what do you want to update in it');
    print('1- Salary');
    print('2- New Address');
    print('3- New Title');
    print('4- Phone Number');
    int option = int.parse(stdin.readLineSync()!);
    switch (option) {
      case 1:
        print('Enter the increase rate you want to increase the salary');
        newSalary = num.parse(stdin.readLineSync()!);
        break;
      case 2:
        print('Enter the new address');
        newAddress = stdin.readLineSync()!;
        break;
      case 3:
        print('Enter the new title');
        newTitle = stdin.readLineSync()!;
        break;
      case 4:
        print('Enter the new phone number');
        newPhoneNumber = stdin.readLineSync()!;
        break;
      default:
        print('Invalid input');
        break;
    }

    for (int i = 0; i < employees.length; i++) {
      if (employees[i].id == id) {
        if (newSalary != null) {
          employees[i].salary += employees[i].salary * newSalary;
          print('Salary updated successfully');
          return true;
        } else if (newAddress != null) {
          employees[i].address = newAddress;
          print('Address updated successfully');
          return true;
        } else if (newTitle != null) {
          employees[i].title = newTitle;
          print('Title updated successfully');
          return true;
        } else if (newPhoneNumber != null) {
          employees[i].phoneNumber = newPhoneNumber;
          print('Phone number updated successfully');
          return true;
        } else {
          print('There is no information you typed to update in ${employees[i].name}');
          return false;
        }
      }
    }
    print('There is no employee with this ID');
    return false;
  }

  bool removeEmployee() {
    print('Please enter the employee ID you want to remove');
    int id = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < employees.length; i++) {
      if (id == employees[i].id) {
        employees.remove(employees[i]);
        print('Employee removed successfully');
        return true;
      }
    }
    print('There is no employee with this ID');
    return false;
  }

  void viewEmployeesDetails() {
    for (int i = 0; i < employees.length; i++) {
      employees[i].viewDetails();
    }
  }

  bool addBonus() {
    bool bonusAdded = false;
    print('Please enter Employee ID you want to add bonus to salary');
    int id = int.parse(stdin.readLineSync()!);
    print('Please enter the bonus (in percentage %) you want to add on employee salary');
    num increaseSalaryRate = num.parse(stdin.readLineSync()!);
    for (int i = 0; i < employees.length; i++) {
      if (employees[i].id == id) {
        bonusAdded = true;
        employees[i].salary += employees[i].salary * increaseSalaryRate;
        print('Bonus added successfully');
        return true;
      }
    }
    print('There is no employee with this ID');
    return false;
  }

  void sendEmail() {
    print('Enter the recipient email:');
    String? recipientEmail = stdin.readLineSync();

    if (recipientEmail == null || recipientEmail.isEmpty) {
      print('Recipient email cannot be empty');
      return;
    }

    print('Enter the subject of the email:');
    String? subject = stdin.readLineSync();

    if (subject == null || subject.isEmpty) {
      print('Subject cannot be empty');
      return;
    }

    print('Enter the content of the email:');
    String? content = stdin.readLineSync();

    if (content == null || content.isEmpty) {
      print('Content cannot be empty');
      return;
    }

    for (Employee emp in employees) {
      if (emp.email == recipientEmail) {
        Email newEmail = Email(sender: super.email, recipient: recipientEmail, subject: subject, content: content);
        emp.receiveEmail(newEmail);
        sentEmails.add(newEmail);
        print('Email sent to $recipientEmail');
        return;
      }
    }
    print('Employee not found');
  }

  void viewSentEmails() {
    if (sentEmails.isEmpty) {
      print('No sent emails to display');
      return;
    }
    for (int i = 0; i < sentEmails.length; i++) {
      Email email = sentEmails[i];
      email.viewDetails();
      print('---------------------------------------------------------------------------------------------------------');
    }
  }

  void viewReceivedReplies() {
    if (receivedReplies.isEmpty) {
      print('No received replies to display');
      return;
    }
    for (int i = 0; i < receivedReplies.length; i++) {
      Email email = receivedReplies[i];
      email.viewDetails();
      print('---------------------------------------------------------------------------------------------------------');
    }
  }

  void receiveReply(Email replyEmail) {
    receivedReplies.add(replyEmail);
  }
}
