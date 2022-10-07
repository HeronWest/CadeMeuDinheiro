import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:cademeudinheiro/features/moviment/moviment_model.dart';
import '../../helper/sql/base_dao.dart';

class MovimentDao extends BaseDao<MovimentModel> {
  @override
  MovimentModel fromMap(Map<String, dynamic> map) {
    return MovimentModel.fromJson(map);
  }

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

  getMoviments({String initialDate = '', String finalDate = ''}) async {
    try {
      var dbClient = await db;
      if (initialDate.isNotEmpty && finalDate.isNotEmpty) {
        List<MovimentModel> retur = await query(
            'SELECT * FROM moviments WHERE data BETWEEN "$initialDate" AND "$finalDate"');
        print('data inicio: $initialDate');
        print('data inicio: $finalDate');
        return retur;
      } else {
        List<MovimentModel> retur = await query('SELECT * FROM moviments');
        return retur;
      }
    } catch (e) {
      print(e);
    }
  }

  getLastValues(String date) async {
    try {
      var dbClient = await db;
      var today = DateTime.now();
      var date = DateFormat('yyyy-MM-dd').format(today).toString();
      print(date);
      List<Map> value = await dbClient!
          .rawQuery('SELECT value FROM moviments WHERE data=?', ['$date']);
      value.forEach((e) => print(e));
      return value;
    } catch (e) {
      print(e);
    }
  }

  @override
  String get tableName => "moviments";
}
