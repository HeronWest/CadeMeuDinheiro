import 'package:cademeudinheiro/features/moviment/moviment_controller.dart';
import 'package:cademeudinheiro/features/moviment/moviment_dao.dart';
import 'package:mobx/mobx.dart';
import 'moviment_model.dart';
part 'moviment_store.g.dart';

class MovimentStore = _Moviment with _$MovimentStore;

abstract class _Moviment with Store {
  MovimentDao _movimentDao = MovimentDao();

  @observable
  List<MovimentModel> moviments = [];

  @observable
  bool load = true;

  @action
  setMoviments({String local = '', String date = ''}) async {
    load = false;
    moviments = await _movimentDao.getMoviments();
    load = true;
  }
  setMovimentsByType(type) async {
    load = false;
    moviments = await _movimentDao.getMovimentsByType(type);
    load = true;
  }
}
