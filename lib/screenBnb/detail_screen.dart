import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reci/screenBnb/explorescreen/compnent/location_in_map.dart';
import 'package:reci/screenBnb/explorescreen/compnent/my_icon_button.dart';
import 'package:reci/screenBnb/explorescreen/compnent/star_rating.dart';
import 'package:reci/screenBnb/providerforbnb/favorite_provider.dart';

class DetailScreen extends StatefulWidget {
  final DocumentSnapshot<Object?> place;
  const DetailScreen({super.key, required this.place});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final pro = FavoritePro.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //this is for detail image and icons
            detailImageandIcon(size, context, pro),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    widget.place["title"],
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    "Room in ${widget.place["address"]}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: size.height * 0.001,
                  ),
                  Text(
                    widget.place["bedAndBathroom"],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            widget.place["isActive"] == true
                ? ratingAndStarTrue()
                : ratingAndStarFalse(),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  placePropertyList(size, widget.place['image'],
                      widget.place['title'], widget.place['vendor']),
                  const Divider(),
                  placePropertyList(size, widget.place['image'],
                      widget.place['title'], widget.place['vendor']),
                  const Divider(),
                  placePropertyList(size, widget.place['image'],
                      widget.place['title'], widget.place['vendor']),
                  placePropertyList(size, widget.place['image'],
                      widget.place['title'], widget.place['vendor']),
                  placePropertyList(size, widget.place['image'],
                      widget.place['title'], widget.place['vendor']),
                  const Divider(),
                  const Text(
                    "About this place",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                  const Divider(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    "Where you 'll be",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.place["address"]),
                  SizedBox(
                    height: size.height * 0.4,
                    child: LocationInMap(place: widget.place),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: priceAndReserver(size),
    );
  }

  Container priceAndReserver(Size size) {
    return Container(
      height: size.height * 0.1,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: "\$${widget.place["price"]}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                  children: const [
                    TextSpan(
                      text: "night",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.place["date"],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          SizedBox(
            width: size.width * 0.3,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              "Reserve",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Padding placePropertyList(Size size, image, title, subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          const Divider(),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              Text(
                subtitle,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.0346,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Padding ratingAndStarFalse() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.star),
            const SizedBox(
              width: 5,
            ),
            Text(
              "${widget.place["rating"].toString()}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text(
              "${widget.place["review"].toString()}reviews",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  decoration: TextDecoration.underline),
            )
          ],
        ),
      );

  Container ratingAndStarTrue() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                widget.place['rating'].toString(),
                style: const TextStyle(
                    height: 1, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              StarRating(rating: widget.place["rating"])
            ],
          ),
          //this is for golderimage
          Stack(
            children: [
              Image.asset(
                "assets/images/golden.png",
                height: 80,
                width: 130,
                color: Colors.amber,
              ),
              const Positioned(
                top: 20,
                left: 47,
                child: Text(
                  "Guest\nFavorite",
                  style: TextStyle(
                      height: 1.1,
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                widget.place["review"].toString(),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Reviews",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 0.7,
                    decoration: TextDecoration.underline),
              )
            ],
          )
        ],
      ),
    );
  }

  Stack detailImageandIcon(Size size,  context,  pro) {
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.35,
          child: AnotherCarousel(
            images: widget.place['imageUrls']
                .map((url) => NetworkImage(url))
                .toList(),
            showIndicator: false,
            dotBgColor: Colors.transparent,
            onImageChange: (p0, p1) {
              setState(() {
                currentIndex = p1;
              });
            },
            autoplay: true,
            boxFit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.black54,
              ),
              child: Text(
                "${currentIndex + 1} / ${widget.place["imageUrls"].length}",
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Positioned(
          top: 25,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: MyIconButton(
                    icon: Icons.arrow_back_ios_new,
                  ),
                ),
                SizedBox(width: size.width * 0.47),
                MyIconButton(
                  icon: Icons.share_outlined,
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    pro.toggleFavorite(widget.place);
                  },
                  child: MyIconButton(
                      icon: pro.isExist(widget.place)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      iconColor: pro.isExist(widget.place)
                          ? Colors.red
                          : Colors.black),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
