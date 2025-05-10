import 'package:flutter/material.dart';
import '../models/child.dart';
import '../utils/app_utils.dart';

class ChildCard extends StatelessWidget {
  final Child child;
  final VoidCallback? onTap;
  final VoidCallback? onPlayVoiceGreeting;

  const ChildCard({
    Key? key,
    required this.child,
    this.onTap,
    this.onPlayVoiceGreeting,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      child.name,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  if (onPlayVoiceGreeting != null)
                    IconButton(
                      onPressed: onPlayVoiceGreeting,
                      icon: const Icon(Icons.record_voice_over),
                      tooltip: 'Play Voice Greeting',
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Age: ${AppUtils.getAgeFromDateOfBirth(child.dateOfBirth)} years',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Text(
                'Gender: ${AppUtils.getGenderText(child.gender)}',
                style: theme.textTheme.bodyMedium,
              ),
              if (child.lastVaccinationDate != null && child.lastVaccinationName != null) ...[
                const SizedBox(height: 4),
                Text(
                  'Last Vaccination: ${child.lastVaccinationName} on ${AppUtils.formatDate(child.lastVaccinationDate!)}',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
} 