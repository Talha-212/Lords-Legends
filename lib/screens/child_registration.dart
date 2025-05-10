import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/family.dart';

class ChildRegistrationScreen extends StatelessWidget {
  const ChildRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final dobController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Child'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Child Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: dobController,
              decoration: const InputDecoration(
                labelText: 'Date of Birth (YYYY-MM-DD)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && dobController.text.isNotEmpty) {
                  context.read<Family>().addChild({
                    'name': nameController.text,
                    'dob': dobController.text,
                  });
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
} 