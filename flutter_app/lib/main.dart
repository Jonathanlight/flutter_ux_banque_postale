import 'package:flutter/material.dart';
import 'package:flutter_app/auth_page.dart';
import 'package:ionicons/ionicons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 231, 231),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(0.01),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 28,
                      height: 28,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Text(
                    "Bienvenue",
                    style: TextStyle(
                      color: Color.fromARGB(255, 7, 72, 177),
                      fontSize: 30.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 7, 72, 177),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(0.01),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "M John Light",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Se connecter",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: IconButton(
                        icon: Icon(
                          Ionicons.chevron_forward_outline,
                          color: Colors.white,
                        ),
                        onPressed: () => {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return AuthPage();
                          }))
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          blockContainer(Ionicons.call_outline, "Contacts"),
          blockContainer(
              Ionicons.newspaper_outline, "Produits Banque & Assurances"),
          blockContainer(
              Ionicons.bag_add_outline, "Mes opérations Certicodes Plus"),
          blockContainer(Ionicons.warning_outline, "Urgence"),
          blockContainer(Ionicons.help_circle_outline, "Aide"),
          blockContainer(Ionicons.color_palette_outline, "Cookies"),
          SizedBox(height: 8),
          blockContainer(Ionicons.person_add_outline, "Compte invité"),
        ],
      ),
    );
  }

  Widget blockContainer(IconData nameIcon, String nameBox) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: const Border(
            bottom: BorderSide(
              width: 0.5,
              color: Colors.grey,
            ),
          ),
          //borderRadius: BorderRadius.circular(0.01),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      nameIcon,
                      color: Color.fromARGB(255, 7, 72, 177),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        nameBox,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Ionicons.chevron_forward_outline,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
