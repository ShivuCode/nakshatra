import 'package:flutter/material.dart';

import '../../Constants/constants.dart';

class Sports extends StatelessWidget {
  const Sports({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            height(30),
            Stack(
              children: [
                Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          onError: (exception, stackTrace) {},
                          image: const NetworkImage(
                              "https://th.bing.com/th/id/OIP.71eqHpipkRa-s2qaqHPn7wHaFj?w=235&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"),
                          fit: BoxFit.cover,
                        ))),
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: 35,
                  height: 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.lens, color: Colors.red, size: 6),
                        width(3),
                        const Text(
                          "Live",
                          style: TextStyle(fontSize: 8),
                        )
                      ]),
                )
              ],
            ),
            height(10),
            const Text("WI vs India- Iconic Moments"),
            height(6),
            SizedBox(
              height: 80,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => Container(
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            onError: (exception, stackTrace) {},
                            image: const NetworkImage(
                                "https://www.cricket.com.au/~/media/News/2020/04/23DravidPullShot.ashx?la=en&hash=B7C1D58D73ECFE688C25D13E3B8F3556C873116A"),
                            fit: BoxFit.cover,
                          ))),
                  separatorBuilder: (_, i) => width(10),
                  itemCount: covers.length),
            ),
            height(10),
            const Text("WI vs India- Top Performers"),
            height(6),
            SizedBox(
              height: 120,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => Container(
                        alignment: Alignment.bottomLeft,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              onError: (exception, stackTrace) {},
                              image: const NetworkImage(
                                  "https://th.bing.com/th/id/OIP.HtV8C3H5nUhBa5UVeGojWQHaEK?pid=ImgDet&rs=1"),
                              fit: BoxFit.cover,
                            )),
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            width: double.infinity,
                            color: Colors.blueGrey.shade900,
                            child: const Text("2022- Ganguly's 75")),
                      ),
                  separatorBuilder: (_, i) => width(10),
                  itemCount: 5),
            ),
            height(10),
            const Text("Wining Moments"),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    onError: (exception, stackTrace) {},
                    image: const NetworkImage(
                        "https://th.bing.com/th/id/OIP.HtV8C3H5nUhBa5UVeGojWQHaEK?pid=ImgDet&rs=1"),
                    fit: BoxFit.cover,
                  )),
            ),
            height(10),
            const Text("WI vs India- Top Performers"),
            height(6),
            SizedBox(
              height: 120,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => Container(
                        alignment: Alignment.bottomLeft,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              onError: (exception, stackTrace) {},
                              image: const NetworkImage(
                                  "https://th.bing.com/th/id/OIP.HtV8C3H5nUhBa5UVeGojWQHaEK?pid=ImgDet&rs=1"),
                              fit: BoxFit.cover,
                            )),
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            width: double.infinity,
                            color: Colors.blueGrey.shade900,
                            child: const Text("2022- Ganguly's 75")),
                      ),
                  separatorBuilder: (_, i) => width(10),
                  itemCount: 5),
            ),
            height(10),
          ]))
    ]));
  }
}
