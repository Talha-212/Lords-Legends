class AppConstants {
  static const String appName = 'Vaccination Reminder';
  
  // Database
  static const String dbName = 'vaccination_reminder.db';
  static const int dbVersion = 1;

  // Languages
  static const Map<String, String> supportedLanguages = {
    'en-US': 'English',
    'hi-IN': 'हिंदी',
    'mr-IN': 'मराठी',
    'gu-IN': 'ગુજરાતી',
    'bn-IN': 'বাংলা',
    'ta-IN': 'தமிழ்',
    'te-IN': 'తెలుగు',
  };

  // Vaccination Schedule
  static const Map<String, int> initialVaccinations = {
    'BCG': 1,
    'Hepatitis B': 1,
    'OPV': 6,
    'DPT': 42,
    'IPV': 42,
    'MMR': 270,
    'Varicella': 365,
  };

  // Notification Channels
  static const String notificationChannelId = 'vaccination_reminders';
  static const String notificationChannelName = 'Vaccination Reminders';
  static const String notificationChannelDescription = 
      'Notifications for upcoming vaccination appointments';

  // Shared Preferences Keys
  static const String preferredLanguageKey = 'preferred_language';
  static const String defaultLanguage = 'en-US';
} 