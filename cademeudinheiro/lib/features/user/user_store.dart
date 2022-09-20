import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _User with _$UserStore;

abstract class _User with Store {
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  double? sald;

  @observable
  double? minim;

  @action
  setName(String value) => name = value;

  @action
  setEmail(String value) => email = value;

  @action
  setSald(double value) => sald = value;

  @action
  setMinim(double value) => minim = value;
}
