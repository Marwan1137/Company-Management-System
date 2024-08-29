import 'dart:io';
import 'ceo.dart';
import 'manager.dart';
import 'employee.dart';

void main() {
  CEO ceo = CEO(
    name: 'marwan',
    address: 'giza',
    email: 'marwan@company.com',
    password: '12345',
    gender: 'Male',
    phoneNumber: '123456789',
    salary: 100000,
  );

  while (true) {
    print('\nWelcome to the Company Management System');
    print('1. CEO Login');
    print('2. Manager Login');
    print('3. Employee Login');
    print('4. Exit');
    print('Enter your choice: ');
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      // CEO login
      print('Enter CEO Email: ');
      String? ceoEmail = stdin.readLineSync();
      print('Enter CEO Password: ');
      String? ceoPassword = stdin.readLineSync();

      if (ceo.login(ceoEmail!, ceoPassword!)) {
        // CEO operations menu
        while (true) {
          print('\nCEO Operations');
          print('1. Add Manager');
          print('2. Edit Manager Information');
          print('3. Remove Manager');
          print('4. View Managers');
          print('5. View Employees');
          print('6. Logout');
          print('Enter your choice: ');
          String? ceoChoice = stdin.readLineSync();

          switch (ceoChoice) {
            case '1':
              ceo.addManager();
              break;
            case '2':
              ceo.editManagerInformation();
              break;
            case '3':
              ceo.removeManager();
              break;
            case '4':
              ceo.viewManagers();
              break;
            case '5':
              ceo.viewEmployees();
              break;
            case '6':
              print('Logging out...');
              break;
            default:
              print('Invalid choice, please try again.');
          }

          if (ceoChoice == '6') break;
        }
      }
    } else if (choice == '2') {
      // Manager login
      print('Enter Manager Email: ');
      String? managerEmail = stdin.readLineSync();
      print('Enter Manager Password: ');
      String? managerPassword = stdin.readLineSync();

      Manager? loggedInManager;

      for (Manager manager in ceo.managers) {
        if (manager.login(managerEmail!, managerPassword!)) {
          loggedInManager = manager;
          break;
        }
      }

      if (loggedInManager != null) {
        // Manager operations menu
        while (true) {
          print('\nManager Operations');
          print('1. Add Employee');
          print('2. Edit Employee Information');
          print('3. Remove Employee');
          print('4. View Employees');
          print('5. Send Email');
          print('6. View Sent Emails');
          print('7. View Received Replies');
          print('8. Logout');
          print('Enter your choice: ');
          String? managerChoice = stdin.readLineSync();

          switch (managerChoice) {
            case '1':
              loggedInManager.addEmployee();
              break;
            case '2':
              loggedInManager.editEmployeeInformation();
              break;
            case '3':
              loggedInManager.removeEmployee();
              break;
            case '4':
              loggedInManager.viewEmployeesDetails();
              break;
            case '5':
              loggedInManager.sendEmail();
              break;
            case '6':
              loggedInManager.viewSentEmails();
              break;
            case '7':
              loggedInManager.viewReceivedReplies();
              break;
            case '8':
              print('Logging out...');
              break;
            default:
              print('Invalid choice, please try again.');
          }

          if (managerChoice == '8') break;
        }
      } else {
        print('Invalid Manager credentials.');
      }
    } else if (choice == '3') {
      // Employee login
      print('Enter Employee Email: ');
      String? employeeEmail = stdin.readLineSync();
      print('Enter Employee Password: ');
      String? employeePassword = stdin.readLineSync();

      Employee? loggedInEmployee;

      // Loop through all managers and their employees to find the employee with matching credentials
      for (Manager manager in ceo.managers) {
        for (Employee employee in manager.employees) {
          if (employee.login(employeeEmail!, employeePassword!)) {
            loggedInEmployee = employee;
            break;
          }
        }
      }

      if (loggedInEmployee != null) {
        // Employee operations menu
        while (true) {
          print('\nEmployee Operations');
          print('1. View Details');
          print('2. View Manager Details');
          print('3. View Emails');
          print('4. View Replied Emails');
          print('5. Reply to Manager Email');
          print('6. Logout');
          print('Enter your choice: ');
          String? employeeChoice = stdin.readLineSync();

          switch (employeeChoice) {
            case '1':
              loggedInEmployee.viewDetails();
              break;
            case '2':
              loggedInEmployee.managerDetails();
              break;
            case '3':
              loggedInEmployee.viewEmails();
              break;
            case '4':
              loggedInEmployee.viewRepliedEmails();
              break;
            case '5':
              print('Enter the index of the email you want to reply to: ');
              int emailIndex = int.parse(stdin.readLineSync()!);
              loggedInEmployee.replyToManagerEmail(emailIndex, ceo.managers.firstWhere((manager) => manager.email == loggedInEmployee!.managerEmail));
              break;
            case '6':
              print('Logging out...');
              break;
            default:
              print('Invalid choice, please try again.');
          }

          if (employeeChoice == '6') break;
        }
      } else {
        print('Invalid Employee credentials.');
      }
    } else if (choice == '4') {
      print('Exiting...');
      break;
    } else {
      print('Invalid choice, please try again.');
    }
  }
}
