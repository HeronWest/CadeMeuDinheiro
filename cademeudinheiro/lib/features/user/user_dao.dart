import 'package:cademeudinheiro/features/user/user_model.dart';
import '../../helper/sql/base_dao.dart';

class UserDao extends BaseDao<UserModel> {
  @override
  UserModel fromMap(Map<String, dynamic> map) {
    return UserModel.fromJson(map);
  }

  @override
  String get tableName => "users";
  Future<dynamic> searchUserByName(name) async {
    List<UserModel> user =
        await query("SELECT * FROM users WHERE name = '$name'");

    return user;
  }

  Future<dynamic> searchUserByID(id) async {
    List<UserModel> user = await query("SELECT * FROM users WHERE id = '$id'");
    return user;
  }

  getSald(int id) async {
    List<UserModel> user = await query('SELECT * FROM users WHERE id = "$id"');
    print(user[0].sald);
    return user[0].sald;
  }

}
