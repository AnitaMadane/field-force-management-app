import 'package:flutter/material.dart';

class AIScreen extends StatelessWidget {
  const AIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> suggestions = [
      "Complete high priority tasks first",

      "Visit nearby clients to save travel time",

      "Follow up pending reports before 5 PM",

      "Focus on clients with overdue payments",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("AI Suggestions")),

      body: ListView.builder(
        itemCount: suggestions.length,

        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),

            child: ListTile(
              leading: const Icon(Icons.smart_toy, size: 35),

              title: Text(suggestions[index]),
            ),
          );
        },
      ),
    );
  }
}
