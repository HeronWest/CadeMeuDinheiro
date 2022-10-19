import 'package:brasil_fields/brasil_fields.dart';
import 'package:cademeudinheiro/adm/adm_controller.dart';
import 'package:cademeudinheiro/features/moviment/moviment_store.dart';
import 'package:cademeudinheiro/features/widgets/alerts_dialogs.dart';
import 'package:cademeudinheiro/features/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../adm/adm_store.dart';


class AddMovPage extends StatefulWidget {
  const AddMovPage({Key? key}) : super(key: key);

  @override
  State<AddMovPage> createState() => _AddMovPageState();
}

class _AddMovPageState extends State<AddMovPage> {

  late MovimentStore _movimentStore;
  late AdmStore _admStore;
  AlertDialogs _alertDialogs = AlertDialogs()
    ..confirmation = false;

  AdmController _admController = AdmController();
  bool mov = false;

  TextEditingController clean = TextEditingController();
  TextEditingController clean1 = TextEditingController();
  TextEditingController clean2 = TextEditingController();
  TextEditingController clean3 = TextEditingController();

  clearFields(){
    clean.text = '';
    clean1.text = '';
    clean2.text = '';
    clean3.text = '';
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _movimentStore = Provider.of<MovimentStore>(context);
    _admStore = Provider.of<AdmStore>(context);
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
                            controller: clean,
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
                            controller: clean1,
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
                            controller: clean2,
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
                        controller: clean3,
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
                        SizedBox(
                          height: screenSize.height * 0.06,
                          width: screenSize.width*0.45,
                          child: Row(
                            children:[
                                Text('Saída / Entrada:'),
                                Switch(
                                    value: _movimentStore.switchController,
                                    activeColor: Color.fromARGB(255, 0, 194, 184),
                                    onChanged: (bool value){
                                      _movimentStore.setSwitchController();
                                }),
                            ]),
                        ),

                        Container(
                            padding: EdgeInsets.only(top: 8),
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.06,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(
                                      Color.fromARGB(
                                          255, 0, 194, 184))),
                              onPressed: () async {

                                var inputFormat = DateFormat('dd/MM/yyyy');
                                var inputDate = inputFormat.parse(_movimentStore.dateController.replaceAll('-', '/')); // <-- dd/MM 24H format
                                var outputFormat = DateFormat('yyyy/MM/dd');
                                _movimentStore.dateController = outputFormat.format(inputDate).replaceAll('/', '-');

                                if(_movimentStore.switchController) {
                                  await _admController.registerMoviment(
                                      _admStore.userFilterId!,
                                      _admStore.id!,
                                      _movimentStore.localController,
                                      double.parse(_movimentStore.valueController),
                                      _movimentStore.descriController,
                                      _movimentStore.dateController,
                                      'IN');
                                  await _movimentStore.cleanControllers();
                                  await _movimentStore.setMoviments(_admStore.userFilterId!);
                                  _alertDialogs.showSuccefullMovimentAdd(context);
                                  clearFields();

                                } else {
                                  await _admController.registerMoviment(
                                    _admStore.userFilterId!,
                                    _admStore.id!,
                                    _movimentStore.localController,
                                    double.parse(_movimentStore.valueController)*-1,
                                    _movimentStore.descriController,
                                    _movimentStore.dateController.replaceAll('/', '-'),
                                    'OUT');
                                  await _movimentStore.cleanControllers();
                                  await _movimentStore.setMoviments(_admStore.userFilterId!);
                                  _alertDialogs.showSuccefullMovimentAdd(context);
                                  clearFields();

                                }
                              },
                              child: const Text(
                                'ADICIONAR',
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
