import 'dart:io';

import 'package:cli_student_grader/cli_student_grader.dart' as cli_student_grader;

void main() {
  //AppTitle
  const String App_Title = "Student Grader v1.0";

  // Available Subjects
  final availableSubjects = {
    "Math",
    "English",
    "Science",
    "ICT"
  };

  //List & Map for Students
  List<Map<String, dynamic>> students = [{
    "Name"   : "Yeasin",
    "Scores" : [89, 91, 81],
    "Subjects": {...availableSubjects},
    "bonus" : null,
    "comment" : null
    },
    {
    "Name"   : "Sadia",
    "Scores" : [85, 92, 78],
    "Subjects": {...availableSubjects},
    "bonus" : 5,
    "comment" : "Good progress"
    },
    {
    "Name"   : "Rahim",
    "Scores" : [60, 70, 65],
    "Subjects": {...availableSubjects},
    "bonus" : null,
    "comment" : null
    }
  ];



//var isRunning = true;

// do{};

// Main Menu
print('''===== $App_Title =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose an option: ''');

var choice = stdin.readLineSync();

switch(choice)
{
  //3. Add Student
  case 1:
        print("Enter Students name:");
        String? name = stdin.readLineSync();

        if (name == null || name.isEmpty) {
          print("Invalid name\n");
          break;
        }
        var student = {
          "Name": name,
          "Scores": [],
          "Subjects": {...availableSubjects},
          "bonus": null,
          "comment": null
        };
        students.add(student);
        print("Student added successfully!\n");
        break;
  //4. Record Score
  case 2:
        if (students.isEmpty) {
          print("No students available.Please add students first.\n");
          break;
        }

        int index = -1;
        while(index < 0 || index >= students.length)
        {
          for (int i = 0; i<students.length; i++)
          {
            print("${i + 1}. ${students[i]["name"]}");
          }

          print("Please Select a students number: ");
          var input = stdin.readLineSync();
          if (input == null || int.tryParse(input) == null) {
            print("Invalid input. Please enter a valid number.\n");
            continue;
          }

        }

 

}









}

