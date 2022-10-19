import 'package:cademeudinheiro/adm/adm_controller.dart';
import 'package:cademeudinheiro/adm/adm_dao.dart';
import 'package:mobx/mobx.dart';
import '../features/user/user_model.dart';
part 'adm_store.g.dart';

class AdmStore = _Adm with _$AdmStore;

abstract class _Adm with Store {
  AdmDao _admDao = AdmDao();
  AdmController _admController = AdmController();

  @observable
  List<UserModel> users = [];

  @observable
  bool load = true;

  @observable
  String nameFilter = '';

  @observable
  int? id;

  @observable
  int? userFilterId;

  @action
  setNameFilter(String value) => nameFilter = value;

  @action
  setId(value) => id = value;

  @action
  setUserFilterId(value) => userFilterId = value;

  @action
  getAllUsers() async {
    load = false;
    users = await _admDao.searchAllUsers();
    load = true;
  }

  @action
  getUsersByName(String name) async {
    load = false;
    users = await _admDao.searchUserByName(name);
    load = true;
}

}