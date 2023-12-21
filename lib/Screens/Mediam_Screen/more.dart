
import 'package:flutter/material.dart';
import 'package:nakshatra/Constants/constants.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "My\n\t\tProfile",
              style: TextStyle(fontSize: 26),
            ),
            height(20),
            Center(
                child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 4),
                      borderRadius: BorderRadius.circular(60)),
                  child: const CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage(
                        "https://cdn1.iconfinder.com/data/icons/avatars-1-5/136/83-512.png"),
                  ),
                ),
                height(6),
                const Text(
                  "Shivani Bind",
                  style: TextStyle(fontSize: 20),
                ),
                height(20),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      width(10),
                      const Icon(Icons.person, color: Colors.teal),
                      width(10),
                      const Text("My Account")
                    ],
                  ),
                ),
                height(5),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      width(10),
                      const Icon(Icons.notifications, color: Colors.teal),
                      width(10),
                      const Text("Notifications")
                    ],
                  ),
                ),
                height(5),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      width(10),
                      const Icon(Icons.logout, color: Colors.teal),
                      width(10),
                      const Text("LogOut")
                    ],
                  ),
                )
              ],
            )),
          ]),
        ),
      ),
    );
  }
}
