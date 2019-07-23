import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_bloc.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('View Cart'),
      ),     
      body: ListView.builder(
        itemCount: bloc.cart.length,
        itemBuilder: (context, index){
          //key: type of item, value: amount of that item
          int type = bloc.cart.keys.toList()[index];//item index
          int count = bloc.cart[type];
          return ListTile(         
            enabled: true,
            title: Text('Type: ${type + 1}, Amount:$count'),
            leading: Container(
              width: 100.0,
              height: 50.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image/${index + 1}.png'),
                  fit: BoxFit.fitWidth,
                ),
                border: Border.all(width: 1, color: Colors.red),
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              splashColor: Colors.red,
              onPressed: (){
                bloc.clearItem(type);
              },
            ),
          );
          
        },
      ),
    );
  }
}