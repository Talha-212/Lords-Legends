import 'package:intl/intl.dart';

class AppUtils {
  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }

  static String getAgeFromDateOfBirth(DateTime dateOfBirth) {
    final today = DateTime.now();
    int age = today.year - dateOfBirth.year;
    if (today.month < dateOfBirth.month ||
        (today.month == dateOfBirth.month && today.day < dateOfBirth.day)) {
      age--;
    }
    return age.toString();
  }

  static String getGenderText(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return 'Male';
      case 'female':
        return 'Female';
      case 'other':
        return 'Other';
      default:
        return 'Unknown';
    }
  }

  static String getVaccinationStatusText(bool isCompleted) {
    return isCompleted ? 'Completed' : 'Pending';
  }

  static String getVaccinationReminderMessage({
    required String childName,
    required String vaccineName,
    required DateTime dueDate,
  }) {
    return 'Reminder: $childName is due for $vaccineName on ${formatDate(dueDate)}';
  }

  static String getVoiceGreeting(String name) {
    final hour = DateTime.now().hour;
    String greeting;
    if (hour < 12) {
      greeting = 'Good morning';
    } else if (hour < 17) {
      greeting = 'Good afternoon';
    } else {
      greeting = 'Good evening';
    }
    return '$greeting, $name';
  }
} 