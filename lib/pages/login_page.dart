import 'package:bbva_challenge/pages/principal_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible;

  @override
  void initState() {
    isVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image(
          width: 80.0,
          color: Theme.of(context).primaryColor,
          image: AssetImage("assets/img/BBVA_2019@1X.png"),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/img/4.jpg"),
                        ),
                        SizedBox(width: 14),
                        CircleAvatar(
                          radius: 14,
                          child: Icon(Icons.rowing_rounded, size: 18),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Hola, Gustavo",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Que tal tu dia hoy?",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(.6),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Contraseña",
                      suffixIcon: isVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Ingresar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PrincipalPage();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Olvide mi contraseña",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(Icons.security,
                            color: Theme.of(context).primaryColor),
                        SizedBox(width: 20),
                        Text(
                          "Token Movil",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(Icons.qr_code,
                            color: Theme.of(context).primaryColor),
                        SizedBox(width: 20),
                        Text(
                          "Operacion \nQR + CoDi",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(Icons.phone_in_talk,
                            color: Theme.of(context).primaryColor),
                        SizedBox(width: 20),
                        Text(
                          "Linea BBVA",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
