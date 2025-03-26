import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27,),
         child: Row(
          children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow:const  [
                  BoxShadow(
                    blurRadius: 7,
                    color: Colors.black26
                  )
                ]
              ),
            child:const Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Row(
              children: [
                Icon(Icons.search_outlined),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("  Where To?",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 20,
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            
                          ),
                          hintText:"Anywhere, Any Wek, Add guests",filled: true,fillColor: Colors.white
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            ),
            
            )),
            SizedBox(width: 8,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black54,
                ),shape: BoxShape.circle,
              ),
              child: Icon(Icons.tune,size: 40,color: Colors.black,),
            ),
          ],
         ) ,
    );
  }
}