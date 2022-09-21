import 'package:mobx/mobx.dart';
part 'moviment_store.g.dart';

class MovimentStore = _Moviment with _$MovimentStore;

abstract class _Moviment with Store {
  @observable
  int? userID;

  @observable
  String descri = '';

  @observable
  double? sald;

  @observable
  String? data = '';

  @observable
  String type = '';

  @action
  setUserID(int value) => userID = value;

  @action
  setDescri(String value) => descri = value;

  @action
  setSald(double value) => sald = value;

  @action
  setData(String value) => data = value;

  @action
  setType(String value) => type = value;
}
