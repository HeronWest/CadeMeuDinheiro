import 'package:cademeudinheiro/features/home/appbar.dart';
import 'package:cademeudinheiro/features/home/drawer.dart';
import 'package:cademeudinheiro/features/login_page/login_page.dart';
import 'package:cademeudinheiro/features/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _nameState();
}

class _nameState extends State<HomePage> {
  late UserStore _userStore = UserStore();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const MyAppBar(),
        drawer: MyDrawer(),
        backgroundColor: Color.fromARGB(255, 217, 245, 243),
        body: Center(
          child: Column(children: [
            Container(
              child: IconButton(
                  icon: Icon(
                    Icons.add_a_photo,
                    size: screenSize.width * 0.15,
                  ),
                  onPressed: (() {})),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              width: screenSize.width * 0.35,
              height: screenSize.width * 0.35,
            ),
            SizedBox(
              width: screenSize.width * 0.85,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: screenSize.width * 0.85,
                          margin: const EdgeInsets.only(top: 5),
                          child: const Center(
                            child: Text('SALDO / MÍNIMO',
                                style: TextStyle(color: Colors.black54)),
                          )),
                      Container(
                          width: screenSize.width * 0.85,
                          margin: const EdgeInsets.only(top: 2),
                          child: Center(
                            child: Text(
                                'R\$${_userStore.sald} / R\$${_userStore.minim}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(
                                    255,
                                    0,
                                    194,
                                    184,
                                  ),
                                )),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: screenSize.width * 0.85,
              height: screenSize.height * 0.35,
              color: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: screenSize.width * 0.05,
                    ),
                    color: Colors.green,
                    width: screenSize.width * 0.6,
                    height: screenSize.height * 0.05,
                  ),
                  Container(
                    color: Colors.black,
                    width: screenSize.width * 0.20,
                    height: screenSize.height * 0.05,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: screenSize.width * 0.85,
              height: screenSize.height * 0.07,
              color: Colors.amber,
            ),
          ]),
        ));
  }
}
