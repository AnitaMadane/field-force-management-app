import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> activities = [
      {
        "title": "Task Completed",
        "subtitle": "Visit Client A completed",
        "time": "10:00 AM",
      },

      {
        "title": "Checked In",
        "subtitle": "Checked in at ABC Company",
        "time": "11:30 AM",
      },

      {
        "title": "Report Submitted",
        "subtitle": "Daily report uploaded",
        "time": "2:00 PM",
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Activity Timeline")),

      body: ListView.builder(
        itemCount: activities.length,

        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),

            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.history)),

              title: Text(activities[index]["title"]),

              subtitle: Text(activities[index]["subtitle"]),

              trailing: Text(activities[index]["time"]),
            ),
          );
        },
      ),
    );
  }
}
