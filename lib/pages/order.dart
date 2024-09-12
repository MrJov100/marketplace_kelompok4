import 'package:flutter/material.dart';
import 'package:marketplace_kelompok4/widget/support_widget.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 163, 185, 215),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(237, 163, 185, 215),
        title: Text(
          "Current Orders",
          style: AppWidget.boldTextFeildStyle(),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "images/watch2.png",
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Apple Watch",
                            style: AppWidget.semiboldTextFeildStyle(),
                          ),
                          Text("\$" "300",
                              style: TextStyle(
                                  color: Color(0xFFfd6f3e),
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.bold)),
                          Text("Status : " "Delivered",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 56, 188, 109),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Order for Headphone
            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "images/headphone2.png",
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Headphone",
                            style: AppWidget.semiboldTextFeildStyle(),
                          ),
                          Text("\$" "100",
                              style: TextStyle(
                                  color: Color(0xFFfd6f3e),
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.bold)),
                          Text("Status : " "On The Way",
                              style: TextStyle(
                                  color: Color(0xFFfd6f3e),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Order for Laptop
            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "images/laptop2.png",
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Laptop",
                            style: AppWidget.semiboldTextFeildStyle(),
                          ),
                          Text("\$" "1000",
                              style: TextStyle(
                                  color: Color(0xFFfd6f3e),
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.bold)),
                          Text("Status : " "On The Way",
                              style: TextStyle(
                                  color: Color(0xFFfd6f3e),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
