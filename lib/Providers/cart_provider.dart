import 'package:ecommerce/model/cart.dart';
import 'package:flutter/material.dart';

import '../model/produt.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _productList = [];
  List<Cart> _cartList = [];

  int get productLen => _productList.length;

  List<Product> get getProduct => _productList;
  List<Cart> get cartList => _cartList;

  void addProduct(Product product) {
    _productList.add(product);
    if (_cartList.isEmpty) {
      _cartList.add(Cart(product: product, numOfItem: 1));
    } else {
      Cart? cart;
      _cartList.forEach((element) {
        if (element.product.id == product.id) {
          element.numOfItem += 1;
          return;
        } else {
          cart = Cart(product: product, numOfItem: 1);
          return;
        }
      });
      if (cart != null) {
        _cartList.add(cart!);
      }
    }
    notifyListeners();
  }

  void removeProduct(Product product) {
    _productList.add(product);
    notifyListeners();
  }
}
