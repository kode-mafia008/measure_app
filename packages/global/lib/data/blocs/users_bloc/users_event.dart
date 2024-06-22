// ignore_for_file: public_member_api_docs, sort_constructors_first
part of global;

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class LoadUsers extends UsersEvent {
  
}
class UsersRefreshed extends UsersEvent {
 
}

class RefreshUsers extends UsersEvent {
 final List<Patient> patients;
  const RefreshUsers(
     this.patients,
  );
  @override
  List<Object> get props => [patients];
}
