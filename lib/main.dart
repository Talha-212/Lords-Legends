import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/family_registration.dart';
import 'screens/child_registration.dart';
import 'screens/vaccination_schedule.dart';
import 'models/family.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Family(),
      child: MaterialApp(
        title: 'Vaccination Reminder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccination Reminder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FamilyRegistrationScreen()),
                );
              },
              child: const Text('Register Family'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChildRegistrationScreen()),
                );
              },
              child: const Text('Add Child'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VaccinationScheduleScreen()),
                );
              },
              child: const Text('View Schedule'),
            ),
          ],
        ),
      ),
    );
  }
}
