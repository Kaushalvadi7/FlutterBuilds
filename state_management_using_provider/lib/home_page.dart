import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'age_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ageProvider = Provider.of<AgeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Voting Eligibility Checker")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter your age:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter age",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int? enteredAge = int.tryParse(_ageController.text);
                if (enteredAge != null) {
                  ageProvider.checkEligibility(enteredAge);
                }
              },
              child: const Text("Check Eligibility"),
            ),
            const SizedBox(height: 20),
            Text(
              ageProvider.message,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ageProvider.age >= 18 ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
