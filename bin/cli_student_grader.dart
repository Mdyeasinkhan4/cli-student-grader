import 'package:cli_student_grader/cli_student_grader.dart' as cli_student_grader;

void main() {
  const String App_Title = "Student Grader v1.0";

  final Set<String> availableSubjects = {
    "Math",
    "English",
    "Science",
    "Islam"
  };

  List<Map<String, dynamic>> students = [{
    "Name"   : "Yeasin",
    "Scores" : [89, 91, 81],
    "Subjects": {...availableSubjects},
    "bonus" : null,
    "comment" : null
    },
    {
    "Name"   : "Fatima",
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



}

