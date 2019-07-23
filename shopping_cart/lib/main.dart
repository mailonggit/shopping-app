import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_bloc.dart';
import 'cart_page.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartBloc>(//auto dispose
      builder: (context) => CartBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shopping Cart",
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        home: HomePage(),
      ),
    );
  }
}

