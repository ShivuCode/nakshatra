import 'package:flutter/material.dart';
import 'package:nakshatra/Constants/constants.dart';
import 'package:nakshatra/Screens/Large_Screen/navbar.dart';

class SportTab extends StatefulWidget {
  const SportTab({super.key});

  @override
  State<SportTab> createState() => _SportTabState();
}

class _SportTabState extends State<SportTab> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.colorBurn),
                      onError: (exception, stackTrace) {},
                      image: const NetworkImage("assets/sport.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Navbar(selected: selected),
                ],
              ),
            ),
            colorLine(),
            height(8),
            const Text(
              "\tTOP RESULTS.....",
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  children: List.generate(
                    covers.length,
                    (index) => Container(
                        width: size * 0.10,
                        height: size * 0.14,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          onError: (exception, stackTrace) {},
                          image: NetworkImage(covers[index]["imageCover"]),
                          fit: BoxFit.fill,
                        ))),
                  )),
            ),
            height(10),
            const Text(
              "\tLIVE",
              style: TextStyle(fontSize: 18),
            ),
            height(5),
            colorLine(),
            Container(
              padding: const EdgeInsets.all(10),
              height: size * 0.14,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => Stack(
                        children: [
                          Container(
                              width: size * 0.20,
                              height: size * 0.14,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    onError: (exception, stackTrace) {},
                                    image:
                                        NetworkImage(covers[i]["imageCover"]),
                                    fit: BoxFit.fitWidth,
                                  ))),
                          Container(
                            height: 20,
                            margin: const EdgeInsets.all(2),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.white)),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                    backgroundColor: Colors.red, minRadius: 4),
                                width(5),
                                const Text(
                                  "LIVE",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                  separatorBuilder: (_, i) => width(10),
                  itemCount: 5),
            ),
            height(10),
            const Text(
              "\tMEMORIES.....",
              style: TextStyle(fontSize: 18),
            ),
            height(9),
            colorLine(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  children: List.generate(
                    covers.length,
                    (index) => Container(
                        width: size * 0.10,
                        height: size * 0.14,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          onError: (exception, stackTrace) {},
                          image: NetworkImage(covers[index]["imageCover"]),
                          fit: BoxFit.cover,
                        ))),
                  )),
            ),
            height(14),
            const Text(
              "\tALL MATCHES.....",
              style: TextStyle(fontSize: 18),
            ),
            height(9),
            colorLine(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  children: List.generate(
                    covers.length,
                    (index) => Container(
                        width: size * 0.10,
                        height: size * 0.14,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          onError: (exception, stackTrace) {},
                          image: const NetworkImage(
                              "https://www.cricket.com.au/~/media/News/2020/04/23DravidPullShot.ashx?la=en&hash=B7C1D58D73ECFE688C25D13E3B8F3556C873116A"),
                          fit: BoxFit.cover,
                        ))),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
