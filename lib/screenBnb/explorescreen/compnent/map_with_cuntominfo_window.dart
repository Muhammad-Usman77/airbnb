import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reci/screenBnb/explorescreen/compnent/my_icon_button.dart';

class MapWithCuntominfoWindow extends StatefulWidget {
  const MapWithCuntominfoWindow({super.key});

  @override
  State<MapWithCuntominfoWindow> createState() =>
      _MapWithCuntominfoWindowState();
}

class _MapWithCuntominfoWindowState extends State<MapWithCuntominfoWindow> {
  LatLng myCurrentLocation = const LatLng(27.7172, 85.3240);
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  late GoogleMapController googleMapController;
  List<Marker> markers = [];
  // for cumtom info window we use a packege

  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  // get latlong by firebase first we get refrence
  final CollectionReference placeCollection =
      FirebaseFirestore.instance.collection("myAppCollection");
  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  //for cumtom marker
  Future<void> _loadMarkers() async {
    customIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(), "assets/images/marker.png",
        height: 40, width: 30);
    Size size = MediaQuery.of(context).size;
    placeCollection.snapshots().listen((QuerySnapshot streamSnapshot) {
      if (streamSnapshot.docs.isNotEmpty) {
        final List allMarker = streamSnapshot.docs;
        List<Marker> myMarker = [];
        for (final marker in allMarker) {
          final dat = marker.data();
          final data = (dat) as Map;
          myMarker.add(Marker(
              markerId: MarkerId(data['address']),
              position: LatLng(data['latitude'], data['longitude']),
              onTap: () {
                _customInfoWindowController.addInfoWindow!(
                  Container(
                    height: size.height * 0.38,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: size.height * 0.155,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                                child: AnotherCarousel(
                                  images: data['imageUrls']
                                      .map((url) => NetworkImage(url))
                                      .toList(),
                                  dotSize: 5,
                                  indicatorBgPadding: 5,
                                  dotBgColor: Colors.transparent,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 14,
                              right: 14,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Text(
                                        "Gesture Favorite",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  MyIconButton(
                                    icon: Icons.favorite_outline,
                                    radius: 15,
                                  ),
                                   SizedBox(width:10),
                                    InkWell(
                                      onTap: () {
                                        _customInfoWindowController
                                            .hideInfoWindow!();
                                      },
                                      child: MyIconButton(icon: Icons.close,radius: 15,),
                                    )
                                ],
                              ),
                            ), //end
                            // for end small photo
                             Positioned(
                                    left: 10,
                                       bottom: 11,
                                    child: Stack(
                                    children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            bottomRight:Radius.circular(15) ,
                                          ),
                                          child: Image.asset("assets/images/coverImage.jpg",
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.cover,
                                          ),
                                          
                                        ),
                                        Positioned(
                                          top: 5,
                                          left: 5,
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              
                                              data['image']),
                                          ))
                                    ],
                                  ),
                                  ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    data["address"],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.star),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(data["review"].toString()),
                                ],
                              ),
                              const Text(
                                "360 m elevation",
                              ),
                              Text(
                                data["date"],
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "\$${data["price"]}",
                                    children: const [
                                      TextSpan(
                                          text: "night",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ))
                                    ]),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ), //end
                      ],
                    ),
                  ),
                  LatLng(data['latitude'], data['longitude']),
                );
              },
              icon: customIcon));
        }
        setState(() {
          markers = myMarker;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FloatingActionButton.extended(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          showModalBottomSheet(
              clipBehavior: Clip.none,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  height: size.height * 0.77,
                  width: size.width,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: size.height * 0.77,
                        child: GoogleMap(
                          initialCameraPosition:
                              CameraPosition(target: myCurrentLocation),
                          onMapCreated: (GoogleMapController controller) {
                            googleMapController = controller;
                            _customInfoWindowController.googleMapController =
                                controller;
                          },
                          onTap: (argument) {
                            _customInfoWindowController.hideInfoWindow!();
                          },
                          onCameraMove: (position) {
                            _customInfoWindowController.onCameraMove!();
                          },
                          markers: markers.toSet(),
                        ),
                      ),
                      CustomInfoWindow(
                        controller: _customInfoWindowController,
                        height: size.height * 0.3,
                        width: size.width * 0.8,
                        offset: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 170, vertical: 10),
                          child: Container(
                            height: 5,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        label: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Map",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.map_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ));
  }
}
