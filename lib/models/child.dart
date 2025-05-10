class Child {
  final int? id;
  final int familyId;
  final String name;
  final DateTime dateOfBirth;
  final String gender;
  final DateTime? lastVaccinationDate;
  final String? lastVaccinationName;

  Child({
    this.id,
    required this.familyId,
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    this.lastVaccinationDate,
    this.lastVaccinationName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'familyId': familyId,
      'name': name,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'gender': gender,
      'lastVaccinationDate': lastVaccinationDate?.toIso8601String(),
      'lastVaccinationName': lastVaccinationName,
    };
  }

  factory Child.fromMap(Map<String, dynamic> map) {
    return Child(
      id: map['id'],
      familyId: map['familyId'],
      name: map['name'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
      gender: map['gender'],
      lastVaccinationDate: map['lastVaccinationDate'] != null 
          ? DateTime.parse(map['lastVaccinationDate'])
          : null,
      lastVaccinationName: map['lastVaccinationName'],
    );
  }
} 