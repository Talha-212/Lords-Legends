import 'package:flutter/foundation.dart';

class Family extends ChangeNotifier {
  String? _name;
  String? _phoneNumber;
  final List<Map<String, dynamic>> _children = [];

  String? get name => _name;
  String? get phoneNumber => _phoneNumber;
  List<Map<String, dynamic>> get children => List.unmodifiable(_children);

  void saveFamily(String name, String phoneNumber) {
    _name = name;
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void addChild(Map<String, dynamic> childData) {
    _children.add(childData);
    notifyListeners();
  }

  void removeChild(int index) {
    if (index >= 0 && index < _children.length) {
      _children.removeAt(index);
      notifyListeners();
    }
  }
} 