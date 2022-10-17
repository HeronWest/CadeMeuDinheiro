import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:cademeudinheiro/features/moviment/moviment_model.dart';
import '../../helper/sql/base_dao.dart';

class MovimentDao extends BaseDao<MovimentModel> {
  @override
  MovimentModel fromMap(Map<String, dynamic> map) {
    return MovimentModel.fromJson(map);
  }

  @override
  String get tableName => "moviments";


  getMovimentsByType(type) async {
    try {
      var dbClient = await db;
      List<MovimentModel> retur =
          await query('SELECT * FROM moviments WHERE type = "$type"');
      print('Moviments$retur');
      return retur;
    } catch (e) {
      print(e);
    }
  }

  getMoviments(int UserId, {String initialDate = '', String finalDate = ''}) async {
    try {
      var dbClient = await db;
      if (initialDate.isNotEmpty && finalDate.isNotEmpty) {
        List<MovimentModel> retur = await query(
            'SELECT * FROM moviments WHERE (user_id = "$UserId") AND (data BETWEEN "$initialDate" AND "$finalDate")');
        print('data inicio: $initialDate');
        print('data inicio: $finalDate');
        return retur;
      } else {
        List<MovimentModel> retur = await query('SELECT * FROM moviments WHERE user_id = "$UserId"');
        return retur;
      }
    } catch (e) {
      print(e);
    }
  }

  getLastValues(String date) async {
    try {
      var dbClient = await db;
      List<MovimentModel> values = await query(
          'SELECT SUM(value) as value FROM moviments WHERE data=?', ['$date']);
      return values;
    } catch (e) {
      print(e);
    }
  }


}
