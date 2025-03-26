import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePro extends ChangeNotifier {
  List<String> _favoriteIds = [];
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<String> get favorite => _favoriteIds;

  FavoritePro() {
    loadFavorite();
  }

  //toggle favorite state
  void toggleFavorite(DocumentSnapshot place) async {
    String placeId = place.id;
    if (_favoriteIds.contains(placeId)) {
      _favoriteIds.remove(placeId);
      await _removeFavorite(placeId); // remove from favorite
    } else {
      _favoriteIds.add(placeId);
      await _addFavorites(placeId);
    }
    notifyListeners();
  }

  //check if a place is favorite
  bool isExist(DocumentSnapshot place) {
    return _favoriteIds.contains(place.id);
  }

  //add favorites items to firestore
  Future<void> _addFavorites(String placeId) async {
    try {
      //create favorite collection
      await firebaseFirestore
          .collection("userFavorites")
          .doc(placeId)
          .set({"isFavorite": true});
    } catch (e) {
      print(e.toString());
    }
  }

  // remove from favorite
  Future<void> _removeFavorite(String placeId) async {
    try {
      //create userfavorite collection
      await firebaseFirestore.collection("userFavorites").doc(placeId).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  //load favorite item from fireStore
  Future<void> loadFavorite() async {
    try {
      QuerySnapshot snapshot =
          await firebaseFirestore.collection("userFavorites").get();
      _favoriteIds = snapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  //static method acces provider from any class
  static FavoritePro of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoritePro>(context, listen: listen);
  }
}
