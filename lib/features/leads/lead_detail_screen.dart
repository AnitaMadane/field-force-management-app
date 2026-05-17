import 'package:flutter/material.dart';

class LeadDetailScreen extends StatefulWidget {
  final Map<String, dynamic> lead;
  final String role;

  const LeadDetailScreen({super.key, required this.lead, required this.role});

  @override
  State<LeadDetailScreen> createState() => _LeadDetailScreenState();
}

class _LeadDetailScreenState extends State<LeadDetailScreen> {
  late String selectedStatus;
  late String assignedPerson;

  TextEditingController notesController = TextEditingController();

  List<String> notes = [];

  bool escalated = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    selectedStatus = widget.lead["status"];

    escalated = widget.lead["escalated"];

    assignedPerson = widget.lead["assignedTo"];
  }

  void addNote() {
    if (notesController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter a note")));

      return;
    }

    setState(() {
      notes.add(notesController.text);

      notesController.clear();
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Note added")));
  }

  bool canReassign() {
    return widget.role == "Admin" ||
        widget.role == "Manager" ||
        widget.role == "Team Lead";
  }

  bool canResolveEscalation() {
    return widget.role == "Admin" || widget.role == "Manager";
  }

  Future<void> updateStatus(String value) async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      selectedStatus = value;
      isLoading = false;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Status updated to $value")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lead Details")),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // LEAD CARD
                  Card(
                    elevation: 4,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(16),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.indigo,
                              ),

                              const SizedBox(width: 10),

                              Text(
                                widget.lead["name"],

                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          // ASSIGN
                          Row(
                            children: [
                              const Icon(
                                Icons.assignment_ind,
                                color: Colors.blue,
                              ),

                              const SizedBox(width: 10),

                              const Text("Assigned To:"),

                              const SizedBox(width: 15),

                              DropdownButton<String>(
                                value: assignedPerson,

                                items: const [
                                  DropdownMenuItem(
                                    value: "Field Executive",
                                    child: Text("Field Executive"),
                                  ),

                                  DropdownMenuItem(
                                    value: "Team Lead",
                                    child: Text("Team Lead"),
                                  ),

                                  DropdownMenuItem(
                                    value: "Manager",
                                    child: Text("Manager"),
                                  ),
                                ],

                                onChanged: canReassign()
                                    ? (value) {
                                        setState(() {
                                          assignedPerson = value!;
                                        });

                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text("Assigned to $value"),
                                          ),
                                        );
                                      }
                                    : null,
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          // STATUS
                          Row(
                            children: [
                              const Icon(Icons.sync, color: Colors.orange),

                              const SizedBox(width: 10),

                              const Text("Status:"),

                              const SizedBox(width: 15),

                              DropdownButton<String>(
                                value: selectedStatus,

                                items: const [
                                  DropdownMenuItem(
                                    value: "New",
                                    child: Text("New"),
                                  ),

                                  DropdownMenuItem(
                                    value: "In Progress",
                                    child: Text("In Progress"),
                                  ),

                                  DropdownMenuItem(
                                    value: "Closed",
                                    child: Text("Closed"),
                                  ),
                                ],

                                onChanged: (value) {
                                  updateStatus(value!);
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          // ESCALATION
                          Row(
                            children: [
                              const Icon(Icons.warning, color: Colors.red),

                              const SizedBox(width: 10),

                              const Text("Escalated:"),

                              const SizedBox(width: 10),

                              escalated
                                  ? const Text(
                                      "YES",

                                      style: TextStyle(
                                        color: Colors.red,

                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : const Text("NO"),
                            ],
                          ),

                          const SizedBox(height: 20),

                          ElevatedButton.icon(
                            onPressed: () {
                              if (escalated && !canResolveEscalation()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Only Admin or Manager can resolve escalation",
                                    ),
                                  ),
                                );

                                return;
                              }

                              setState(() {
                                escalated = !escalated;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    escalated
                                        ? "Lead escalated"
                                        : "Escalation resolved",
                                  ),
                                ),
                              );
                            },

                            icon: const Icon(Icons.warning),

                            label: Text(
                              escalated
                                  ? "Resolve Escalation"
                                  : "Escalate Lead",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // AI
                  const Row(
                    children: [
                      Icon(Icons.smart_toy, color: Colors.indigo),

                      SizedBox(width: 10),

                      Text(
                        "AI Suggestion",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),

                      child: Text(
                        selectedStatus == "New"
                            ? "AI Suggestion: Contact lead within 2 hours."
                            : selectedStatus == "In Progress"
                            ? "AI Suggestion: Schedule follow-up meeting."
                            : "AI Suggestion: Request customer feedback.",
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // NOTES
                  const Row(
                    children: [
                      Icon(Icons.note_alt, color: Colors.green),

                      SizedBox(width: 10),

                      Text(
                        "Add Notes",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    controller: notesController,

                    decoration: InputDecoration(
                      hintText: "Enter note",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton.icon(
                    onPressed: addNote,

                    icon: const Icon(Icons.add),

                    label: const Text("Add Note"),
                  ),

                  const SizedBox(height: 25),

                  // TIMELINE
                  const Row(
                    children: [
                      Icon(Icons.history, color: Colors.deepPurple),

                      SizedBox(width: 10),

                      Text(
                        "Activity Timeline",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  ...notes.map(
                    (note) => Card(
                      child: ListTile(
                        leading: const Icon(Icons.note),

                        title: Text(note),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
