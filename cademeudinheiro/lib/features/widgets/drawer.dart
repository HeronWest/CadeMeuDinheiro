import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _nameState();
}

class _nameState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Color.fromARGB(255, 0, 194, 184),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: Colors.white),
            width: screenSize.width * 0.3,
            height: screenSize.width * 0.3,
            child: IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  size: screenSize.width * 0.1,
                ),
                onPressed: (() {})),
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
                onPressed: () {
                  Navigator.pushNamed(context, '/preconf_page');
                },
                child: const Text(
                  'CONFIGURAÇÕES',
                  style: TextStyle(color: Colors.white),
                ),
              )),
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
                onPressed: () {
                  Navigator.pushNamed(context, '/consult_page');
                },
                child: const Text(
                  'CONSULTAS',
                  style: TextStyle(color: Colors.white),
                ),
              )),
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
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login_page');
                },
                child: const Text(
                  'LOGOUT',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
