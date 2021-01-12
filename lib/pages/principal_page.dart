import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class Item {
  IconData icon;
  Color color;
  String title;
  Item(this.icon, this.color, this.title);
}

class _PrincipalPageState extends State<PrincipalPage> {
  int _currentIndex = 0;
  bool _switch = true;
  final items = [
    Item(Icons.add, Colors.orange, "Oportunidades"),
    Item(Icons.compare_arrows_outlined, Colors.blue[300], "Transferir"),
    Item(Icons.attach_money_outlined, Colors.green[300], "Retiro sin tarjeta"),
    Item(Icons.settings, Colors.purple[300], "Pago servicios")
  ];

  ScrollController _controller;

  void onTapped(int pageTapped) {
    setState(() {
      _currentIndex = pageTapped;
    });
  }

  Widget card(int index) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor,
          ),
          height: 140,
          width: 220,
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
        Container(
          width: 220,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.credit_card_outlined, size: 14),
                  SizedBox(width: 4),
                  Text(
                    "Tarjeta digital",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 10),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Desactivar",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 10),
                  ),
                  Transform.scale(
                    scale: .6,
                    child: Switch(
                      value: _switch,
                      onChanged: (bool value) {
                        _switch = value;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    // print(_controller.offset);
    if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
      var pixel = _controller.position.pixels;
      var percent = ((pixel) / 260) / 10;
      var item = (pixel / 260).floor() + 1;
      var p1 = (pixel / 260);
      print("p1: $p1");
      print("pixel: $pixel");
      print("percent: $percent");
      print("item: $item");
      print("item percent: ${percent * item}");
      // if (ind >= index * 0.4) {
      //   _controller.animateTo(
      //     (index * 260).floorToDouble(),
      //     duration: Duration(milliseconds: 50),
      //     curve: Curves.bounceIn,
      //   );
      // }
      // _controller.animateTo(offset);
    }
    // if (itemPositionsListener.offset > 245 && _controller.offset < 300) {

    //   itemScrollController.scrollTo(
    //       index: 1,
    //       duration: Duration(seconds: 2),
    //       curve: Curves.easeInOutCubic);
    // }
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
                                    InkWell(
                                      onTap: () {
                                        print("asd");
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.stop_circle,
                                            color: Colors.grey,
                                            size: 7,
                                          ),
                                          SizedBox(width: 1),
                                          Icon(
                                            Icons.stop_circle,
                                            color: Colors.grey,
                                            size: 7,
                                          ),
                                          SizedBox(width: 1),
                                          Icon(
                                            Icons.stop_circle,
                                            color: Colors.grey,
                                            size: 7,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Expanded(
                                  child: ListView.separated(
                                    separatorBuilder: (_, __) => Divider(),
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () {},
                                        contentPadding: EdgeInsets.all(0),
                                        trailing: Icon(Icons.arrow_right),
                                        title: Row(
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "001aH123",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                Text(
                                                  "*123456",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            Text(
                                              "\$20.000",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
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
                                final title = items[index].title;

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
                                        title,
                                        style: TextStyle(
                                            fontSize: 12,
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
                          color: Colors.white,
                          alignment: Alignment.center,
                          height: 320,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Tus tarjetas",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 10,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  controller: _controller,
                                  itemBuilder: (_, index) {
                                    return card(index);
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
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
