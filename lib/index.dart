import 'package:flutter/material.dart';
import 'package:flutter_app/entity/order.dart';
import 'package:flutter_app/util/net.dart';
import 'package:flutter_app/util/netUtil.dart';
import 'dart:convert';

class Index extends StatefulWidget {
  // final items ;
  final String title;
  Index({Key key, this.title = "ha"}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new IndexState();
}

class IndexState extends State<Index> {
  List<Order> _items = [];
  Order select;

  @override
  void initState() {
    List<Order> items = [];
    HttpController.get("http://127.0.0.1:10005/api/all", (data) {
      if (data != null) {
        final body = json.decode(data.toString());

        print(body);
        body.forEach((f) {
          Order o = new Order(f["order_id"], f["creater_id"], f["describe"]);

          //print(f);
          items.add(o);
        });

        print("build" + items.length.toString());
      }

      setState(() {
        _items = items;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<Widget> tiles = _items.map((order) {
      return new ListTile(
          title: Text(order.order_id), trailing: Icon(Icons.star_border));
    }).toList();
    tiles.add(new ListTile(
      title: Text(
        "新增工单",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
      ),
    ));

    return ListView(
              padding: EdgeInsets.all(20.0),
              children: tiles,

    );
  }

  static List<String> _getItems() {
    return List<String>.generate(10, (i) => "list$i");
  }
}

/*
ListView.builder(
        padding: EdgeInsets.all(20.0),

        itemCount: _items.length,
        itemBuilder: ( context,  index) {
          return new ListTile(
            trailing: Icon(Icons.ac_unit),
            title: new Text("${_items[index].order_id}"),
          );
        });


 */
