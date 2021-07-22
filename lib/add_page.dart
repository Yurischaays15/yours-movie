import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  AddItem(this.addNew);
  final Function addNew;

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final titleController = TextEditingController();
  final namaController = TextEditingController();
  final priceController = TextEditingController();
  final qtyController = TextEditingController();

  void saveNewItem() {
    final title = titleController.text;
    final nama = namaController.text;
    final price = priceController.text;
    final qty = int.parse(qtyController.text);

    if (title.isEmpty || nama.isEmpty || price.isEmpty || qty <= 0) {
      return;
    }
    widget.addNew(title,nama, double.parse(price), qty);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: Text("New Order Movie", style: TextStyle(color: Colors.black, fontSize: 15),
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Order Name'),
                controller: titleController
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Cashier'),
                controller: namaController
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                controller: priceController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Qty'),
                controller: qtyController,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                child: Text('Add'),
                onPressed: saveNewItem,
                ),
            ],
          ),
        )
      ),
      
    );
  }
}