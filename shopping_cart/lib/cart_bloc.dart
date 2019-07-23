import 'package:flutter/material.dart';

class CartBloc with ChangeNotifier{
  Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;//getter

  void addToCart(int index){
    if(_cart.containsKey(index)){//user click to item index
      _cart[index]++;//increase amount of that item in cart page
    }
    else{
      _cart[index] = 1;
    }
    notifyListeners();//notify user when click to that item
  }

  void clearItem(int index){
    if(_cart.containsKey(index)){
      _cart.remove(index);//delete amount of item
      notifyListeners();
    }
  }
}