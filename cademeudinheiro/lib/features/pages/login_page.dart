import 'package:cademeudinheiro/features/moviment/moviment_store.dart';
import 'package:cademeudinheiro/features/user/log_user.dart';
import 'package:cademeudinheiro/features/user/user_info.dart';
import 'package:cademeudinheiro/features/user/user_store.dart';
import 'package:cademeudinheiro/features/widgets/alerts_dialogs.dart';
import 'package:cademeudinheiro/services/nottification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../adm/adm_store.dart';
import '../../services/firebase_messaging_service.dart';
import '../../utils/convert_days.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserInfo _userInfo = UserInfo();
  late UserStore _userStore;
  late AdmStore _admStore;
  AlertDialogs _alertDialogs = AlertDialogs();
  final _name = TextEditingController();
  final _passwd = TextEditingController();
  late MovimentStore _movimentStore;

  @override
  void initState() {
    super.initState();
    initilizeFirebaseMessaging();
    checkNotifications();
  }

  checkNotifications() async {
    await Provider.of<NotificationService>(context, listen: false)
        .checkForNotifications();
  }

  initilizeFirebaseMessaging() async {
    await Provider.of<FirebaseMessagingService>(context, listen: false)
        .initialize();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
    _movimentStore = Provider.of<MovimentStore>(context);
    _admStore = Provider.of<AdmStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    const String _porkIcon = 'assets/images/porkIcon.svg';

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(
              _porkIcon,
              color: Color.fromARGB(255, 0, 194, 184),
              width: screenSize.width * 0.16,
              height: screenSize.height * 0.16,
            ),
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.05),
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.09,
              child: TextFormField(
                controller: _name,
                style: const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                decoration: const InputDecoration(
                    labelText: 'Usu??rio',
                    hintText: 'Digite seu usu??rio',
                    labelStyle: TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 0, 194, 184)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 194, 184))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 194, 184)))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.09,
              child: TextFormField(
                controller: _passwd,
                style: const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                decoration: const InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    labelStyle: TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 0, 194, 184)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 194, 184))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 194, 184)))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 194, 184))),
                onPressed: (() async {
                  _userInfo = await conectUser(_name.text, _passwd.text);
                  if (_userInfo.logged == false) {
                    _alertDialogs.showLoginFailedAlert(context);
                  } else {
                    _userStore.setType(_userInfo.userType!);

                    if(_userStore.type == 'adm') {
                      Navigator.pushReplacementNamed(context, '/adm_page');
                      _admStore.setId(_userInfo.userId);
                      await _admStore.getAllUsers();
                    } else {
                      await _movimentStore.setLastMoviments();
                        _userStore.setID(_userInfo.userId!);
                        _userStore.setNick(_userInfo.userNick!);
                        _userStore.setEmail(_userInfo.userEmail!);
                        _userStore.setSald(_userInfo.userSald!);
                        _userStore.setMinim(_userInfo.userMinim!);
                        _userStore.setPasswd(_userInfo.userPasswd!);

                        Navigator.pushReplacementNamed(context, '/home_page');
                    }
                  }
                  _name.text = '';
                  _passwd.text = '';
                }),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cad_page');
                },
                child: const Text(
                  'Novo por aqui? Fa??a seu cadastro!',
                  style: TextStyle(),
                ))
          ]),
        ),
      ),
    );
  }
}
