import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  logOutFun() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(Icons.notifications),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 25,
                        backgroundImage: NetworkImage(
                          '',
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text.rich(
                        TextSpan(
                            text: "usman\n",
                            children: [TextSpan(text: "View Profile")]),
                      ),
                      Spacer(),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ), //second row
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: Row(
                        children: [
                          const Text.rich(
                            TextSpan(
                              text: "Airbnb your place\n",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                //  height: 2.5,
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        "its simple to get set up and \n start earning",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14))
                              ],
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                              height: 100,
                              width: 80,
                              "assets/images/airbnb.jpeg"),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  const Text(
                    "Setting",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  profileInfo(Icons.person_2_outlined, "profile Information"),
                  profileInfo(Icons.security, "Login & Security"),
                  profileInfo(Icons.payment, "Outlined, Payments & Payouts"),
                  profileInfo(Icons.settings_outlined, "AccessAbility"),
                  profileInfo(Icons.note_outlined, "Taxes"),
                  profileInfo(Icons.person_2_outlined, "Personal Information"),
                  profileInfo(Icons.translate, "Translation"),
                  profileInfo(Icons.notifications_outlined, "Notifications"),
                  profileInfo(Icons.lock_outline, "Privacy & Sharing"),
                  profileInfo(Icons.card_travel, "Travel For Work"),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Hosting",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  profileInfo(Icons.add_home_outlined, "List your space"),
                  profileInfo(Icons.home_outlined, "Learn about hosting"),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Support",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  profileInfo(Icons.help_outline, "Visit the help center"),
                  profileInfo(Icons.health_and_safety_outlined,
                      "Get help with a safety issue"),
                  profileInfo(Icons.ac_unit, "How airbnb works"),
                  profileInfo(Icons.edit_outlined, "Give us feed back"),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Legal",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  profileInfo(Icons.menu_book_outlined, "Terms of service"),
                  profileInfo(Icons.menu_book_outlined, "Privacy policy"),
                  profileInfo(Icons.menu_book_outlined, "Open source licenses"),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      // //for logout
                      logOutFun();
                      setState(() {});
                    },
                    child: const Text(
                      "LogOut",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Version 24.34(28004615)",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Padding profileInfo(icon, name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 35,
                color: Colors.black.withOpacity(0.7),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 17),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            color: Colors.black12,
          ),
        ],
      ),
    );
  }
}
