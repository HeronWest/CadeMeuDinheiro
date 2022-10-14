import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _User with _$UserStore;

abstract class _User with Store {
  @observable
  int? ID;

  @observable
  String name = '';

  @observable
  String type = '';

  @observable
  String nick = '';

  @observable
  String email = '';

  @observable
  String passwd = '';

  @observable
  double? sald;

  @observable
  double? minim;

  @action
  setID(int value) => ID = value;

  @action
  setType(String value) => type = value;

  @action
  setNick(String value) => nick = value;

  @action
  setEmail(String value) => email = value;

  @action
  setSald(double value) => sald = value;

  @action
  setMinim(double value) => minim = value;

  @action
  setPasswd(String value) => passwd = value;
}
