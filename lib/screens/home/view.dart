import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_transition/page_transition.dart';

import '../all_products/view.dart';
import '../nav_bar/view.dart';

List categorynum = [
  '4208',
  '4209',
  '4210',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int index=0;
  List Category_imgs = [
    'assets/images/jeans.jpg',
    'assets/images/shoes.jpg',
    'assets/images/accessories.jpg',
  ];

  List Offer_imgs = [
    'assets/images/of.jpg',
    'assets/images/off.jpg',
    'assets/images/off1.jpg',
  ];

  List names = [
    'Jeans',
    'Shoes & Boots',
    'Accessories',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.grey[50],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text('Find Your ',
                    style: TextStyle(
                        fontFamily: 'MainFont',
                        color: Colors.greenAccent,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],),
              Row(
                children: const [
                  Text('Desire Product',
                    style: TextStyle(
                        fontFamily: 'MainFont',
                        color: Colors.greenAccent,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                    ),),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 25,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: const Icon(Icons.dark_mode, color: Colors.black,),
            ),
          )
        ],
      ),
      body:
      Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Material(
                        elevation: 5.0,
                        shadowColor: Colors.blue,
                        child: TextField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18
                              ),
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(15),
                                width: 18,
                                child: const Icon(Icons.search),
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15,),
          CarouselSlider(
            items: Offer_imgs.map((image) {
              return SizedBox(
                width: double.infinity,
                child: Image.asset(image, fit: BoxFit.fill,),
              );
            }).toList(),
            options: CarouselOptions(
              enlargeCenterPage: true,
              height: 180,
              initialPage: 0,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                      'Categories:',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 30 ,
                          color: Colors.blueGrey ),
                    ),
              ],),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categorynum.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(type: PageTransitionType.fade, child: ProductsScreen(c_id: categorynum[index],)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 130,
                          width: 150,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image(
                                image: AssetImage(
                                  Category_imgs[index].toString(),
                                ),
                              ),),
                        ),
                        Text(
                          names[index],
                          maxLines: 1,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              fontSize: 24),
                        ),
                      ],),
                  ),
                );
              },
            ),
          ),
        ],),
    );
  }
}