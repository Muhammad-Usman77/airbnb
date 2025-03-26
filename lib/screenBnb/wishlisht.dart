import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reci/screenBnb/providerforbnb/favorite_provider.dart';

class Wishlisht extends StatelessWidget {
  const Wishlisht({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = FavoritePro.of(context);
    final favoriteItems = pro.favorite;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "WishList",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  favoriteItems.isEmpty
                      ? Center(child: const Text("Not Yet Favorite"))
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.68,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                              ),
                              itemCount: favoriteItems.length,
                              itemBuilder: (context, index) {
                                String favorite = favoriteItems[index];
                                return FutureBuilder<DocumentSnapshot>(
                                    future: FirebaseFirestore.instance
                                        .collection("myAppCollection")
                                        .doc(favorite)
                                        .get(),
                                    builder: (context, snapShot) {
                                      if (snapShot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      if (!snapShot.hasData ||
                                          snapShot.data == null) {
                                        return const Center(
                                          child:
                                              Text("Error loading favorites"),
                                        );
                                      }
                                      final favoriteItems = snapShot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  favoriteItems["image"],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Positioned(
                                            top: 8,
                                            right: 8,
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                          ),
                                          Positioned(
                                              bottom: 8,
                                              left: 8,
                                              right: 8,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  favoriteItems['title'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ))
                                        ],
                                      );
                                    });
                              }),
                        )
                ],
              ),
            ),
          )),
    );
  }
}
