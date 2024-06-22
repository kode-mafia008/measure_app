part of global;

// import 'package:global/global.dart';

class UserServices {
  final String  getAllUsers = 'auth/users/list';

  Future<Iterable<UserListModel>> getAll()async{

    final  response  = await ApiModel.instance.get(url: getAllUsers);

    return (response.msg!.data as List).map((e) => UserListModel.fromMap(e)).toList();
}}
