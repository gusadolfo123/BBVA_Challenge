import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class Item {
  IconData icon;
  Color color;
  Item(this.icon, this.color);
}

class _PrincipalPageState extends State<PrincipalPage> {
  int _currentIndex = 0;
  final items = [
    Item(Icons.add, Colors.orange),
    Item(Icons.arrow_upward_sharp, Colors.blue[700]),
    Item(Icons.money, Colors.blue[300]),
    Item(Icons.circle_notifications, Colors.purple)
  ];

  void onTapped(int pageTapped) {
    setState(() {
      _currentIndex = pageTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Hola, Gustavo"),
        actions: [
          FloatingActionButton(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.ac_unit),
              onPressed: () {}),
        ],
      ),
      drawer: Drawer(),
      body: Stack(
        children: [
          // Container(color: Theme.of(context).primaryColor),
          CustomScrollView(
            // physics: BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Stack(
                  children: [
                    // Container(color: Colors.grey[200]),
                    Container(
                      color: Theme.of(context).primaryColor,
                      height: size.height * 0.2,
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          height: 200,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "TUS CUENTAS",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: Container()),
                                    Icon(
                                      Icons.point_of_sale,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            height: 120,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                final icon = Icon(items[index].icon);
                                final color = items[index].color;

                                return Container(
                                  height: 60,
                                  width: 120,
                                  child: Column(
                                    children: [
                                      Expanded(child: Container()),
                                      FloatingActionButton(
                                        heroTag: "btn$index",
                                        backgroundColor: color,
                                        elevation: 0,
                                        child: icon,
                                        onPressed: () {},
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Texto $index",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      Expanded(child: Container()),
                                    ],
                                  ),
                                );
                              },
                            )),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          height: 200,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "TUS CUENTAS",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: Container()),
                                    Icon(
                                      Icons.point_of_sale,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 80),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (pageTapped) => onTapped(pageTapped),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    activeIcon: Column(
                      children: [
                        Icon(
                          Icons.notifications_none_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    label: "A",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    activeIcon: Column(
                      children: [
                        Icon(
                          Icons.favorite_border_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    label: "B",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add_circle_outline_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    activeIcon: Column(
                      children: [
                        Icon(
                          Icons.add_circle_outline_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    label: "C",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.mail_outline,
                      color: Theme.of(context).primaryColor,
                    ),
                    activeIcon: Column(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          color: Theme.of(context).primaryColor,
                        ),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    label: "D",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
