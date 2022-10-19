import 'package:cademeudinheiro/adm/adm_dao.dart';
import 'package:cademeudinheiro/features/moviment/moviment_dao.dart';
import 'package:cademeudinheiro/features/moviment/moviment_model.dart';
import 'package:cademeudinheiro/features/user/user_controller.dart';
import 'package:cademeudinheiro/features/user/user_dao.dart';
import 'package:cademeudinheiro/helper/sql/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class AdmController {

  final AdmDao _admDao = AdmDao();
  final UserDao _userDao = UserDao();
  final MovimentDao _movimentDao = MovimentDao();
  final UserController _userController = UserController();

  Future<Database?> get db => DatabaseHelper.getInstance().db;

  registerMoviment(int userID, int responsibleID, String local, double value,
      String description, date, String type) async {

    MovimentModel newMoviment = MovimentModel()
        ..user_id = userID
        ..responsible = responsibleID
        ..value = value
        ..local = local
        ..descri = description
        ..type = type
        ..date = date;

    try {
      await _movimentDao.save(newMoviment);
      var userSald = await _userDao.getSald(userID);
      double newSald = userSald + value;
      print(newSald);
      _userController.setSald(newSald, userID);

    } catch(e) {
      print(e);
    }

  }
  deleteUser(int userID) async {
    await _userDao.query('DELETE from users WHERE id="$userID"');
    await _userDao.query('DELETE from moviments WHERE user_id="$userID"');
  }

}