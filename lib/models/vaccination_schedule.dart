class VaccinationSchedule {
  final int? id;
  final int childId;
  final String vaccineName;
  final DateTime scheduledDate;
  final bool isCompleted;
  final DateTime? completedDate;
  final String? notes;

  VaccinationSchedule({
    this.id,
    required this.childId,
    required this.vaccineName,
    required this.scheduledDate,
    this.isCompleted = false,
    this.completedDate,
    this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'childId': childId,
      'vaccineName': vaccineName,
      'scheduledDate': scheduledDate.toIso8601String(),
      'isCompleted': isCompleted ? 1 : 0,
      'completedDate': completedDate?.toIso8601String(),
      'notes': notes,
    };
  }

  factory VaccinationSchedule.fromMap(Map<String, dynamic> map) {
    return VaccinationSchedule(
      id: map['id'],
      childId: map['childId'],
      vaccineName: map['vaccineName'],
      scheduledDate: DateTime.parse(map['scheduledDate']),
      isCompleted: map['isCompleted'] == 1,
      completedDate: map['completedDate'] != null 
          ? DateTime.parse(map['completedDate'])
          : null,
      notes: map['notes'],
    );
  }
} 