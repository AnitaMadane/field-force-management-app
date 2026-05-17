import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Map<String, dynamic>> tasks = [
    {"title": "Visit Client A", "status": "Pending"},
    {"title": "Collect Documents", "status": "Completed"},
    {"title": "Submit Daily Report", "status": "In Progress"},
  ];

  void updateStatus(int index, String status) {
    setState(() {
      tasks[index]["status"] = status;
    });
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;

      case "In Progress":
        return Colors.orange;

      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task Management")),

      body: ListView.builder(
        itemCount: tasks.length,

        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),

            child: ListTile(
              title: Text(tasks[index]["title"]),

              subtitle: Text(
                tasks[index]["status"],

                style: TextStyle(
                  color: getStatusColor(tasks[index]["status"]),

                  fontWeight: FontWeight.bold,
                ),
              ),

              trailing: DropdownButton<String>(
                value: tasks[index]["status"],

                items: const [
                  DropdownMenuItem(value: "Pending", child: Text("Pending")),

                  DropdownMenuItem(
                    value: "In Progress",
                    child: Text("In Progress"),
                  ),

                  DropdownMenuItem(
                    value: "Completed",
                    child: Text("Completed"),
                  ),
                ],

                onChanged: (value) {
                  updateStatus(index, value!);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
