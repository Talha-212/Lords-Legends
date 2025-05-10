import 'package:flutter/material.dart';
import '../models/family.dart';

class FamilyCard extends StatelessWidget {
  final Family family;
  final VoidCallback? onTap;

  const FamilyCard({
    Key? key,
    required this.family,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                family.name ?? 'Unnamed Family',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Phone: ${family.phoneNumber ?? 'Not provided'}',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 