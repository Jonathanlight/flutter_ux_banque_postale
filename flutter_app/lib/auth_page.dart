import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/dashboard_page.dart';
import 'package:ionicons/ionicons.dart';
import "dart:math";

class AuthPage extends StatefulWidget {
  const AuthPage();

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  List numberTap = ["", "", "", "", "", "", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  var randomItem = [];
  final TextEditingController _identifientController =
      new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _identifientController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeContainer = MediaQuery.of(context).size;
    randomItem = (numberTap.toList()..shuffle());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 72, 177),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => {Navigator.pop(context, false)},
                  icon: Icon(
                    Ionicons.chevron_back_outline,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130.0),
                  child: Center(
                    child: Text(
                      "Connexion",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, left: 20, right: 20),
            child: Container(
              color: Colors.white,
              height: 510.0,
              width: sizeContainer.width,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 45, right: 45, top: 15, bottom: 5),
                    child: TextField(
                      controller: _identifientController,
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      enableInteractiveSelection: false,
                      textAlign: TextAlign.center,
                      toolbarOptions: ToolbarOptions(copy: false, paste: false),
                      obscureText: true,
                      obscuringCharacter: "*",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(8),
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      cursorColor: Colors.grey,
                      style: TextStyle(fontSize: 30),
                      decoration: InputDecoration(
                        counter: Offstage(),
                        isDense: true,
                        contentPadding: EdgeInsets.all(5),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 45, right: 45, top: 1, bottom: 5),
                    child: TextField(
                      cursorColor: Colors.grey,
                      controller: _passwordController,
                      style: TextStyle(fontSize: 25),
                      toolbarOptions: ToolbarOptions(copy: false, paste: false),
                      maxLength: 8,
                      enableInteractiveSelection: false,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(8),
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      decoration: InputDecoration(
                        isDense: true,
                        counter: Offstage(),
                        contentPadding: EdgeInsets.all(8),
                        hintText: 'Composez votre mot de passe',
                        hintStyle: TextStyle(fontSize: 18),
                        labelStyle: TextStyle(fontSize: 10),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 45, right: 45, top: 1, bottom: 5),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      itemCount: randomItem.length,
                      itemBuilder: (context, index) {
                        final nbTap = randomItem[index];
                        return Container(
                          color: Color.fromARGB(255, 7, 72, 177),
                          child: Center(
                            //
                            child: TextButton(
                              onPressed: () {
                                if (_passwordController.text.length < 8) {
                                  final updatedText = _passwordController.text +
                                      randomItem[index].toString();

                                  _passwordController.value = TextEditingValue(
                                    text: updatedText,
                                  );

                                  _passwordController.selection =
                                      TextSelection.fromPosition(
                                    TextPosition(
                                        offset:
                                            _passwordController.text.length),
                                  );
                                }
                              },
                              child: Text(
                                " $nbTap ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 45, right: 45, top: 1, bottom: 5),
                    child: Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            if (_identifientController.text.length == 8 &&
                                _passwordController.text.length == 8) {
                              print(_identifientController.text);
                              print(_passwordController.text);

                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return DashboardPage();
                              }));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(138, 7, 72, 177)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            )),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 26.0, right: 25, top: 8, bottom: 8),
                            child: const Text("VALIDER",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: () {
                            _passwordController.value = TextEditingValue(
                              text: "",
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(231, 116, 116, 116)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            )),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 26, right: 26, top: 8, bottom: 8),
                            child: const Text("EFFACER",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.lock_outline,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Text("Mot de passe oublié",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    )),
                IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Ionicons.chevron_forward_outline,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Text("Information sécurité",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
