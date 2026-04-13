import 'dart:io';

void main() {
  //App Title
  const String App_Title = "Student Grader v1.0";
  //Subjects
  final availableSubjects = {"Math", "English", "Science", "ICT"};

  //List of Students using Map
  List<Map<String, dynamic>> students = [
    {
      "name": "Yeasin",
      "scores": <int>[89, 91, 81],
      "subjects": {...availableSubjects},
      "bonus": null,
      "comment": null
    },
    {
      "name": "Sadia",
      "scores": <int>[85, 92, 78],
      "subjects": {...availableSubjects},
      "bonus": 5,
      "comment": "Good progress"
    },
    {
      "name": "Akash",
      "scores": <int>[60, 70, 65],
      "subjects": {...availableSubjects},
      "bonus": null,
      "comment": null
    }
  ];
  // Application State
  var isRunning = true;

  // Main application loop
  do {
    // Display the main menu
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
      // Add Student
      case "1":
        print("Enter Students name:");
        String? name = stdin.readLineSync();

        if (name == null || name.isEmpty) {
          print("Invalid name\n");
          break;
        }

        var student = {
          "name": name,
          "scores": <int>[],
          "subjects": {...availableSubjects},
          "bonus": null,
          "comment": null
        };

        students.add(student);
        print("Student added successfully!\n");
        break;

      // Record Score
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

      // Bonus Add
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

        student["comment"] = comment;
        print("Comment added!\n");
        break;

      // View Students
      case "5":
        for (var s in students) {
          var tags = [
            s["name"],
            "${(s["scores"] as List<int>).length} scores",
            if (s["bonus"] != null) "⭐ Has Bonus"
          ];

          print(tags.join(" | "));
        }
        print("");
        break;

      // Report card
      case "6":
        if (students.isEmpty) break;

        int index = -1;
        while (index < 0 || index >= students.length) {
          for (int i = 0; i < students.length; i++) {
            print("${i + 1}. ${students[i]["name"]}");
          }

          print("Select student:");
          var input = stdin.readLineSync();

          if (input == null || int.tryParse(input) == null) {
            print("Invalid input!");
            continue;
          }

          index = int.parse(input) - 1;
        }

        var student = students[index];
        var scores = student["scores"] as List<int>;

        if (scores.isEmpty) {
          print("No scores available.\n");
          break;
        }

        var sum = 0;
        for (var s in scores) {
          sum += s;
        }

        var avg = sum / scores.length;

        var finalAvg = avg + ((student["bonus"] as int?) ?? 0);
        if (finalAvg > 100) finalAvg = 100;

        String grade;
        if (finalAvg >= 90) {
          grade = "A";
        } else if (finalAvg >= 80) {
          grade = "B";
        } else if (finalAvg >= 70) {
          grade = "C";
        } else if (finalAvg >= 60) {
          grade = "D";
        } else {
          grade = "F";
        }

        String comment = (student["comment"] as String?)?.toUpperCase() ??
            "No comment provided";

        String feedback = switch (grade) {
          "A" => "Outstanding!",
          "B" => "Good!",
          "C" => "Average",
          "D" => "Improve",
          "F" => "Fail",
          _ => "Unknown"
        };

        print("""
╔═════════════════════════════════════════════╗
║       REPORT CARD                           ║
╠═════════════════════════════════════════════╝
║ Name:    ${student["name"]}                 ║
║ Scores:  $scores                            ║
║ Bonus:   +${(student["bonus"] as int?) ?? 0}║
║ Average: ${finalAvg.toStringAsFixed(1)}     ║
║ Grade:   $grade                             ║
║ Comment: $comment                           ║
║ Feedback: $feedback                         ║
╚═════════════════════════════════════════════╝
""");
        break;

      // CLASS SUMMARY
      case "7":
        var total = students.length;
        var totalAvg = 0.0;
        var highest = 0.0;
        var lowest = 100.0;
        var passCount = 0;

        var gradeSet = <String>{};

        var summaryLines = [
          for (var s in students) "${s["name"]}: ${s["scores"]}"
        ];

        for (var s in students) {
          var scores = s["scores"] as List<int>;
          if (scores.isEmpty) continue;

          var sum = 0;
          for (var sc in scores) {
            sum += sc;
          }

          var avg = sum / scores.length;

          if (avg > highest) highest = avg;
          if (avg < lowest) lowest = avg;

          totalAvg += avg;

          if (scores.isNotEmpty && avg >= 60) {
            passCount++;
          }

          if (avg >= 90) {
            gradeSet.add("A");
          } else if (avg >= 80) {
            gradeSet.add("B");
          } else if (avg >= 70) {
            gradeSet.add("C");
          } else if (avg >= 60) {
            gradeSet.add("D");
          } else {
            gradeSet.add("F");
          }
        }

        var classAvg = total > 0 ? totalAvg / total : 0;

        print("""
Class Summary:
Total Students: $total
Class Avg: ${classAvg.toStringAsFixed(2)}
Highest: ${highest.toStringAsFixed(2)}
Lowest: ${lowest.toStringAsFixed(2)}
Passing: $passCount
Grades: $gradeSet

${summaryLines.join("\n")}
""");
        break;
      // Application Exit
      case "8":
        isRunning = false;
        print("Exiting...");
        break;

      default:
        print("Invalid option! Try again.\n");
    }
  } while (isRunning);
}