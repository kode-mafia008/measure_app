part of global;
 class QuestionnaireState extends Equatable {
  const QuestionnaireState();
  
  @override
  List<Object> get props => [];
}

 class QuestionnaireInitial extends QuestionnaireState {}
 class QuestionnaireLoading extends QuestionnaireState {}
 class QuestionnaireLoaded extends QuestionnaireState {
   final Questionnaire questions;
  const QuestionnaireLoaded(
     this.questions,
  );
  @override
  List<Object> get props => [questions];
 }
 class QuestionnaireFailed extends QuestionnaireState {
   final String message;
  const QuestionnaireFailed(
     this.message,
  );
  @override
  List<Object> get props => [message];
 }
