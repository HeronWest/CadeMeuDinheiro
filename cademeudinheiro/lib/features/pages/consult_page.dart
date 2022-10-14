import 'package:cademeudinheiro/features/moviment/moviment_controller.dart';
import 'package:cademeudinheiro/features/moviment/moviment_store.dart';
import 'package:cademeudinheiro/features/widgets/appbar.dart';
import 'package:cademeudinheiro/features/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ConsultPage extends StatefulWidget {
  const ConsultPage({super.key});

  @override
  State<ConsultPage> createState() => _consultPageState();
}

class _consultPageState extends State<ConsultPage> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('yyyy-MM-dd').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
      print('$_range');
    });
  }

  final MovimentController _movimentController = MovimentController();
  final _valueController = TextEditingController();
  final _localController = TextEditingController();
  final _dateController = TextEditingController();
  String dropdownValue = 'Ambos';
  String dropdownValue2 = 'Mais recentes';
  String dropdownID = 'IN';
  bool _sortDate = true;
  bool _sortLocal = true;
  bool _sortValue = true;
  bool _sortType = true;
  bool _sortAsc = true;
  int? _sortColumnIndex;
  IconData _icon = Icons.calendar_month_rounded;

  late MovimentStore _movimentStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _movimentStore = Provider.of<MovimentStore>(context);
    _movimentStore.setMoviments();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(),
      body: _movimentStore.load
          ? Center(
              child: Observer(
                  builder: (_) => SingleChildScrollView(
                          child: Padding(
                        padding: const EdgeInsets.only(bottom: 45),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              width: screenSize.width * 0.9,
                              height: screenSize.height * 0.7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromARGB(255, 0, 194, 184)),
                                  color: Color.fromARGB(255, 217, 245, 243)),
                              child: SingleChildScrollView(
                                child: DataTable(
                                  headingRowColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 0, 194, 184)),
                                  columnSpacing: 5,
                                  columns: [
                                    DataColumn(
                                      label: Text('Data'),
                                      onSort: (columnIndex, sortAscending) {
                                        setState(() {
                                          _sortAsc = sortAscending;

                                          _sortColumnIndex = columnIndex;

                                          sortAscending
                                              ? _movimentStore.moviments.sort(
                                                  (a, b) => a.date!
                                                      .compareTo(b.date!))
                                              : _movimentStore.moviments.sort(
                                                  (b, a) => a.date!
                                                      .compareTo(b.date!));
                                        });
                                      },
                                    ),
                                    DataColumn(
                                      label: Text('Local'),
                                      onSort: (columnIndex, sortAscending) {
                                        setState(() {
                                          _sortAsc = sortAscending;

                                          _sortColumnIndex = columnIndex;

                                          sortAscending
                                              ? _movimentStore.moviments.sort(
                                                  (a, b) => a.local!
                                                      .compareTo(b.local!))
                                              : _movimentStore.moviments.sort(
                                                  (b, a) => a.local!
                                                      .compareTo(b.local!));
                                        });
                                      },
                                    ),
                                    DataColumn(
                                      label: Text('Valor'),
                                      onSort: (columnIndex, sortAscending) {
                                        setState(() {
                                          _sortAsc = sortAscending;

                                          _sortColumnIndex = columnIndex;

                                          sortAscending
                                              ? _movimentStore.moviments.sort(
                                                  (a, b) => a.value!
                                                      .compareTo(b.value!))
                                              : _movimentStore.moviments.sort(
                                                  (b, a) => a.value!
                                                      .compareTo(b.value!));
                                        });
                                      },
                                    ),
                                    DataColumn(
                                      label: Text('Tipo'),
                                      onSort: (columnIndex, sortAscending) {
                                        setState(() {
                                          _sortAsc = sortAscending;

                                          _sortColumnIndex = columnIndex;

                                          sortAscending
                                              ? _movimentStore.moviments.sort(
                                                  (a, b) => a.type!
                                                      .compareTo(b.type!))
                                              : _movimentStore.moviments.sort(
                                                  (b, a) => a.type!
                                                      .compareTo(b.type!));
                                        });
                                      },
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                      _movimentStore.moviments.length,
                                      (int index) => DataRow(cells: [
                                            DataCell(SizedBox(
                                              width: screenSize.width * 0.25,
                                              child: Text(
                                                  '${DateFormat('dd-MM-yyyy').format(DateTime.parse(_movimentStore.moviments[index].date!))}'),
                                            )),
                                            DataCell(SizedBox(
                                              width: screenSize.width * 0.2,
                                              child: Text(
                                                  '${_movimentStore.moviments[index].local}'),
                                            )),
                                            DataCell(SizedBox(
                                              width: screenSize.width * 0.2,
                                              child: Text(
                                                  'R\$${_movimentStore.moviments[index].value!.toStringAsFixed(2)}'),
                                            )),
                                            DataCell(SizedBox(
                                              width: screenSize.width * 0.2,
                                              child: Text(
                                                  '${_movimentStore.moviments[index].type}'),
                                            ))
                                          ])),
                                  sortColumnIndex: _sortColumnIndex,
                                  sortAscending: _sortAsc,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 0, 194, 184))),
                                  margin: EdgeInsets.only(
                                    right: screenSize.width * 0.05,
                                  ),
                                  width: screenSize.width * 0.35,
                                  height: screenSize.height * 0.06,
                                  child: Center(
                                    child: DropdownButton<String>(
                                      alignment: Alignment.center,
                                      value: dropdownValue,
                                      elevation: 16,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 0, 194, 184)),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                          if (newValue == 'Saída') {
                                            dropdownID = 'OUT';
                                          } else {
                                            dropdownID = 'IN';
                                          }
                                        });
                                      },
                                      items: <String>[
                                        'Ambos',
                                        'Saída',
                                        'Entrada'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                // Container(
                                //   margin: EdgeInsets.only(
                                //     right: screenSize.width * 0.05,
                                //   ),
                                //   width: screenSize.width * 0.20,
                                //   height: screenSize.height * 0.07,
                                //   child: TextFormField(
                                //     controller: _valueController,
                                //     style: const TextStyle(
                                //         color: Color.fromARGB(255, 0, 194, 184)),
                                //     decoration: const InputDecoration(
                                //         isDense: true,
                                //         labelText: 'Valor',
                                //         labelStyle: TextStyle(
                                //             fontSize: 14, color: Colors.black54),
                                //         enabledBorder: UnderlineInputBorder(
                                //             borderSide: BorderSide(
                                //                 color: Color.fromARGB(
                                //                     255, 0, 194, 184))),
                                //         border: UnderlineInputBorder(
                                //             borderSide: BorderSide(
                                //                 color: Color.fromARGB(
                                //                     255, 0, 194, 184)))),
                                //   ),
                                // ),
                                // Container(
                                //   width: screenSize.width * 0.2,
                                //   height: screenSize.height * 0.07,
                                //   child: TextFormField(
                                //     controller: _dateController,
                                //     inputFormatters: [
                                //       FilteringTextInputFormatter.digitsOnly,
                                //       DataInputFormatter(),
                                //     ],
                                //     style: const TextStyle(
                                //         color: Color.fromARGB(255, 0, 194, 184)),
                                //     decoration: const InputDecoration(
                                //         isDense: true,
                                //         labelText: 'Data',
                                //         labelStyle: TextStyle(
                                //             fontSize: 14, color: Colors.black54),
                                //         enabledBorder: UnderlineInputBorder(
                                //             borderSide: BorderSide(
                                //                 color: Color.fromARGB(
                                //                     255, 0, 194, 184))),
                                //         border: UnderlineInputBorder(
                                //             borderSide: BorderSide(
                                //                 color: Color.fromARGB(
                                //                     255, 0, 194, 184)))),
                                //   ),
                                // )
                                Container(
                                    margin: EdgeInsets.only(top: 8),
                                    width: screenSize.width * 0.5,
                                    height: screenSize.height * 0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromARGB(
                                                      255, 0, 194, 184))),
                                      onPressed: () {
                                        if (dropdownValue != 'Ambos') {
                                          _movimentStore
                                              .setMovimentsByType(dropdownID);
                                        } else {
                                          _movimentStore.setMoviments();
                                        }
                                      },
                                      child: const Text(
                                        'CONSULTAR',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 4),
                            width: screenSize.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SpeedDial(
                                  elevation: 6,
                                  icon: _icon,
                                  backgroundColor:
                                      Color.fromARGB(255, 0, 194, 184),
                                  children: [
                                    SpeedDialChild(
                                        onTap: () async {
                                          var now = DateTime.now();
                                          var last =
                                              now.subtract(Duration(days: 7));
                                          var formattedI =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(now);
                                          var formattedF =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(last);
                                          print('Inicio: $formattedI');
                                          print('Fim: $formattedF');
                                          await _movimentStore.setMoviments(
                                              initialDate:
                                                  formattedF.toString(),
                                              finalDate: formattedI.toString());
                                        },
                                        label: '7 Dias',
                                        child: Icon(Icons.calendar_today)),
                                    SpeedDialChild(
                                        onTap: () async {
                                          var now = DateTime.now();
                                          var last =
                                              now.subtract(Duration(days: 15));
                                          var formattedI =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(now);
                                          var formattedF =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(last);
                                          print('Inicio: $formattedI');
                                          print('Fim: $formattedF');
                                          await _movimentStore.setMoviments(
                                              initialDate:
                                                  formattedF.toString(),
                                              finalDate: formattedI.toString());
                                        },
                                        label: '15 Dias',
                                        child: Icon(Icons.calendar_today)),
                                    SpeedDialChild(
                                        onTap: () async {
                                          var now = DateTime.now();
                                          var last =
                                              now.subtract(Duration(days: 30));
                                          var formattedI =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(now);
                                          var formattedF =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(last);
                                          print('Inicio: $formattedI');
                                          print('Fim: $formattedF');
                                          await _movimentStore.setMoviments(
                                              initialDate:
                                                  formattedF.toString(),
                                              finalDate: formattedI.toString());
                                        },
                                        label: '30 Dias',
                                        child: Icon(Icons.calendar_today)),
                                    SpeedDialChild(
                                        onTap: (() async {
                                          return showDialog<void>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Container(
                                                      width: screenSize.width *
                                                          0.7,
                                                      height: screenSize.width *
                                                          0.7,
                                                      child: SfDateRangePicker(
                                                        showActionButtons: true,
                                                        onCancel: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        onSubmit: (a) {
                                                          List _rangeIF = _range
                                                              .split(" - ");
                                                          Navigator.pop(
                                                              context);
                                                          print(_rangeIF);
                                                          _movimentStore.setMoviments(
                                                              initialDate:
                                                                  _rangeIF[0]
                                                                      .toString(),
                                                              finalDate: _rangeIF[
                                                                      1]
                                                                  .toString());
                                                        },
                                                        onSelectionChanged:
                                                            _onSelectionChanged,
                                                        selectionMode:
                                                            DateRangePickerSelectionMode
                                                                .range,
                                                      )),
                                                );
                                              });
                                        }),
                                        label: 'Selecionar data',
                                        child: Icon(Icons.calendar_today)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ]),
                      ))),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
