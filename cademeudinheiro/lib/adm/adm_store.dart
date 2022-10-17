import 'package:cademeudinheiro/adm/adm_dao.dart';
import 'package:mobx/mobx.dart';
import '../features/user/user_model.dart';
part 'adm_store.g.dart';

class AdmStore = _Adm with _$AdmStore;

abstract class _Adm with Store {
  AdmDao _admDao = AdmDao();

  @observable
  List<UserModel> users = [];

  @observable
  bool load = true;

  @observable
  String nameFilter = '';

  @observable
  int? idFilter;

  @observable
  int? userFilterId;

  @action
  setNameFilter(String value) => nameFilter = value;

  @action
  setIdFilter(value) => idFilter = value;

  @action
  setUserFilterId(value) => userFilterId = value;

  @action
  getAllUsers() async {
    load = true;
    users = await _admDao.searchAllUsers();
    load = false;
  }

}