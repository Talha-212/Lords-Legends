import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/family.dart';

class VaccinationScheduleScreen extends StatelessWidget {
  const VaccinationScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccination Schedule'),
      ),
      body: Consumer<Family>(
        builder: (context, family, child) {
          if (family.children.isEmpty) {
            return const Center(
              child: Text('No children registered yet'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: family.children.length,
            itemBuilder: (context, index) {
              final child = family.children[index];
              return Card(
                child: ListTile(
                  title: Text(child['name']),
                  subtitle: Text('DOB: ${child['dob']}'),
                  trailing: const Icon(Icons.calendar_today),
                ),
              );
            },
          );
        },
      ),
    );
  }
} 