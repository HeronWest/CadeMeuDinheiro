import 'package:cademeudinheiro/features/user/user_model.dart';
import '../../helper/sql/base_dao.dart';

class UserDao extends BaseDao<UserModel> {
  @override
  UserModel fromMap(Map<String, dynamic> map) {
    return UserModel.fromJson(map);
  }

  @override
  String get tableName => "users";
}