import 'package:cademeudinheiro/features/login_page/login_page.dart';
import '../conf_page/conf_page.dart';
import '../features/cad_page/cad_page.dart';
import 'package:flutter/cupertino.dart';

import '../features/cad_page/preconf_page.dart';
import '../features/home/home_page.dart';

class Routes {
  static const initial = '/';
  static const login_page = '/login_page';
  static const cad_page = '/cad_page';
  static const home_page = '/home_page';
  static const conf_page = '/conf_page';
  static const preconf_page = '/preconf_page';


  static Map<String, Widget Function(BuildContext)> routes = {
    login_page: (BuildContext context) => LoginPage(),
    cad_page: (BuildContext context) => CadPage(),
    home_page: (BuildContext context) => HomePage(),
    conf_page: (BuildContext context) => ConfPage(),
    preconf_page:(BuildContext context) => PreConfPage(),
  };
}
