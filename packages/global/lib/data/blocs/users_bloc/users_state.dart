part of global;


abstract class UsersState extends Equatable {
  const UsersState();
  
  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}
class UsersLoading extends UsersState {}
class UsersLoadedState extends UsersState {
  final List<Patient> patients;
  const UsersLoadedState(
     this.patients,
  );
  @override
  List<Object> get props => [patients];
}
class UsersFailed extends UsersState {
   final String message;
  const UsersFailed(
     this.message,
  );
  @override
  List<Object> get props => [message];
}
