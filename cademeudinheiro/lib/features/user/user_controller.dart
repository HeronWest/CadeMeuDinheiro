import 'package:cademeudinheiro/features/user/user_dao.dart';
import 'package:sqflite/sqflite.dart';
import '../../helper/sql/db_helper.dart';

class UserController{
  
  final UserDao _userDao = UserDao();

  Future<Database?> get db => DatabaseHelper.getInstance().db;

  setSald(double sald, int id) async {
    var dbClient = await db;
    await dbClient!.rawQuery('UPDATE users SET sald = "$sald" WHERE id = "$id"');
  }
}