# 🎓 CLI Student Grader (Dart)

A command-line application built using **Dart** that allows teachers to manage students, record scores, calculate grades, and generate formatted report cards.

This project is designed to practice core programming concepts from Weeks 1–2, including control flow, collections, null safety, and user interaction.

---

## 🚀 Features

- ✅ Add new students
- ✅ Record scores with validation
- ✅ Assign bonus points (optional)
- ✅ Add teacher comments (optional)
- ✅ View all students
- ✅ Generate detailed report cards
- ✅ Display class summary statistics
- ✅ Menu-driven CLI (runs in loop)

---

## 🧠 Concepts Covered

This project demonstrates:

- Variables: `var`, `final`, `const`
- Null safety: `int?`, `String?`, `??`, `??=`, `?.`
- Control flow: `if`, `else if`, `switch`
- Loops: `for`, `for-in`, `while`, `do-while`
- Collections: `List`, `Set`, `Map`
- Advanced Dart:
  - Collection `if`
  - Collection `for`
  - Spread operator (`...`)
- String interpolation & multi-line strings

---

## 📦 Data Structure

Each student is stored as:

```dart
{
  "name": "Fatima",
  "scores": [85, 92, 78],
  "subjects": {"Math", "English", "Science"},
  "bonus": null,
  "comment": null
}

All students are stored in:

List<Map<String, dynamic>> students = [];
📋 Menu
===== Student Grader v1.0 =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit
🧾 Sample Report Card
╔══════════════════════════════╗
║       REPORT CARD            ║
╠══════════════════════════════╝
║  Name:    Fatima             ║
║  Scores:  [85, 92, 78]       ║
║  Bonus:   +5                 ║
║  Average: 90.0               ║
║  Grade:   A                  ║
║  Comment: GREAT IMPROVEMENT  ║
╚══════════════════════════════╝
🧮 Grading System
Average	Grade
90+	      A
80–89	    B
70–79	    C
60–69    	D
<60	      F
📊 Class Summary

Displays:

Total students
Class average
Highest & lowest averages
Passing students
Unique grade distribution
🛠️ Installation & Run
1. Clone Repository
git clone https://github.com/your-username/cli-student-grader.git
cd cli-student-grader
2. Run the App
dart run
📁 Project Structure
cli-student-grader/
│── bin/
│   └── cli_student_grader.dart
│── pubspec.yaml
│── README.md
🧑‍💻 Commit History (Example)
feat: add menu loop and switch routing
feat: add student creation with spread operator
feat: record scores with validation loop
feat: add bonus and comment with null-aware operators
feat: generate report card with grade calculation
feat: add class summary with collection for/if
🎯 Learning Outcome

By completing this project, you will:

Understand how to build CLI apps in Dart
Practice real-world data handling using collections
Apply null safety effectively
Strengthen logic building and control flow
📌 Author
Your Name
CSE Student
⭐ Feedback

If you find this project helpful, consider giving it a ⭐ on GitHub!


---

## 🔥 Bonus (Optional Upgrade Ideas)
If you want extra marks:
- Save/load data from file
- Add delete student option
- Add subject-wise grading
- Convert to Flutter UI later

---

If you want, I can also:
- ✅ :contentReference[oaicite:0]{index=0}
- ✅ :contentReference[oaicite:1]{index=1}
- ✅ :contentReference[oaicite:2]{index=2}

Just tell me 👍
