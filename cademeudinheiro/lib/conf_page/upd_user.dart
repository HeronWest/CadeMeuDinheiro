import 'package:cademeudinheiro/features/user/user_dao.dart';
import 'package:cademeudinheiro/features/user/user_info.dart';
import 'package:cademeudinheiro/features/user/user_model.dart';

Future updateUser(int ID, String nick, String email, double minim, String passwd, String rpasswd) async {
  UserDao _userDao = UserDao();
  bool updated;
  print('senha:$passwd\nRepitir:$rpasswd');
  if (passwd == rpasswd) {
    try {
      await _userDao.query(
          'UPDATE users SET nick = ?, email = ?, minim = ? WHERE ID = ?;', [
        nick,
        email,
        minim,
        ID,
      ]);
    } catch (e) {
      print(e);
    }

    return updated = true;
  } else {
    return updated = false;
  }
}
