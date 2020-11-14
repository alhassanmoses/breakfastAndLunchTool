import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:lunch_and_breakfast_tool/sizeConfig.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat mw = DateFormat('MMMM');
    final DateFormat dn = DateFormat('dd');
    final DateFormat dw = DateFormat('E');
    final String monthWord = mw.format(now);
    final String dayNum = dn.format(now);
    final String dayWord = dw.format(now);

    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            child: IconTextColumnRow(),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Center(child: Text("Order your meal")),
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DateColumn(
                          monthWord: monthWord,
                          dayNum: dayNum,
                          dayWord: dayWord),
                      Expanded(
                        child: Column(
                          children: [
                            FoodAccompanimentsAndOrders(
                              title: "KENKEY",
                              accompaniments: ["PEPPER", "SHITO"],
                            ),
                            FoodAccompanimentsAndOrders(
                              title: "JOLLOF",
                              accompaniments: [
                                "TOSSED VEGETABLES",
                                "SAUCE",
                              ],
                            ),
                            FoodAccompanimentsAndOrders(
                              title: "FRIED RICE",
                              accompaniments: [
                                "TOSSED VEGETABLES",
                                "SAUCE",
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Color(0xff394DDA),
                    child: Text("Check order"),
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateColumn extends StatelessWidget {
  const DateColumn({
    Key key,
    @required this.monthWord,
    @required this.dayNum,
    @required this.dayWord,
  }) : super(key: key);

  final String monthWord;
  final String dayNum;
  final String dayWord;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
      color: Color(0xffF8F8F8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            color: Color(0xff32a067),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(8.0)),
              child: Text(
                monthWord,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          Text(
            dayNum,
            style: TextStyle(fontSize: 50, color: Color(0xff32a067)),
          ),
          Text(
            dayWord,
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}

class FoodAccompanimentsAndOrders extends StatelessWidget {
  FoodAccompanimentsAndOrders({
    Key key,
    @required this.accompaniments,
    @required this.title,
  }) : super(key: key);

  final List<String> accompaniments;
  final title;

  getAccompaniments() {
    String ac = "";
    for (int i = 1; i < accompaniments.length; i++) {
      ac = ac + ", ${accompaniments[i]}";
    }
    return "${accompaniments[0]}" + ac;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.restaurant,
          color: Color(0xff9999AC),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Container(
              width: getProportionateScreenWidth(160),
              height: getProportionateScreenHeight(20),
              constraints: BoxConstraints(
                  maxHeight: getProportionateScreenHeight(40),
                  minHeight: getProportionateScreenHeight(10)),
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: Text(
                  getAccompaniments(),
                  // softWrap: true,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff9999AC),
                  ),
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Card(
          elevation: 8,
          margin: EdgeInsets.fromLTRB(0, 0, getProportionateScreenWidth(10), 0),
          color: Color(0xff34C851),
          child: Container(
            margin: EdgeInsets.all(0),
            child: Text(
              "11",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

class IconTextColumnRow extends StatelessWidget {
  const IconTextColumnRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconTextColumn(
            icon: Icons.fastfood,
            title: "Order Meal",
            tapped: () {},
          ),
          IconTextColumn(
            icon: Icons.search,
            title: "Search Order",
            tapped: () {},
          ),
          IconTextColumn(
            icon: Icons.message,
            title: "Messages",
            tapped: () {},
          ),
        ],
      ),
    );
  }
}

class IconTextColumn extends StatelessWidget {
  const IconTextColumn({
    Key key,
    this.icon,
    this.title,
    this.tapped,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final Function tapped;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: tapped,
          color: Colors.lightBlue,
        ),
        Text(title)
      ],
    );
  }
}
