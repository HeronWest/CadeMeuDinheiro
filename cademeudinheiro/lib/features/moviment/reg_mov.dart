import 'package:cademeudinheiro/features/moviment/moviment_dao.dart';
import 'package:cademeudinheiro/features/moviment/moviment_model.dart';
import 'package:cademeudinheiro/features/user/user_dao.dart';
import 'package:cademeudinheiro/features/user/user_model.dart';

Future registerMoviment(int userID, String local, double value,
    String description, date, String type) async {
  //Moviment
  MovimentDao _movimentDao = MovimentDao();
  MovimentModel newMoviment = MovimentModel()
    ..user_id = userID
    ..value = value
    ..local = local
    ..descri = description
    ..type = type
    ..date = date;

  //User sald update
  UserDao _userDao = UserDao();
  UserModel _userModel = UserModel();
  double _newValue;
  List<dynamic> consult = await _userDao.searchUserByID(userID);

  List<UserModel> user = consult.cast<UserModel>();
  _userModel = user.first;

  if (type == 'OUT') {
    _userModel.sald = _userModel.sald! - value;
    await _movimentDao.save(newMoviment);

    try {
      await _userDao.query(
          'UPDATE users SET sald = ? WHERE id = ?;', [_userModel.sald, userID]);
    } catch (e) {
      print(e);
    }
  } else {
    _userModel.sald = _userModel.sald! + value;
    await _movimentDao.save(newMoviment);

    try {
      await _userDao.query(
          'UPDATE users SET sald = ? WHERE id = ?;', [_userModel.sald, userID]);
    } catch (e) {
      print(e);
    }
  }
}
