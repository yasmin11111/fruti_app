import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_appp/model.dart';

class cardwid extends StatelessWidget {
  String name;
  String image;
  String rate;
  String rateCount;
  String price;
  Widget icon;
  cardwid(
      {required this.price,
      required this.name,
      required this.image,
      required this.rate,
      required this.rateCount,
      required this.onTap,
      required this.icon});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 235, 229, 229),
                ),
                height: 130,
                child: Image.asset(
                  image,
                ),
              ),
              Positioned(
                bottom: 6,
                right: 3,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: GestureDetector(onTap: onTap, child: icon),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/logo/Vector.png",
                      height: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(rate),
                    SizedBox(
                      width: 5,
                    ),
                    Text("($rateCount )"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(price),
              ],
            ),
          )
        ],
      ),
    );
  }
}
