import 'dart:convert';

import '../models/productdetail.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartSharedPreferences {
  static const _cartKey = 'cartitems';

  Future<void> saveCartItems(List<ProductDetail> cartItems) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Load existing cart items from shared preferences
    List<ProductDetail> existingCartItems = await loadCartItems();

    // Add the new cart items to the existing list
    existingCartItems.addAll(cartItems);

    // Convert each cart item to JSON and create a list of JSON strings
    List<String> cartJsonList =
        existingCartItems.map((item) => jsonEncode(item.toJson())).toList();

    // Save the updated list of JSON strings to shared preferences
    prefs.setStringList(_cartKey, cartJsonList);
  }

  Future<List<ProductDetail>> loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the list of JSON strings from shared preferences
    List<String>? cartJsonList = prefs.getStringList(_cartKey);

    if (cartJsonList != null) {
      // Convert each JSON string back to a ProductDetail object
      List<ProductDetail> cartItems = cartJsonList
          .map((json) => ProductDetail.fromJson(jsonDecode(json)))
          .toList();
      return cartItems;
    } else {
      return [];
    }
  }
}
