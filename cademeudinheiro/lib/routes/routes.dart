import 'package:cademeudinheiro/features/pages/precons_page.dart';
import 'package:cademeudinheiro/features/pages/relatory_page.dart';
import '../features/pages/conf_page.dart';
import '../features/pages/cad_page.dart';
import 'package:flutter/cupertino.dart';
import '../features/pages/consult_page.dart';
import '../features/pages/home_page.dart';
import '../features/pages/login_page.dart';
import '../features/pages/preconf_page.dart';

class Routes {
  static const initial = '/';
  static const login_page = '/login_page';
  static const cad_page = '/cad_page';
  static const home_page = '/home_page';
  static const conf_page = '/conf_page';
  static const preconf_page = '/preconf_page';
  static const consult_page = '/consult_page';
  static const precons_page = '/precons_page';
  static const relatory_page = '/relatory_page';

  static Map<String, Widget Function(BuildContext)> routes = {
    login_page: (BuildContext context) => LoginPage(),
    cad_page: (BuildContext context) => CadPage(),
    home_page: (BuildContext context) => HomePage(),
    conf_page: (BuildContext context) => ConfPage(),
    preconf_page: (BuildContext context) => PreConfPage(),
    consult_page: (BuildContext context) => ConsultPage(),
    precons_page: (BuildContext context) => PreConsPage(),
    relatory_page: (BuildContext context) => RelatoryPage(),
  };

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
