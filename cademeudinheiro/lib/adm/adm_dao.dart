import '../features/user/user_model.dart';
import '../helper/sql/base_dao.dart';

class AdmDao extends BaseDao<UserModel>{
  @override
  UserModel fromMap(Map<String, dynamic> map) {
    return UserModel.fromJson(map);
  }

  @override
  String get tableName => "users";

  Future<dynamic> searchAllUsers() async {
    List<UserModel> user = await query("SELECT * FROM users WHERE type = 'normal'");
    return user;
  }

  Future<dynamic> searchUserByName(String name) async {
    List<UserModel> user = await query("SELECT * FROM users WHERE name LIKE '%$name%' and type = 'normal'");
    return user;
  }

}

