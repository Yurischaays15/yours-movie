
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final List<Cart> carts;

  ProductPage(this.carts);
    
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: carts.isEmpty ? Column(children: [
        Text("Empty Order",
        style: Theme.of(context).textTheme.title,
        ),
      ],
    ):
      ListView.builder(
        itemBuilder: (context, index) {
          double total_harga = carts[index].harga * carts[index].qty;
          return Card(
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10, 
                          horizontal: 15),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            carts[index].qty.toString(),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Waiter(' + carts[index].nama+')',
                              style: TextStyle(
                                color: 
                              ),
                            ],
                          )
                          )
                    ],
                  ))
              ],
            ),
          )
        } 
        )()
    );
  }
}