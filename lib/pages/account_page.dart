import 'package:bbva_challenge/pages/principal_page.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  final Account account;
  const AccountPage({Key key, @required this.account}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final items = [
    Item(Icons.add, Colors.orange, "Oportunidades"),
    Item(Icons.compare_arrows_outlined, Colors.blue[300], "Transferir"),
    Item(Icons.attach_money_outlined, Colors.green[300], "Retiro sin tarjeta"),
    Item(Icons.settings, Colors.purple[300], "Pago servicios")
  ];

  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Theme.of(context).primaryColor,
        );

    Widget card(Account account) {
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
                        "*${account.number.substring(5, 9)}",
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
        title: Text("Cuenta *${this.widget.account.name.substring(5)}"),
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
          card(this.widget.account),
          Container(
            height: 160,
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 160,
                  // color: index % 2 == 0 ? Colors.red[400] : Colors.blue[400],
                  child: Column(
                    children: [
                      Expanded(child: Container()),
                      FloatingActionButton(
                        heroTag: "btn$index",
                        child: Icon(items[index].icon),
                        onPressed: () {},
                      ),
                      SizedBox(height: 10),
                      Text(items[index].title),
                      Expanded(child: Container()),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
