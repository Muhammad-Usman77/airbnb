import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
Future<void> saveCategoryToFirebase() async {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection("appCategory");
  
  for (final Category place in categoriesList) {
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();
    ref.doc("das");
    await ref.doc(id).set(place.toMap());
  }
}
class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "title": title,
      "image": image,
    };
  }
}
  final List<Category> categoriesList = [
    Category(title: "Rooms",
     image: "https://img.freepik.com/free-vector/illustration-hand-house-real-estate-icon_53876-6147.jpg?t=st=1742316690~exp=1742320290~hmac=f0ca79049e5de1bee397f38a3a59fd611a093060dc890f319fb26a4a794a1cb9&w=740",
     ),
    Category(title: "Icons",
     image: "https://img.freepik.com/free-vector/illustration-hand-house-real-estate-icon_53876-6147.jpg?t=st=1742316690~exp=1742320290~hmac=f0ca79049e5de1bee397f38a3a59fd611a093060dc890f319fb26a4a794a1cb9&w=740",
    ),
    Category(title: "Surfind",
     image: "https://img.freepik.com/free-vector/illustration-hand-house-real-estate-icon_53876-6147.jpg?t=st=1742316690~exp=1742320290~hmac=f0ca79049e5de1bee397f38a3a59fd611a093060dc890f319fb26a4a794a1cb9&w=740",
    ),
    Category(title: "Design",
     image: "https://img.freepik.com/free-vector/illustration-hand-house-real-estate-icon_53876-6147.jpg?t=st=1742316690~exp=1742320290~hmac=f0ca79049e5de1bee397f38a3a59fd611a093060dc890f319fb26a4a794a1cb9&w=740",
    ),
    Category(title: "Amazing Views",
     image: "https://img.freepik.com/free-vector/illustration-hand-house-real-estate-icon_53876-6147.jpg?t=st=1742316690~exp=1742320290~hmac=f0ca79049e5de1bee397f38a3a59fd611a093060dc890f319fb26a4a794a1cb9&w=740",
    ),
    Category(title: "New",
     image: "https://img.freepik.com/free-vector/illustration-hand-house-real-estate-icon_53876-6147.jpg?t=st=1742316690~exp=1742320290~hmac=f0ca79049e5de1bee397f38a3a59fd611a093060dc890f319fb26a4a794a1cb9&w=740",
    ),
  ];
