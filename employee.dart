import 'dart:io';

import 'manager.dart';
import 'person.dart';
import 'email.dart';

class Employee extends Person {
  static int idGenerator = 1;
  int id;
  String title;
  int contractLength;
  DateTime hiringDate;
  DateTime endHiringDate;
  String managerName;
  String managerTitle;
  String managerGender;
  String managerEmail;
  List<Email> receivedEmails = [];
  List<Email> repliedEmails = [];

  Employee({
    required super.name,
    required super.gender,
    required super.address,
    required super.email,
    required super.password,
    required super.phoneNumber,
    required super.salary,
    required this.title,
    required this.contractLength,
    required this.managerName,
    required this.managerTitle,
    required this.managerGender,
    required this.managerEmail,
  })  : id = idGenerator++,
        hiringDate = DateTime.now(),
        endHiringDate = DateTime.now().add(Duration(days: contractLength * 365));

  bool login(String inputEmail, String inputPassword) {
    if (inputEmail == email && inputPassword == password) {
      print('Hello, employee $name have a nice day doing your job');
      return true;
    } else {
      print('Wrong Credentials');
      return false;
    }
  }

  @override
  void viewDetails() {
    print('ID: $id');
    super.viewDetails();
    print('Title: $title');
    print('Hiring date: $hiringDate');
    print('End hiring date: $endHiringDate');
  }

  void managerDetails() {
    print('Your Manager is: $managerName and ${managerGender == 'female' ? 'her' : 'his'} title is: $managerTitle and E-mail is: $managerEmail');
  }

  void receiveEmail(Email email) {
    receivedEmails.add(email);
  }

  void viewEmails() {
    if (receivedEmails.isEmpty) {
      print('No emails to display');
      return;
    }
    for (int i = 0; i < receivedEmails.length; i++) {
      print('Index of email: $i');
      Email email = receivedEmails[i];
      email.viewDetails();
      print('---------------------------------------------------------------------------------------------------------');
    }
  }

  void viewRepliedEmails() {
    if (repliedEmails.isEmpty) {
      print('No emails to display');
      return;
    }
    for (int i = 0; i < receivedEmails.length; i++) {
      Email email = receivedEmails[i];
      email.viewDetails();
      print('---------------------------------------------------------------------------------------------------------');
    }
  }

  void replyToManagerEmail(int emailIndex, Manager manager) {
    if (emailIndex < 0 || emailIndex >= receivedEmails.length) {
      print('Invalid email index');
      return;
    }

    print('Please enter your reply');
    String replyContent = stdin.readLineSync()!;
    Email originalEmail = receivedEmails[emailIndex];
    Email replyEmail = Email(
      sender: super.email, // Employee's email
      recipient: manager.email, // Manager's email
      subject: 'Re: ${originalEmail.subject}',
      content: replyContent,
    );
    repliedEmails.add(replyEmail);
    // Send the reply email through the manager's sendEmail method
    manager.receiveReply(replyEmail); // Notify manager about the reply
    print('Reply sent to ${manager.email}');
    print('Subject: ${replyEmail.subject}');
    print('Content: ${replyEmail.content}');
  }
}
