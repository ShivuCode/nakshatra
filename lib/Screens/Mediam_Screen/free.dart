import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nakshatra/Constants/constants.dart';

class Free extends StatelessWidget {
  const Free({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              height: 40,
              child: TextField(
                  cursorColor: Colors.teal,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.5),
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8)))),
            ),
            height(10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(
                covers.length,
                (index) => SizedBox(
                  width: size * .29,
                  height: size * .38,
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image:
                                    NetworkImage(covers[index]["imageCover"]),
                                fit: BoxFit.cover,
                              ))),
                      index != 1 ? premium() : const Center()
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
