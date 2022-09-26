import 'package:cademeudinheiro/features/moviment/moviment_dao.dart';
import 'package:cademeudinheiro/features/moviment/moviment_model.dart';

Future registerMoviment(int userID, String local, double value,
    String description, String date) async {
  MovimentDao _movimentDao = MovimentDao();
  MovimentModel newMoviment = MovimentModel()
    ..userID = userID
    ..value = value
    ..local = local
    ..descri = description
    ..date = date;
  await _movimentDao.save(newMoviment);
}
