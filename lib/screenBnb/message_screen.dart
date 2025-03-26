import 'package:flutter/material.dart';
import 'package:reci/model/message.dart';
import 'package:reci/model/message_model.dart';
import 'package:reci/model/place_model.dart';
import 'package:reci/screenBnb/explorescreen/compnent/my_icon_button.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<String> messageType = ["All", "Traveling", "Support"];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsetsDirectional.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(),
                const Spacer(),
                InkWell(
                  onTap: () {
                    savePlacesToFirebase();
                  },
                  child: MyIconButton(
                    icon: Icons.search,
                    iconColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MyIconButton(
                  icon: Icons.tune,
                  iconColor: Colors.black,
                ),
              ],
            ),

            const Text(
              "MessageScreen",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    messageType.length,
                    (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 12),
                              decoration: BoxDecoration(
                                color: currentIndex == index
                                    ? Colors.black
                                    : Colors.black.withOpacity(0.04),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                messageType[index],
                                style: TextStyle(
                                    color: currentIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ...messages.map(
              (message) => _buildMessageItems(message),
            ),
            //  ...messages.map((message)=> _buildMessageItem(message)),
          ],
        ),
      )),
    );
  }

  Widget _buildMessageItems(message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 75,
                width: 65,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(message.image))),
              ),
              Positioned(
                bottom: -10,
                right: -18,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(message.vendorImage),
                  backgroundColor: Colors.white,
                  radius: 25,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 25,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    message.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    message.date,
                    style: const TextStyle(fontSize: 17, color: Colors.black54),
                  )
                ],
              ),
              Text(
                message.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    height: 1.1, fontSize: 17, color: Colors.black54),
              ),
              Text(
                message.duration,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    height: 1.4, fontSize: 17, color: Colors.black54),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

// Widget _buildMessageItem(Message  message){
//   return 
// }