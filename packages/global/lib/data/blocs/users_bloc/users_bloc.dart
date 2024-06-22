part of global;

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final FirestoreService _firestoreService;

  UsersBloc(this._firestoreService) : super(UsersInitial()) {
    on<LoadUsers>((event, emit) async {
      try {
        emit(UsersLoading());
        final patients = await _firestoreService.getPatients().first;
        debugPrint(patients[0].id.toString());
        add(RefreshUsers(patients.toList()));
      } catch (e) {
        emit(const UsersFailed('Failed to load todos.'));
      }
    });
    on<RefreshUsers>((event, emit) async {
      emit(UsersLoadedState(event.patients));
    });
  }
}
