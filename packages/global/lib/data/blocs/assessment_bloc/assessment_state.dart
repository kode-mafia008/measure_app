part of global;

class AssessmentState extends Equatable {
  const AssessmentState();

  @override
  List<Object> get props => [];
}

class AssessmentInitial extends AssessmentState {}

class AssessmentLoading extends AssessmentState {}

class RecentAssessmentLoading extends AssessmentState {}

class RecentAssessmentLoaded extends AssessmentState {
  final List<Map<String, dynamic>> assessments;
  const RecentAssessmentLoaded(
    this.assessments,
  );
  @override
  List<Object> get props => [assessments];
}

class AssessmentLoaded extends AssessmentState {
  final List<Map<String, dynamic>> assessments;
  const AssessmentLoaded(
    this.assessments,
  );
  @override
  List<Object> get props => [assessments];
}
class AssessmentTypeLoaded extends AssessmentState {
  final List<AssessmentType> assessmentType;
  const AssessmentTypeLoaded(
    this.assessmentType,
  );
  @override
  List<Object> get props => [assessmentType];
}

class AssessmentStarted extends AssessmentState {}
class AssessmentCompleted extends AssessmentState {}

class AssessmentFailed extends AssessmentState {
  final String message;
  const AssessmentFailed(
    this.message,
  );
  @override
  List<Object> get props => [message];
}

class RecentAssessmentFailed extends AssessmentState {
  final String message;
  const RecentAssessmentFailed(
    this.message,
  );
  @override
  List<Object> get props => [message];
}

class CognitivestatusSelected extends AssessmentState {}

class ApplicableMeasuresSelected extends AssessmentState {}

class PatientSelected extends AssessmentState {}
