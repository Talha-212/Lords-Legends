import 'package:flutter/material.dart';
import '../models/vaccination_schedule.dart';
import '../utils/app_utils.dart';

class VaccinationCard extends StatelessWidget {
  final VaccinationSchedule schedule;
  final VoidCallback? onMarkAsCompleted;
  final VoidCallback? onPlayVoiceReminder;

  const VaccinationCard({
    Key? key,
    required this.schedule,
    this.onMarkAsCompleted,
    this.onPlayVoiceReminder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompleted = schedule.isCompleted;

    return Card(
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
                    schedule.vaccineName,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isCompleted ? Colors.green : Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    AppUtils.getVaccinationStatusText(isCompleted),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Due Date: ${AppUtils.formatDate(schedule.scheduledDate)}',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (onPlayVoiceReminder != null)
                  IconButton(
                    onPressed: onPlayVoiceReminder,
                    icon: const Icon(Icons.volume_up),
                    tooltip: 'Play Voice Reminder',
                  ),
                if (!isCompleted && onMarkAsCompleted != null)
                  ElevatedButton(
                    onPressed: onMarkAsCompleted,
                    child: const Text('Mark as Completed'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 