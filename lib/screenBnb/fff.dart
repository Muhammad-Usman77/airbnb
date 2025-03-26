import 'package:flutter/material.dart';
import 'package:reci/model/place_model.dart';

class face extends StatelessWidget {
  const face({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  savePlacesToFirebase();
                },
                child: Text("saveData"))
          ],
        ),
      ),
    );
  }
}
