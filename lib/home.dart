// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruit_appp/model.dart';
import 'package:fruit_appp/models/colrs.dart';
import 'package:fruit_appp/widgets/cardwid.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _bottomNavIndex = 0;
  List<IconData> iconList = [
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.person,
    Icons.menu
  ];

  List<String> items = [
    'assets/banners/Slider 1.png',
    'assets/banners/Slider 2.png',
    'assets/banners/Slider 3.png',
  ];

  List<CategoryModel> categoryes = [
    CategoryModel(image: "assets/category/image 38.png", name: "Fruits"),
    CategoryModel(image: "assets/category/image 36.png", name: "Vegetables"),
    CategoryModel(image: "assets/category/image 37.png", name: "Beverages"),
    CategoryModel(
        image: "assets/category/image 39 (1).png", name: "Milk & egg"),
    CategoryModel(image: "assets/category/image 41.png", name: "Laundry"),
  ];

  List<produtsModel> produts = [
    produtsModel(
      image: "assets/fruits/image 43.png",
      name: "Apple",
      rate: "4.8",
      rateCount: "20",
      price: " \$ 56 ",
    ),
    produtsModel(
      image: "assets/fruits/image 44 (1).png",
      name: "Lemon",
      rate: "4.2",
      rateCount: "20",
      price: " \$ 44 ",
    ),
    produtsModel(
      image: "assets/fruits/image 44 (2).png",
      name: "Orange",
      rate: "3",
      rateCount: "20",
      price: " \$ 23 ",
    ),
    produtsModel(
      image: "assets/fruits/image 44 (4).png",
      name: "Banana",
      rate: "2",
      rateCount: "133",
      price: " \$ 10 ",
    ),
  ];
  List BasketList = [];
  void toggleSelection(produtsModel pro) {
    if (BasketList.contains(pro)) {
      setState(() {
        BasketList.remove(pro);
      });
    } else {
      setState(() {
        BasketList.add(pro);
      });
    }
  }

  bool isSelected(produtsModel pro) => BasketList.contains(pro);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Image.asset(
            "assets/logo/Vector (2).png",
            height: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "61 Hopper Sreet..",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.keyboard_arrow_down_rounded, size: 30),
          Spacer(),
          Image.asset(
            "assets/logo/Vector (3).png",
            height: 20,
          ),
        ],
      )),
      body: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
                height: 180,
                autoPlay: true,
                viewportFraction: .8,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 2),
                enlargeCenterPage: true),
            itemCount: items.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              child: Image.asset(items[itemIndex]),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ...List.generate(categoryes.length, (generator) {
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(500),
                          ),
                          child: Center(
                            child: Image.asset(
                              categoryes[generator].image,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      ),
                      Text(categoryes[generator].name)
                    ]);
                  })
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Fruits", style: TextStyle(fontSize: 20)),
                Spacer(),
                Text(
                  "See all",
                  style: TextStyle(color: colo.primary, fontSize: 15),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(produts.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: cardwid(
                      image: produts[index].image,
                      name: produts[index].name,
                      rate: produts[index].rate,
                      rateCount: produts[index].rateCount,
                      price: produts[index].price,
                      icon: isSelected(produts[index])
                          ? Icon(Icons.check)
                          : Icon(Icons.add),
                      onTap: () {
                        toggleSelection(produts[index]);
                      },
                    ),
                  );
                })
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: colo.primary,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 230,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          itemCount: BasketList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                  child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage(BasketList[index].image),
                              )),
                            );
                          }),
                    ),
                    Container(
                      height: 40,
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                    Text(
                      'View Basket',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Badge(
                      label: Text(BasketList.length.toString()),
                      child: Image.asset(
                        color: Colors.white,
                        "assets/logo/Vector (3).png",
                        height: 25,
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
