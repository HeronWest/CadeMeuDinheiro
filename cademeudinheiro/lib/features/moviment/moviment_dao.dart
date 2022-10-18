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


  getMovimentsByType(int UserId, type) async {
    try {
      var dbClient = await db;
      List<MovimentModel> retur =
          await query('SELECT * FROM moviments WHERE type = "$type" and (user_id = "$UserId")');
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

  updateMoviment(int id, String local, double value, String date, String descri) async {
    try {
      await query('UPDATE moviments SET local = ?, value = ?, data = ?, descri = ? WHERE id = ?;',[
        local,
        value,
        date,
        descri,
        id
      ]);
    } catch(e){
      print(e);
    }
  }

  deleteMoviment(int id) async{
    try {
      var dbClient = await db;
      await query('DELETE FROM moviments WHERE id="$id"');
    } catch (e) {
      print(e);
    }
  }

}
