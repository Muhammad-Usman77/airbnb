import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

Future<void> savePlacesToFirebase() async {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection("myAppCollection");
  
  for (final Place place in listOfPlace) {
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();
    ref.doc("das");
    await ref.doc(id).set(place.toMap());
  }
}

class Place {
  final String title;
  bool isActive;
  final String image;
  final double rating;
  final String date;
  final int price;
  final String address;
  final String vendor;
  final String vendordProfession;
  final String vendorProfile;
  final int review;
  final String bedAndBathroom;
  final int yearOfHostin;
  final double latitude;
  final double longitude;
  final List<String> imageUrls;

  Place({
    required this.title,
    required this.isActive,
    required this.image,
    required this.rating,
    required this.date,
    required this.price,
    required this.address,
    required this.vendor,
    required this.vendordProfession,
    required this.vendorProfile,
    required this.review,
    required this.bedAndBathroom,
    required this.yearOfHostin,
    required this.latitude,
    required this.longitude,
    required this.imageUrls,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "title": title,
      "isActive": isActive,
      "image": image,
      "rating": rating,
      "date": date,
      "price": price,
      "address": address,
      "vendor": vendor,
      "vendorProfession": vendordProfession,
      "vendorProfile": vendorProfile,
      "review": review,
      "bedAndBathroom": bedAndBathroom,
      "yearOfHostin": yearOfHostin,
      "latitude": latitude,
      "longitude": longitude,
      "imageUrls": imageUrls,
    };
  }
}

 final List<Place> listOfPlace = [
    Place(
        isActive: true,
        title: "Nice small bedroom in a nice small house",
        image: "https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp",
        rating: 4.85,
        review: 126,
        bedAndBathroom: "I bed . shared bathroom",
        date: "Nov 11-16",
        price: 38,
        address: "KathMandu , Nepal",
        vendor: " Stay with Marianne",
        vendordProfession: " -Retired",
        yearOfHostin: 10,
        vendorProfile: "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        latitude: 27.7293,
        longitude: 85.3343,
        imageUrls: [
          "https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp",
          "https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp",
          "https://cf.bstatic.com/xdata/images/hotel/max1024x768/555388877.jpg?k=411aeadba28c163f7258bd38e11971631291a754db42502b1b35e6d36d456738&o=",
          "https://cf.bstatic.com/xdata/images/hotel/max1024x768/555388877.jpg?k=411aeadba28c163f7258bd38e11971631291a754db42502b1b35e6d36d456738&o=",
        ]),
    Place(
        title: "Connect with your heart to this megical place",
        isActive: true,
        image: "https://cf.bstatic.com/xdata/images/hotel/max500/620531969.webp?k=e1f7ffbff63b41720bed22e778a6932dd3d599d214065da351589b0b227babec&o=",
        rating: 4.33,
        date: "Dec 17-22",
        price: 76,
        address: "Lyon , france",
        vendor: "Benedicte",
        vendordProfession: " -Teacher",
        vendorProfile: "https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        review: 236,
        bedAndBathroom: "2 queen beds . shared bathroom ",
        yearOfHostin: 8,
        latitude: 45.7640,
        longitude: 4.8357,
        imageUrls: [
          "https://cf.bstatic.com/xdata/images/hotel/max500/78824537.webp?k=a99cd56b09b687786c34baea4844cba94b8918d7ce3d5459da6a018de3851b49&o=",
          "https://cf.bstatic.com/xdata/images/hotel/max500/620531969.webp?k=e1f7ffbff63b41720bed22e778a6932dd3d599d214065da351589b0b227babec&o=",
          "https://cf.bstatic.com/xdata/images/hotel/max500/620531969.webp?k=e1f7ffbff63b41720bed22e778a6932dd3d599d214065da351589b0b227babec&o=",
        ]),
    Place(
        title: "En-Suite @ Sunrise beach",
        isActive: false,
        image: "https://akm-img-a-in.tosshub.com/indiatoday/images/bodyeditor/202109/PG-24-25-Spice-September-2021--x675.jpg?d22CSc6dMdHA6.Ag_NByjUQe5zOPr63Z?size=750:*",
        rating: 490,
        date: "Jan 26-29",
        price: 160,
        address: "Romi, Italy",
        vendor: "Leva",
        vendordProfession: " -Teacher",
        vendorProfile: "https://images.pexels.com/photos/2340978/pexels-photo-2340978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        review: 292,
        bedAndBathroom: "I double bed, dedicated bathroom",
        yearOfHostin: 10,
        latitude: 41.8967,
        longitude: 12.4822,
        imageUrls: [
               "https://akm-img-a-in.tosshub.com/indiatoday/images/bodyeditor/202109/PG-24-25-Spice-September-2021--x675.jpg?d22CSc6dMdHA6.Ag_NByjUQe5zOPr63Z?size=750:*",
               "https://images.pexels.com/photos/2340978/pexels-photo-2340978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
               "https://akm-img-a-in.tosshub.com/indiatoday/images/bodyeditor/202109/PG-24-25-Spice-September-2021--x675.jpg?d22CSc6dMdHA6.Ag_NByjUQe5zOPr63Z?size=750:*",
               "https://images.pexels.com/photos/2340978/pexels-photo-2340978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        ])
  ];