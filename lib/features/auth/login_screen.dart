import 'package:flutter/material.dart';
import '../dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = "Admin";

  final List<String> roles = ["Admin", "Manager", "Team Lead", "Field Agent"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Field Force Login")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(
              Icons.admin_panel_settings,

              size: 100,
              color: Colors.indigo,
            ),

            const SizedBox(height: 20),

            const Text(
              "Login As",

              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              initialValue: selectedRole,

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              items: roles.map((role) {
                return DropdownMenuItem(value: role, child: Text(role));
              }).toList(),

              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (_) => DashboardScreen(role: selectedRole),
                  ),
                );
              },

              child: const Text("Login"),
            ),

            const SizedBox(height: 40),

            // DEMO CREDENTIALS
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: const [
                    Text(
                      "Demo Credentials",

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text("Admin → admin123"),

                    Text("Manager → manager123"),

                    Text("Team Lead → lead123"),

                    Text("Field Agent → field123"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
