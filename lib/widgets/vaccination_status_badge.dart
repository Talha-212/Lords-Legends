import 'package:flutter/material.dart';
import '../utils/app_utils.dart';

class VaccinationStatusBadge extends StatelessWidget {
  final bool isCompleted;
  final double fontSize;

  const VaccinationStatusBadge({
    Key? key,
    required this.isCompleted,
    this.fontSize = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
} 