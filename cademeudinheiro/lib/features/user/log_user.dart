import 'package:cademeudinheiro/features/user/user_dao.dart';
import 'package:cademeudinheiro/features/user/user_info.dart';
import 'package:cademeudinheiro/features/user/user_model.dart';

//Faz a conexão com o usuário e se estiver tudo certo armazena as informações dele no store
Future conectUser(String name, String passwd) async {
  UserInfo _userInfo = UserInfo();
  UserModel? _user;
  UserDao _userDao = UserDao();
  List<dynamic> consult = await _userDao.searchUserByName(name);

  if (consult.isNotEmpty) {
    List<UserModel> users = consult.cast<UserModel>();
    _user = users.first;

    if (_user.passwd == passwd) {
      _userInfo.logged = true;
      _userInfo.userId = _user.id!;
      _userInfo.userNick = _user.nick!;
      _userInfo.userName = _user.name!;
      _userInfo.userEmail = _user.email!;
      _userInfo.userMinim = _user.minim!;
      _userInfo.userSald = _user.sald!;
      _userInfo.userPasswd = _user.passwd!;
      return _userInfo;
    } else {
      _userInfo.logged = false;
      return _userInfo;
    }
  } else {
    _userInfo.logged = false;
    return _userInfo;
  }
}
