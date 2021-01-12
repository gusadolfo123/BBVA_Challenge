import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Theme.of(context).primaryColor,
        );

    Widget card(int index) {
      return Column(
        children: [
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
            ),
            height: 220,
            width: MediaQuery.of(context).size.width - 40,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: 50,
                    image: AssetImage("assets/img/BBVA_2019@1X.png"),
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: 25,
                    height: 20,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.orange,
                    ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Text(
                        "*$index",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "VISA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        textTheme: newTextTheme,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor, //change your color here
        ),
        elevation: 0,
        centerTitle: true,
        title: Text("Cuenta *123456"),
        actions: [
          FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.white,
            child: Icon(Icons.ac_unit, color: Theme.of(context).primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          card(1),
          Container(
            height: 160,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
