import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reci/screenBnb/explorescreen/compnent/display_places.dart';
import 'package:reci/screenBnb/explorescreen/compnent/display_total_price.dart';
import 'package:reci/screenBnb/explorescreen/compnent/map_with_cuntominfo_window.dart';
import 'package:reci/screenBnb/explorescreen/compnent/search_container.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
// diplay appCategory
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection("appCategory");

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // for search bar and filter button
                SearchContainer(),
                //  listOfCategoryItems(size),
                //display total price
                SizedBox(
                  height: 15,
                ),
                DisplayTotalPrice(),
                SizedBox(
                  height: 10,
                ),
                DisplayPlaces(),
              ],
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const MapWithCuntominfoWindow(),
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> listOfCategoryItems(Size size) {
    return StreamBuilder(
        stream: categoryCollection.snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.hasData) {
            return Stack(
              children: [
                const Positioned(
                  left: 0,
                  right: 0,
                  top: 80,
                  child: Divider(
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.12,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 20, right: 20, left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 32,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(streamSnapshot
                                      .data!.docs[index]['image']),
                                ),
                                Text(streamSnapshot.data!.docs[index]['title']),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 3,
                                  width: 50,
                                  color: selectedIndex == index
                                      ? Colors.black
                                      : Colors.transparent,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
