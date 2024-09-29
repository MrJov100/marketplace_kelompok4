import 'package:flutter/material.dart';
import 'package:marketplace_kelompok4/pages/CategoryProductPage.dart';
import 'package:marketplace_kelompok4/pages/product_detail.dart';
import 'package:marketplace_kelompok4/widget/support_widget.dart';
import 'package:marketplace_kelompok4/pages/drawer_menu.dart';
import 'package:marketplace_kelompok4/pages/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  String? userName;

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  void _getUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      userName = user?.email?.split('@')[0] ?? "User";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 163, 185, 215),
      appBar: AppBar(
        backgroundColor: Color(0xFFfd6f3e),
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu,
                  color: const Color.fromARGB(255, 255, 255, 255)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
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
                        "Hey, $userName",
                        style: AppWidget.boldTextFeildStyle(),
                      ),
                      Text(
                        "Have a Good Day",
                        style: AppWidget.LighttextFeildStyle(),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Profile(),
                          ),
                        );
                      },
                      child: Image.asset(
                        "images/boy.png",
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
                  Text("Flash Sale", style: AppWidget.semiboldTextFeildStyle()),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductDetail(
                                    productName: 'Headphone',
                                    productPrice: '\$100',
                                    productImage: 'images/headphone2.png',
                                  )),
                        );
                      },
                      child: ProductCard(
                        image: "images/headphone2.png",
                        name: "Headphone",
                        price: "\$100",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductDetail(
                                    productName: 'Apple Watch',
                                    productPrice: '\$300',
                                    productImage: 'images/watch2.png',
                                  )),
                        );
                      },
                      child: ProductCard(
                        image: "images/watch2.png",
                        name: "Apple Watch",
                        price: "\$300",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductDetail(
                                    productName: 'Laptop',
                                    productPrice: '\$1000',
                                    productImage: 'images/laptop2.png',
                                  )),
                        );
                      },
                      child: ProductCard(
                        image: "images/laptop2.png",
                        name: "Laptop",
                        price: "\$1000",
                      ),
                    ),
                    // Produk baru: Tablet dengan ukuran gambar lebih kecil
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductDetail(
                                    productName: 'Tablet',
                                    productPrice: '\$500',
                                    productImage: 'images/tablet.png',
                                  )),
                        );
                      },
                      child: ProductCard(
                        image: "images/tablet.png",
                        name: "Tablet",
                        price: "\$500",
                        imageHeight: 120,
                        imageWidth: 150,
                      ),
                    ),
                  ],
                ),
              ),
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
    return GestureDetector(
      onTap: () {
        String category = getCategoryFromImage(image);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryProductPage(category: category),
          ),
        );
      },
      child: Container(
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
            ]),
      ),
    );
  }

  String getCategoryFromImage(String imagePath) {
    if (imagePath.contains("headphone")) return "Headphone";
    if (imagePath.contains("laptop")) return "Laptop";
    if (imagePath.contains("watch")) return "Watch";
    if (imagePath.contains("TV")) return "TV";
    return "Category";
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final double imageHeight;
  final double imageWidth;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    this.imageHeight = 120, // Default size
    this.imageWidth = 120, // Default size
  });

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
            height: imageHeight,
            width: imageWidth,
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
