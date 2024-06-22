part of global;

class QuestionnaireBloc extends Bloc<QuestionnaireEvent, QuestionnaireState> {
  String? selectedQuestion1Value;
  String? questionOneValue;
  String? questionTwoValue;
  String? questionThreeValue;
  String? questionFourValue;
  ValueNotifier<int> totalValueNotifier = ValueNotifier<int>(0);
  ValueNotifier<int> totalCorrect = ValueNotifier<int>(0);
  final FirestoreService _firestoreService;
  ValueNotifier<List<String>> selectedQuestion2Value =
      ValueNotifier<List<String>>([]);
  QuestionnaireBloc(this._firestoreService) : super(QuestionnaireInitial()) {
    on<LoadQuestions>((event, emit) async {
      try {
        emit(QuestionnaireLoading());
        final questions = await _firestoreService.getQuestionnaire(event.id);
        // print("assessment${assessment.toString()}");
        add(RefreshQuestions(questions ?? Questionnaire()));
      } catch (e) {
        emit(const QuestionnaireFailed('Failed to load todos.'));
      }
    });
    on<RefreshQuestions>((event, emit) async {
      emit(QuestionnaireLoaded(event.questions));
    });
  }
  clear() {
    totalCorrect.value = 0;
    totalValueNotifier.value = 0;
    questionOneValue = null;
    questionTwoValue = null;
    questionThreeValue = null;
    questionFourValue = null;
    selectedQuestion2Value.value = [];
  }
}
