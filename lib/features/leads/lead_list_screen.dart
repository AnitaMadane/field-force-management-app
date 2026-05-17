import 'package:flutter/material.dart';
import 'lead_detail_screen.dart';

class LeadListScreen extends StatefulWidget {
  final String role;

  const LeadListScreen({super.key, required this.role});

  @override
  State<LeadListScreen> createState() => _LeadListScreenState();
}

class _LeadListScreenState extends State<LeadListScreen> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> allLeads = [
    {
      "name": "Rahul Sharma",
      "status": "New",
      "priority": "High",
      "assignedTo": "Field Executive",
      "escalated": false,
    },

    {
      "name": "Priya Mehta",
      "status": "In Progress",
      "priority": "Medium",
      "assignedTo": "Team Lead",
      "escalated": true,
    },

    {
      "name": "Amit Verma",
      "status": "Closed",
      "priority": "Low",
      "assignedTo": "Field Executive",
      "escalated": false,
    },
  ];

  List<Map<String, dynamic>> filteredLeads = [];

  @override
  void initState() {
    super.initState();
    applyRoleFilter();
  }

  void applyRoleFilter() {
    if (widget.role == "Field Agent") {
      filteredLeads = allLeads.where((lead) {
        return lead["assignedTo"] == "Field Executive";
      }).toList();
    } else {
      filteredLeads = List.from(allLeads);
    }
  }

  void searchLead(String value) {
    setState(() {
      filteredLeads = allLeads.where((lead) {
        return lead["name"].toLowerCase().contains(value.toLowerCase());
      }).toList();
    });
  }

  Future<void> refreshLeads() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {});
  }

  Color getPriorityColor(String priority) {
    switch (priority) {
      case "High":
        return Colors.red;

      case "Medium":
        return Colors.orange;

      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lead Management")),

      body: RefreshIndicator(
        onRefresh: refreshLeads,

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),

              child: TextField(
                controller: searchController,

                onChanged: searchLead,

                decoration: InputDecoration(
                  hintText: "Search Lead",

                  prefixIcon: const Icon(Icons.search),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            Expanded(
              child: filteredLeads.isEmpty
                  ? const Center(
                      child: Text(
                        "No Leads Found",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredLeads.length,

                      itemBuilder: (context, index) {
                        final lead = filteredLeads[index];

                        return Card(
                          margin: const EdgeInsets.all(10),

                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (_) => LeadDetailScreen(
                                    lead: lead,
                                    role: widget.role,
                                  ),
                                ),
                              );
                            },

                            title: Text(lead["name"]),

                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text("Status: ${lead["status"]}"),

                                Text("Assigned: ${lead["assignedTo"]}"),

                                Text(
                                  "Priority: ${lead["priority"]}",

                                  style: TextStyle(
                                    color: getPriorityColor(lead["priority"]),

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            trailing: lead["escalated"]
                                ? const Icon(Icons.warning, color: Colors.red)
                                : null,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
