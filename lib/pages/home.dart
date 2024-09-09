import 'package:flutter/material.dart';
import 'package:marketplace_kelompok4/widget/support_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories = [
    "images/headphone_icon.png",
    "images/laptop.png",
    "images/watch.png",
    "images/TV.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(241, 255, 255, 255),
      body: SingleChildScrollView(
        // Added to enable scrolling
        child: Container(
          margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey, Jovandi",
                        style: AppWidget.boldTextFeildStyle(),
                      ),
                      Text(
                        "Good Morning",
                        style: AppWidget.LighttextFeildStyle(),
                      ),
                    ],
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "images/boy.png",
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      )),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Products",
                        hintStyle: AppWidget.LighttextFeildStyle(),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories", style: AppWidget.semiboldTextFeildStyle()),
                  Text("See all",
                      style: TextStyle(
                          color: Color(0xFFfd6f3e),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Container(
                      height: 130,
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsets.only(right: 20.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFFD6F3E),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text("All",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)))),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0),
                      height: 130,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(image: categories[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Products",
                      style: AppWidget.semiboldTextFeildStyle()),
                  Text("See all",
                      style: TextStyle(
                          color: Color(0xFFfd6f3e),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 200.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProductCard(
                      image: "images/headphone2.png",
                      name: "Headphone",
                      price: "\$100",
                    ),
                    ProductCard(
                      image: "images/watch2.png",
                      name: "Apple Watch",
                      price: "\$300",
                    ),
                    ProductCard(
                      image: "images/laptop2.png",
                      name: "Laptop",
                      price: "\$1000",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String image;
  const CategoryTile({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        height: 90,
        width: 90,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              Icon(Icons.arrow_forward)
            ]));
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const ProductCard(
      {super.key,
      required this.image,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          Text(
            name,
            style: AppWidget.semiboldTextFeildStyle(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Text(
                price,
                style: TextStyle(
                    color: Color(0xFFfd6f3e),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 40.0,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color(0xFFfd6f3e),
                    borderRadius: BorderRadius.circular(7)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//Menit : 1.33.30