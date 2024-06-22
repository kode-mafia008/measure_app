part of global;

class Assessment {
  String? id;
  String? applicableMeasures;
  String? icdo;
  String? cognitiveStatus;
  
  DocumentReference? patientId;
  int? result;
  Map<String, dynamic>? test;
  Timestamp? updatedAt;

  Assessment({
    this.id,
    this.applicableMeasures,
    this.cognitiveStatus,
    this.icdo,
    
    this.patientId,
    this.result,
    this.test,
    this.updatedAt,
  });
 Assessment copyWith({
    String? id,
    String? applicableMeasures,
    String? cognitiveStatus,
    String? icdo,
    DocumentReference? patientId,
    int? result,
    Map<String, dynamic>? test,
    Timestamp? updatedAt,
  }) {
    return Assessment(
      id: id ?? this.id,
      applicableMeasures: applicableMeasures ?? this.applicableMeasures,
      cognitiveStatus: cognitiveStatus ?? this.cognitiveStatus,
      icdo: icdo ?? this.icdo,
      patientId: patientId ?? this.patientId,
      result: result ?? this.result,
      test: test ?? this.test,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
  factory Assessment.fromMap(Map<String, dynamic> data, String id) {
    return Assessment(
      id: id,
      
      patientId: data['patient_id'] as DocumentReference?,
      result: data['result'] as int?,
      applicableMeasures: data['applicable_measures'] as String?,
      icdo: data['icdo'] as String?,
      cognitiveStatus: data['cognitive_status'] as String?,
      test: data['test'] as Map<String, dynamic>?,
      updatedAt: data['updated_at'] as Timestamp?,
    );
  }
}
class AssessmentType {
  final String id;
  final Map<String, List<String>> applicableMeasures;
  final List<String> cognitiveStatus;

  AssessmentType({
    required this.id,
    required this.applicableMeasures,
    required this.cognitiveStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'applicable_measures': applicableMeasures,
      'cognitive_status': cognitiveStatus,
    };
  }

  factory AssessmentType.fromMap(String id, Map<String, dynamic> map) {
    Map<String, List<String>> applicableMeasures = {};
    (map['applicable_measures'] as Map<String, dynamic>).forEach((key, value) {
      applicableMeasures[key] = List<String>.from(value);
    });

    return AssessmentType(
      id: id,
      applicableMeasures: applicableMeasures,
      cognitiveStatus: List<String>.from(map['cognitive_status'] as List),
    );
  }
}
class Questionnaire {
  final String? id;
   DocumentReference? assessmentId; // Add assessmentId field
  final Map<String, dynamic>? questionOne;
  final Map<String, dynamic>? questionTwo;
  final Map<String, dynamic>? questionThree;
  final Map<String, dynamic>? questionFour;

  Questionnaire({
     this.id,
     this.assessmentId,
     this.questionOne,
    this.questionTwo,
    this.questionThree,
     this.questionFour,
  });

  factory Questionnaire.fromMap(Map<String, dynamic> map, String id) {
    return Questionnaire(
      id: id,
      assessmentId: map['assessment_id'] as DocumentReference, // Parse assessmentId
      questionOne: map['question_one'] as Map<String, dynamic>,
      questionTwo: map['question_two'] as Map<String, dynamic>,
      questionThree: map['question_three'] as Map<String, dynamic>,
      questionFour: map['question_four'] as Map<String, dynamic>,
    );
  }
}
