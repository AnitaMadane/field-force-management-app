import 'package:flutter/material.dart';
import '../tasks/task_screen.dart';
import '../visits/visit_screen.dart';
import '../activity/activity_screen.dart';
import '../ai/ai_screen.dart';
import '../leads/lead_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  final String role;

  const DashboardScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> modules = [];

    // ADMIN / MANAGER / TEAM LEAD
    if (role == "Admin" || role == "Manager" || role == "Team Lead") {
      modules.add({"title": "Task Management", "icon": Icons.task});
    }

    // FIELD AGENT
    if (role == "Field Agent") {
      modules.add({"title": "My Tasks", "icon": Icons.task_alt});
    }

    // COMMON MODULES
    modules.addAll([
      {"title": "Lead Management", "icon": Icons.people},

      {"title": "Visits", "icon": Icons.location_on},

      {"title": "Activity", "icon": Icons.history},

      {"title": "AI Suggestions", "icon": Icons.smart_toy},
    ]);

    return Scaffold(
      appBar: AppBar(title: Text("$role Dashboard"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.builder(
          itemCount: modules.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),

          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

                gradient: LinearGradient(
                  colors: [Colors.indigo.shade400, Colors.indigo.shade700],

                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              child: InkWell(
                borderRadius: BorderRadius.circular(20),

                onTap: () {
                  String title = modules[index]["title"];

                  // TASK SCREEN
                  if (title == "Task Management" || title == "My Tasks") {
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (_) => const TaskScreen()),
                    );
                  }
                  // LEAD MANAGEMENT
                  else if (title == "Lead Management") {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (_) => LeadListScreen(role: role),
                      ),
                    );
                  }
                  // VISITS
                  else if (title == "Visits") {
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (_) => const VisitScreen()),
                    );
                  }
                  // ACTIVITY
                  else if (title == "Activity") {
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (_) => const ActivityScreen()),
                    );
                  }
                  // AI SUGGESTIONS
                  else if (title == "AI Suggestions") {
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (_) => const AIScreen()),
                    );
                  }
                },

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(modules[index]["icon"], size: 45, color: Colors.white),

                    const SizedBox(height: 15),

                    Text(
                      modules[index]["title"],

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
