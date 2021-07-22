import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yours-Movie",
      theme: ThemeData(
        primarySwatch: Colors.pink.shade300,
        accentColor: Colors.pink.shade300,
        textTheme: ThemeData.light().textTheme.copyWith(
          headline5: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
        )
      ),
      home: Home(),
      routes: <String, WidgetBuilder> {
        'page1' : (BuildContext context) => new Home(),
        'page2' : (BuildContext context) => new ProfilMovie(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final List<Cart> _carts = [];
  void _openModal(BuildContext context) {
    showCupertinoModalPopup(context: context, builder: (_){
      return AddItem(_addNewItem);
    }
    );
  }

  void _addNewItem(String title, String nama, double price, int qty) {
    final newItem = Cart(id: DateTime.now().toString(), title: title, nama: nama, harga: harga, qty: qty
    );
    setState(() {
      _carts.add(newItem);
    });
  }

  void _resetCarts() {
    setState(() {
      _carts.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.playlist_add_sharp,color: Colors.black),

        onPressed: () => _openModal(context),
        ),

        appBar: AppBar(
          leading: new IconButton(
            icon: Icon(Icons.info_outline_rounded, color: Colors.black,),
            onPressed: (){
              Navigator.pushNamed(context, 'page2');
            },
          ),
          title: Text("Yours-Movie"),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.restore_from_trash_rounded,color: Colors.black,),
              onPressed: () => _resetCarts())
          ],
        ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomePage(_carts),
            MoviePage(_carts),
          ],
        ),
      ),
    );
  }
}