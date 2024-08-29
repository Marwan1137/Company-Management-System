class Person {
  String name;
  String address;
  String email;
  String password;
  num salary;
  String phoneNumber;
  String gender;

  Person({
    required this.name,
    required this.address,
    required this.email,
    required this.password,
    required this.salary,
    required this.phoneNumber,
    required this.gender,
  });

  void viewDetails() {
    print('Name: $name');
    print('Address: $address');
    print('E-mail: $email');
    print('Salary: $salary');
    print('Phone Number: $phoneNumber');
  }
}
