import 'package:cademeudinheiro/features/moviment/moviment_dao.dart';
import 'package:cademeudinheiro/features/moviment/moviment_model.dart';
import 'package:sqflite/sqflite.dart';
import '../../helper/sql/db_helper.dart';

class MovimentController {
  final MovimentDao _movimentDao = MovimentDao();

  Future<Database?> get db => DatabaseHelper.getInstance().db;
}
