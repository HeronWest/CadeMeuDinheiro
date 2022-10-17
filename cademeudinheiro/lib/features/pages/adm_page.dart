import 'package:cademeudinheiro/adm/adm_store.dart';
import 'package:cademeudinheiro/features/moviment/moviment_store.dart';
import 'package:cademeudinheiro/features/widgets/appbar.dart';
import 'package:cademeudinheiro/features/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdmPage extends StatefulWidget {
  const AdmPage({Key? key}) : super(key: key);

  @override
  State<AdmPage> createState() => _AdmPageState();
}

bool _sortDate = true;
bool _sortLocal = true;
bool _sortValue = true;
bool _sortType = true;
bool _sortAsc = true;
int? _sortColumnIndex;

class _AdmPageState extends State<AdmPage> {

  late AdmStore _admStore;
  late MovimentStore _movimentStore;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _admStore = Provider.of<AdmStore>(context);
    _movimentStore = Provider.of<MovimentStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Container(
        width: screenSize.width * 0.9,
          height: screenSize.height * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 1,
                  color: Color.fromARGB(255, 0, 194, 184)),
              color: Color.fromARGB(255, 217, 245, 243)),
          child: DataTable(
              headingRowColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 0, 194, 184)),
              columnSpacing: 3,
              columns: [ 
                DataColumn(
                    label: Text('ID'),
                    onSort: (columnIndex, sortAscending) {
                            setState(() {
                            _sortAsc = sortAscending;
                            _sortColumnIndex = columnIndex;

                            sortAscending
                            ? _admStore.users.sort(
                            (a, b) => a.id!
                                .compareTo(b.id!))
                                : _admStore.users.sort(
                            (b, a) => a.id!
                                .compareTo(b.id!));
                            });
                            },
                              ),
                DataColumn(
                  label: SizedBox(
                      width: screenSize.width*0.45,
                      child: Text('Usuário',textAlign: TextAlign.start)),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      _sortAsc = sortAscending;
                      _sortColumnIndex = columnIndex;

                      sortAscending
                          ? _admStore.users.sort(
                              (a, b) => a.name!
                              .compareTo(b.name!))
                          : _admStore.users.sort(
                              (b, a) => a.name!
                              .compareTo(b.name!));
                    });
                  },
                ),
                DataColumn(
                  label: Text('Saldo', textAlign: TextAlign.right,),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      _sortAsc = sortAscending;
                      _sortColumnIndex = columnIndex;

                      sortAscending
                          ? _admStore.users.sort(
                              (a, b) => a.sald!
                              .compareTo(b.sald!))
                          : _admStore.users.sort(
                              (b, a) => a.sald!
                              .compareTo(b.sald!));
                    });
                  },
                ),],
              rows: List<DataRow>.generate(_admStore.users.length, (int index) => DataRow(cells: [

                DataCell(SizedBox(
                  width: screenSize.width*0.05,
                  child: Text(
                    '${_admStore.users[index].id}'
                  ),
                )),
                DataCell(
                    SizedBox(
                    width: screenSize.width*0.40,
                    child: Text('${_admStore.users[index].name}'),

                ),
                  onTap: () async {
                    print(index);
                    await _movimentStore.setMoviments(_admStore.users[index].id);
                    print(_movimentStore.moviments);
                  }
                ),
                DataCell(SizedBox(
                    width: screenSize.width*0.20,
                    child: Text(
                        'R\$${_admStore.users[index].sald!.toStringAsFixed(2)}'
                ),))
              ])),
          )
        )],
        ),
      ),
    );
  }
}
