import 'package:favorite_place_jhonny_mustafa/models/favorite_place.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  final List<FavoritePlaceItem> _favPlaceItem = [];

  List<FavoritePlaceItem> get favPlaceItem => _favPlaceItem;

  void addPlace(FavoritePlaceItem item) {
    _favPlaceItem.add(
      FavoritePlaceItem(
        name: item.name,
        image: item.image,
        location: item.location,
        lat: item.lat,
        lng: item.lng,
      ),
    );
    notifyListeners();
  }
}
