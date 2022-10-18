import 'package:brasil_fields/brasil_fields.dart';
import 'package:cademeudinheiro/features/moviment/moviment_store.dart';
import 'package:cademeudinheiro/features/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../adm/adm_store.dart';

class EditMovPage extends StatefulWidget {
  const EditMovPage({Key? key}) : super(key: key);

  @override
  State<EditMovPage> createState() => _EditMovPageState();
}

class _EditMovPageState extends State<EditMovPage> {

  late MovimentStore _movimentStore;
  late AdmStore _admStore;
  TextEditingController _localController = TextEditingController();
  TextEditingController _valueController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _descriController = TextEditingController();
  late String validateDate;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _movimentStore = Provider.of<MovimentStore>(context);
    _admStore = Provider.of<AdmStore>(context);
    _localController.text = _movimentStore.localController;
    _valueController.text = _movimentStore.valueController;
    _dateController.text = DateFormat('dd-MM-yyyy').format(DateTime.parse(_movimentStore.dateController)).replaceAll('-', '/');
    _descriController.text = _movimentStore.descriController;
    validateDate = _movimentStore.dateController;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Observer(
          builder: (context) {
            return Container(
              width: screenSize.width*0.9,
              height: screenSize.height*0.5,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        width: screenSize.width * 0.4,
                        child: TextFormField(
                          onChanged: _movimentStore.setLocalController,
                          controller: _localController,
                          minLines: 1,
                          maxLines: 4,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 194, 184),
                              fontSize: 14),
                          decoration: const InputDecoration(
                              isDense: true,
                              labelText: 'Local',
                              labelStyle:
                              TextStyle(fontSize: 14, color: Colors.black54),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 194, 184))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(
                                          255, 0, 194, 184)))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        width: screenSize.width * 0.22,
                        child: TextFormField(
                          onChanged: _movimentStore.setValueController,
                          controller: _valueController,
                          minLines: 1,
                          maxLines: 4,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 194, 184),
                              fontSize: 14),
                          decoration: const InputDecoration(
                              isDense: true,
                              labelText: 'Valor',
                              labelStyle:
                              TextStyle(fontSize: 14, color: Colors.black54),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 194, 184))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(
                                          255, 0, 194, 184)))),
                        ),
                      ),
                      Container(
                        width: screenSize.width * 0.28,
                        child: TextFormField(
                          onChanged: _movimentStore.setDateController,
                          controller: _dateController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            DataInputFormatter(),
                          ],
                          minLines: 1,
                          maxLines: 4,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 194, 184),
                              fontSize: 14),
                          decoration: const InputDecoration(
                              isDense: true,
                              labelText: 'Data',
                              labelStyle:
                              TextStyle(fontSize: 14, color: Colors.black54),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 194, 184))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(
                                          255, 0, 194, 184)))),
                        ),
                      ),

                    ],
                  ),
                  Container(
                    width: screenSize.width * 0.9,
                    padding: EdgeInsets.only(top: 8),
                    child: TextFormField(
                      onChanged: _movimentStore.setDescriController,
                      controller: _descriController,
                      minLines: 1,
                      maxLines: 4,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 194, 184),
                          fontSize: 14),
                      decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Descrição',
                          labelStyle:
                          TextStyle(fontSize: 14, color: Colors.black54),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 194, 184))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(
                                      255, 0, 194, 184)))),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 8, right: 8),
                          width: screenSize.width * 0.35,
                          height: screenSize.height * 0.06,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(
                                    Color.fromARGB(
                                        255, 231, 35, 35))),
                            onPressed: () async {
                              await _movimentStore.deleteMoviment(_movimentStore.idController!);
                              await _movimentStore.cleanControllers();
                              await _movimentStore.setMoviments(_admStore.userFilterId!);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'EXCLUIR',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.only(top: 8),
                          width: screenSize.width * 0.55,
                          height: screenSize.height * 0.06,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(
                                    Color.fromARGB(
                                        255, 0, 194, 184))),
                            onPressed: () async {

                              if (validateDate != _movimentStore.dateController) {
                              var inputFormat = DateFormat('dd/MM/yyyy');
                              var inputDate = inputFormat.parse(_movimentStore.dateController.replaceAll('-', '/')); // <-- dd/MM 24H format
                              var outputFormat = DateFormat('yyyy/MM/dd');
                              _movimentStore.dateController = outputFormat.format(inputDate).replaceAll('/', '-');
                              }
                              await _movimentStore.updateMoviment(
                                  _movimentStore.idController!,
                                  _movimentStore.localController,
                                  double.parse(_movimentStore.valueController),
                                  _movimentStore.dateController,
                                  _movimentStore.descriController);
                              await _movimentStore.cleanControllers();
                              await _movimentStore.setMoviments(_admStore.userFilterId!);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'ATUALIZAR',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
