part of global;

class AuthService {
  final String _registerUrl = '/auth/user/register/';
  final String _loginUrl = '/auth/login/';
  final String _deleteAccountUrl = '/customer/delete-account';
  // late SessionInfo _sessionInfo;

  Map<String, dynamic>? _userData;


  Future<ApiResponse> loginWithEmail(String email, String password) async {

    var _data = {"email": email, "password": password};
    final _response =
        await ApiModel.instance.post(url: 'auth/user/login', variables: _data);

    if (_response.status) {
      print(_response.msg.toString());
      String accessToken = _response.msg!.data["data"]["access"];

     

      Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
      var userModel = UserModel.fromMap(decodedToken["user-info"]);

      // print(decodedToken);
    }
    return _response;
  }



 

}
