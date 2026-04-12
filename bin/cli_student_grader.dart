import 'dart:io';

import 'package:cli_student_grader/cli_student_grader.dart'
    as cli_student_grader;

void main() {
  //AppTitle
  const String App_Title = "Student Grader v1.0";

  // Available Subjects
  final availableSubjects = {"Math", "English", "Science", "ICT"};

  //List & Map for Students
  List<Map<String, dynamic>> students = [
    {
      "Name": "Yeasin",
      "Scores": [89, 91, 81],
      "Subjects": {...availableSubjects},
      "bonus": null,
      "comment": null
    },
    {
      "Name": "Sadia",
      "Scores": [85, 92, 78],
      "Subjects": {...availableSubjects},
      "bonus": 5,
      "comment": "Good progress"
    },
    {
      "Name": "Akash",
      "Scores": [60, 70, 65],
      "Subjects": {...availableSubjects},
      "bonus": null,
      "comment": null
    }
  ];

  var isRunning = true;

  do {
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

    switch (choice) {
      //3. Add Student
      case "1":
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
      case "2":
        if (students.isEmpty) {
          print("No students available.\n");
          break;
        }

        int index;
        while (true) {
          for (int i = 0; i < students.length; i++) {
            print("${i + 1}. ${students[i]["name"]}");
          }

          print("Select student:");
          var input = stdin.readLineSync();

          var num = int.tryParse(input ?? "");
          if (num != null && num >= 1 && num <= students.length) {
            index = num - 1;
            break;
          }

          print("Invalid student number!");
        }

        var student = students[index];
        var subjects = student["subjects"] as Set<String>;
        print("Available subjects:");
        for (var sub in subjects) {
          print("- $sub");
        }

        String subject;
        while (true) {
          print("Enter subject:");
          var input = stdin.readLineSync();

          if (input != null && subjects.contains(input)) {
            subject = input;
            break;
          }

          print("Invalid subject!");
        }

        int score;
        while (true) {
          print("Enter score (0-100):");
          var input = stdin.readLineSync();

          var num = int.tryParse(input ?? "");
          if (num != null && num >= 0 && num <= 100) {
            score = num;
            break;
          }
          print("Invalid score!");
        }

        (student["scores"] as List<int>).add(score);
        print("Score $score added for $subject.\n");
        break;
      //Bonus Add
      case "3":
        if (students.isEmpty) {
          print("No students available.\n");
          break;
        }

        int index;
        while (true) {
          for (int i = 0; i < students.length; i++) {
            print("${i + 1}. ${students[i]["name"]}");
          }

          print("Select student:");
          var input = stdin.readLineSync();

          var num = int.tryParse(input ?? "");
          if (num != null && num >= 1 && num <= students.length) {
            index = num - 1;
            break;
          }

          print("Invalid student number!");
        }

        var student = students[index];
        int bonus = 0;
        while (bonus < 1 || bonus > 10) {
          print("Enter bonus (1–10): ");
          var input = stdin.readLineSync();

          if (input == null || int.tryParse(input) == null) {
            print("Invalid number!");
            continue;
          }

          bonus = int.parse(input);
        }

        if (student["bonus"] == null) {
          student["bonus"] ??= bonus;
          print("Bonus added!\n");
        } else {
          print("Bonus already exists!\n");
        }
        break;
      // Add Comment
      case "4":
        if (students.isEmpty) {
          print("No students available.\n");
          break;
        }

        int index;
        while (true) {
          for (int i = 0; i < students.length; i++) {
            print("${i + 1}. ${students[i]["name"]}");
          }

          print("Select student:");
          var input = stdin.readLineSync();

          var num = int.tryParse(input ?? "");
          if (num != null && num >= 1 && num <= students.length) {
            index = num - 1;
            break;
          }

          print("Invalid student number!");
        }

        var student = students[index];
        print("Enter comment: ");
        var comment = stdin.readLineSync();

        if (comment == null || comment.isEmpty) {
          print("Invalid comment!\n");
          break;
        }

        student["comment"] ??= comment;
        print("Comment added!\n");
        break;

      
    }
  } while (isRunning);
}
