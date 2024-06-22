part of global;
class QuestionnaireEvent extends Equatable {
  const QuestionnaireEvent();

  @override
  List<Object> get props => [];
}
class LoadQuestions extends QuestionnaireEvent{
   final String id;
  const LoadQuestions(
    this.id,
  );
  @override
  List<Object> get props => [id];
}

class RefreshQuestions extends QuestionnaireEvent{
  final Questionnaire questions;
  const RefreshQuestions(
     this.questions,
  );
  @override
  List<Object> get props => [questions];
}