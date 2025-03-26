import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reci/Provider/favorite_provider.dart';
import 'package:reci/screenBnb/detail_screen.dart';
import 'package:reci/screenBnb/providerforbnb/favorite_provider.dart';

class DisplayPlaces extends StatefulWidget {
  const DisplayPlaces({super.key});

  @override
  State<DisplayPlaces> createState() => _DisplayPlacesState();
}

class _DisplayPlacesState extends State<DisplayPlaces> {
  //diplay places
  final CollectionReference placeCollection =
      FirebaseFirestore.instance.collection("myAppCollection");
  @override
  Widget build(BuildContext context) {
    final pro = FavoritePro.of(context);
    return StreamBuilder(
        stream: placeCollection.snapshots(),
        builder: (context, stSnapshot) {
          if (stSnapshot.hasData) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: stSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final place = stSnapshot.data!.docs[index];
                  //  return Image.network(stSnapshot.data!.docs[index]['imageUrls'].toString());
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(place: place)));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SizedBox(
                                  height: 360,
                                  width: double.infinity,
                                  child: AnotherCarousel(
                                    images: place["imageUrls"]
                                        .map((url) =>
                                            NetworkImage(url.toString()))
                                        .toList(),
                                    dotSize: 6,
                                    indicatorBgPadding: 5,
                                    dotBgColor: Colors.transparent,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                left: 15,
                                right: 15,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    place["isActive"] == true
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 15,
                                              ),
                                              child: Text(
                                                "GuestFavorite",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),

                                    //for favorite button
                                    const Spacer(),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        const Icon(
                                          Icons.favorite_outline_rounded,
                                          size: 34,
                                          color: Colors.white,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            pro.toggleFavorite(place);
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            size: 30,
                                            color: pro.isExist(place)
                                                ? Colors.red
                                                : Colors.black54,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 11,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                      child: Image.asset(
                                        "assets/images/coverImage.jpg",
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        left: 10,
                                        child: CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(place['image']),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            stSnapshot.data!.docs[index]['address'],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Row(children: [
                            Text(
                              stSnapshot.data!.docs[index]['vendor'],
                            ),
                            Text(
                              stSnapshot.data!.docs[index]['vendorProfession'],
                            ),
                          ]),
                          Text(
                            stSnapshot.data!.docs[index]['date'],
                          ),
                          Text(
                            "\$${place['price']}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ); //end
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
