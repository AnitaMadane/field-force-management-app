import 'package:flutter/material.dart';

class VisitScreen extends StatefulWidget {
  const VisitScreen({super.key});

  @override
  State<VisitScreen> createState() => _VisitScreenState();
}

class _VisitScreenState extends State<VisitScreen> {
  List<Map<String, dynamic>> visits = [
    {"client": "ABC Company", "status": "Not Visited"},
    {"client": "XYZ Traders", "status": "Visited"},
  ];

  void toggleVisit(int index) {
    setState(() {
      if (visits[index]["status"] == "Visited") {
        visits[index]["status"] = "Not Visited";
      } else {
        visits[index]["status"] = "Visited";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Visit Tracking")),

      body: ListView.builder(
        itemCount: visits.length,

        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),

            child: ListTile(
              leading: Icon(
                visits[index]["status"] == "Visited"
                    ? Icons.check_circle
                    : Icons.location_on,

                color: visits[index]["status"] == "Visited"
                    ? Colors.green
                    : Colors.red,
              ),

              title: Text(visits[index]["client"]),

              subtitle: Text(visits[index]["status"]),

              trailing: ElevatedButton(
                onPressed: () {
                  toggleVisit(index);
                },

                child: Text(
                  visits[index]["status"] == "Visited" ? "Undo" : "Check In",
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
