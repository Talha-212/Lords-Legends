import 'package:flutter/material.dart';
import '../models/vaccination_schedule.dart';
import '../utils/app_utils.dart';
import 'vaccination_status_badge.dart';
import 'voice_button.dart';

class VaccinationReminder extends StatelessWidget {
  final VaccinationSchedule schedule;
  final VoidCallback? onMarkAsCompleted;
  final VoidCallback? onPlayVoiceReminder;
  final bool isPlayingVoice;

  const VaccinationReminder({
    Key? key,
    required this.schedule,
    this.onMarkAsCompleted,
    this.onPlayVoiceReminder,
    this.isPlayingVoice = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                VaccinationStatusBadge(isCompleted: schedule.isCompleted),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Due Date: ${AppUtils.formatDate(schedule.scheduledDate)}',
              style: theme.textTheme.bodyMedium,
            ),
            if (schedule.notes != null && schedule.notes!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                'Notes: ${schedule.notes}',
                style: theme.textTheme.bodyMedium,
              ),
            ],
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (onPlayVoiceReminder != null)
                  VoiceButton(
                    onPressed: onPlayVoiceReminder,
                    isPlaying: isPlayingVoice,
                    tooltip: 'Play Voice Reminder',
                  ),
                if (!schedule.isCompleted && onMarkAsCompleted != null) ...[
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: onMarkAsCompleted,
                    child: const Text('Mark as Completed'),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
} 