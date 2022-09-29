import 'package:cademeudinheiro/features/moviment/moviment_model.dart';
import '../../helper/sql/base_dao.dart';

class MovimentDao extends BaseDao<MovimentModel> {
  @override
  MovimentModel fromMap(Map<String, dynamic> map) {
    return MovimentModel.fromJson(map);
  }

  getMoviments() async {
    try {
      var dbClient = await db;
      List<MovimentModel> retur = await query('SELECT * FROM moviments');
      print('Moviments$retur');
      return retur;
    } catch (e) {
      print(e);
    }
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

  @override
  String get tableName => "moviments";
}
