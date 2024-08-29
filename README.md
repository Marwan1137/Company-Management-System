

<h1 align="center" style="font-weight: bold;">Company Management System</h1>


<p align="center">The Company Management System is a command-line application developed in Dart. It simulates a hierarchical management system with three types of users: CEO, Manager, and Employee. Each user type has specific functionalities, allowing them to perform various operations related to their roles within the company.</p>


<p align="center">
<a href="https://github.com/Marwan1137/Company-Management-System/tree/main">📱 Visit this Project</a>
</p>

<h2 id="technologies">💻 Technologies</h2>

1- Dart: The programming language used to develop the command-line application.

2- Dart SDK (version 2.14.0 or later): Required for running and developing Dart applications.

3- IDE/Text Editor: Tools such as Visual Studio Code or IntelliJ IDEA used for writing and editing code.

<h2 id="started">🚀 Getting started</h2>

Now, this a detailed explanation for how to run this project

<h3>Prerequisites</h3>

```bash
1- Dart SDK

Version: Dart SDK version 2.14.0 or later.
Installation:
Windows:
 1. Download the Dart SDK from the Dart SDK page.

 2. Extract the downloaded ZIP file to a directory of your choice.

 3. Add the Dart SDK's bin directory to your system PATH:
           - Open the Control Panel.
           - Go to System and Security > System > Advanced system settings.
           - Click on the "Environment Variables" button.
           - In the "System variables" section, find and select the "Path" variable, 
           - then click "Edit."
           - Add the path to the Dart SDK bin directory (e.g., C:\dart\dart-sdk\bin).
```
Then open a new Command Prompt or PowerShell window and verify the installation by running:
```bash
 dart --version
```
```bash
2- IDE or Text Editor
    1. Visual Studio Code (VS Code):
           - Download and install VS Code from the Visual Studio Code website.
           - Install the Dart extension for VS Code:
           - Open VS Code.
           - Go to Extensions (or press Ctrl+Shift+X).
           - Search for "Dart" and install the Dart extension.

    2. IntelliJ IDEA:
           - Download and install IntelliJ IDEA from the IntelliJ IDEA website.
           - Install the Dart plugin:
           - Open IntelliJ IDEA.
           - Go to File > Settings (or Preferences on macOS) > Plugins.
           - Search for "Dart" and install the Dart plugin.
           -  Restart IntelliJ IDEA if prompted.
```






<h3>Cloning</h3>

How to clone  project

```bash
git clone https://github.com/Marwan1137/Company-Management-System.git
```

<h3>Starting</h3>

How to start the project

```bash
1- main.dart

- Purpose: Entry point of the application.
- Functionality:
      - Initializes the application.
      - Displays the main menu and manages user authentication.
      - Routes the user to different functionalities based on the selected role (CEO, Manager, Employee).
```

```bash
2- ceo.dart
     - Purpose: Contains the CEO class, which manages managers and employees.
     - Functionality:
          - Methods to add, edit, and remove managers.
          - Methods to view the list of managers and employees.
```
```bash
3- manager.dart
        - Purpose: Contains the Manager class, responsible for managing employees.
        - Functionality:
              - Methods to add, edit, and remove employees.
              - Methods to send and view emails to/from employees.
```
```bash
4- employee.dart
        - Purpose: Contains the Employee class, which allows employees to view personal 
           details and reply to emails.
        - Functionality:
             - Methods to view personal details.
             - Methods to view manager details.
             - Methods to reply to manager’s emails.
```









<h3>Documentations that might help</h3>

[📝For any problem facing you you can email me on marwan.hakil79@gmail.com]
