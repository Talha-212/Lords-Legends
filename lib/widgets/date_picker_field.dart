import 'package:flutter/material.dart';
import '../utils/app_utils.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime> onDateSelected;
  final String? Function(String?)? validator;

  const DatePickerField({
    Key? key,
    required this.label,
    this.selectedDate,
    this.firstDate,
    this.lastDate,
    required this.onDateSelected,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        child: Text(
          selectedDate != null
              ? AppUtils.formatDate(selectedDate!)
              : 'Select Date',
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      onDateSelected(picked);
    }
  }
} 