import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class LanguageSelector extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageSelected;

  const LanguageSelector({
    Key? key,
    required this.selectedLanguage,
    required this.onLanguageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Language'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: AppConstants.supportedLanguages.entries.map((entry) {
            final isSelected = entry.key == selectedLanguage;
            return ListTile(
              title: Text(entry.value),
              trailing: isSelected
                  ? const Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () {
                Navigator.of(context).pop();
                onLanguageSelected(entry.key);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  static Future<String?> show({
    required BuildContext context,
    required String currentLanguage,
  }) async {
    return showDialog<String>(
      context: context,
      builder: (context) => LanguageSelector(
        selectedLanguage: currentLanguage,
        onLanguageSelected: (language) => Navigator.of(context).pop(language),
      ),
    );
  }
} 