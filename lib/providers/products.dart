import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  bool isFavourite;
  Products(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavourite = false});
  void setFvt(bool newValue) {
    isFavourite = newValue;
    notifyListeners();
  }

  Future<void> toogleFvt(String token, String userId) async {
    var oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    var url = Uri.parse(
        'https://shop-e0f27-default-rtdb.asia-southeast1.firebasedatabase.app/userFavourite/$userId/$id.json?auth=$token');
    try {
      final response = await http.put(
        url,
        body: json.encode(
          isFavourite,
        ),
      );
      if (response.statusCode >= 400) {
        setFvt(oldStatus);
      }
    } catch (error) {
      setFvt(oldStatus);
    }
  }
}
