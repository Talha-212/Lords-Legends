import 'package:flutter/material.dart';
import '../models/family.dart';

class FamilySelector extends StatelessWidget {
  final List<Family> families;
  final Family? selectedFamily;
  final ValueChanged<Family> onFamilySelected;
  final FormFieldValidator<Family>? validator;

  const FamilySelector({
    Key? key,
    required this.families,
    this.selectedFamily,
    required this.onFamilySelected,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (families.isEmpty) {
      return const Text(
        'No families registered. Please register a family first.',
        style: TextStyle(color: Colors.red),
      );
    }

    return DropdownButtonFormField<Family>(
      value: selectedFamily,
      decoration: const InputDecoration(
        labelText: 'Select Family',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.family_restroom),
      ),
      items: families.map((family) {
        return DropdownMenuItem(
          value: family,
          child: Text(family.name ?? 'Unnamed Family'),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          onFamilySelected(value);
        }
      },
      validator: validator ?? _defaultValidator,
    );
  }

  String? _defaultValidator(Family? value) {
    if (value == null) {
      return 'Please select a family';
    }
    return null;
  }
} 