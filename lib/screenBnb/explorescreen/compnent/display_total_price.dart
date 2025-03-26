import 'package:flutter/material.dart';

class DisplayTotalPrice extends StatefulWidget {
  const DisplayTotalPrice({super.key});

  @override
  State<DisplayTotalPrice> createState() => _DisplayTotalPriceState();
}

class _DisplayTotalPriceState extends State<DisplayTotalPrice> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DisPlay Total Price",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text("Includes all fees, before taxes"),
                ],
              ),
              Switch(
                  value: isSwitch,
                  onChanged: (value) {
                    setState(() {
                      isSwitch = value;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
