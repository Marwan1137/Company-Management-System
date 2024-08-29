import 'dart:io';

import 'employee.dart';
import 'person.dart';
import 'manager.dart';

class CEO extends Person {
  List<Manager> managers = [];
  List<Employee> employees = [];

  CEO({required super.name, required super.address, required super.email, required super.password, required super.gender, required super.phoneNumber, required super.salary});

  bool login(String inputEmail, String inputPassword) {
    if (inputEmail == email && inputPassword == password) {
      print('Hello, CEO $name have a nice day doing your job today');
      return true;
    } else {
      print('Wrong Credentials');
      return false;
    }
  }

  void addManager() {
    print('Please enter manager name');
    String newManagerName = stdin.readLineSync()!;
    print('Please enter the Gender');
    String newManagerGender = stdin.readLineSync()!;
    print('Please enter manager address');
    String newManagerAddress = stdin.readLineSync()!;
    print('Please enter manager salary');
    num newManagerSalary = num.parse(stdin.readLineSync()!);
    print('Please Enter manager phoneNumber');
    String newManagerPhoneNumber = stdin.readLineSync()!;
    print('Please enter manager email');
    String newManagerEmail = stdin.readLineSync()!;
    print('Please enter a temporary password');
    String newManagerTemporaryPassword = stdin.readLineSync()!;
    print('Please enter manager title');
    String newManagerTitle = stdin.readLineSync()!;
    print('Please enter manager contract Length (in years)');
    int newManagerContractLength = int.parse(stdin.readLineSync()!);

    Manager newManager = Manager(
      name: newManagerName,
      gender: newManagerGender,
      address: newManagerAddress,
      salary: newManagerSalary,
      phoneNumber: newManagerPhoneNumber,
      email: newManagerEmail,
      password: newManagerTemporaryPassword,
      title: newManagerTitle,
      contractLength: newManagerContractLength,
    );
    managers.add(newManager);
    print('Manager Added successfully');
  }

  bool editManagerInformation() {
    num? newSalary;
    String? newAddress;
    String? newTitle;
    String? newPhoneNumber;
    num? increaseSalaryPercentage;
    print('Please enter manager ID you want to edit in information');
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

    for (int i = 0; i < managers.length; i++) {
      if (managers[i].id == id) {
        if (newSalary != null) {
          managers[i].salary += managers[i].salary * newSalary;
          print('Salary updated successfully');
          return true;
        } else if (newAddress != null) {
          managers[i].address = newAddress;
          print('Address updated successfully');
          return true;
        } else if (newTitle != null) {
          managers[i].title = newTitle;
          print('Title updated successfully');
          return true;
        } else if (newPhoneNumber != null) {
          managers[i].phoneNumber = newPhoneNumber;
          print('Phone number updated successfully');
          return true;
        } else {
          print('There is no information you typed to update in ${managers[i].name}');
          return false;
        }
      }
    }
    print('There is no manager with this ID');
    return false;
  }

  bool removeManager() {
    print('Please enter manager ID you want to remove');
    int id = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < managers.length; i++) {
      if (id == managers[i].id) {
        managers.remove(managers[i]);
        print('Manager removed successfully');
        return true;
      }
    }
    print('There is no employee with this ID');
    return false;
  }

  void viewManagers() {
    print('hello');
    for (int i = 0; i < managers.length; i++) {
      managers[i].viewDetails();
      print('---------------------------------------------------------------------------');
    }
  }

  void viewEmployees() {
    for (int i = 0; i < managers.length; i++) {
      managers[i].employees[i].viewDetails();
      print('---------------------------------------------------------------------------');
    }
  }
}
