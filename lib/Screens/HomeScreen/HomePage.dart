import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medimitra/pages/OrderDetails.dart';
import 'package:medimitra/widgets.dart/app_Widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool medicine = false, chat = false, device = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 50, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello Subin", style: AppWidget.boldTextStyle()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular((10))),
                  child: const Icon(Icons.shopping_cart, color: Colors.white),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            //top text
            Text("Medicine", style: AppWidget.HeadlineTextStyle()),
            Text("Discover and get great food.",
                style: AppWidget.LightTextStyle()),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.only(right: 20), child: showItem()),
            const SizedBox(height: 20),

            // main body
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderDetails()));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/chat doctor.png',
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Text("Medicine name",
                                  style: AppWidget.semiTextStyle()),
                              const SizedBox(height: 5),
                              Text("Medicine description",
                                  style: AppWidget.LightTextStyle()),
                              const SizedBox(height: 5),
                              Text(
                                "NRP 500",
                                style: AppWidget.semiTextStyle(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/chat doctor.png',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Text("Medicine name",
                                style: AppWidget.semiTextStyle()),
                            const SizedBox(height: 5),
                            Text("Medicine description",
                                style: AppWidget.LightTextStyle()),
                            const SizedBox(height: 5),
                            Text(
                              "NRP 500",
                              style: AppWidget.semiTextStyle(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/chat doctor.png',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Text("Medicine name",
                                style: AppWidget.semiTextStyle()),
                            const SizedBox(height: 5),
                            Text("Medicine description",
                                style: AppWidget.LightTextStyle()),
                            const SizedBox(height: 5),
                            Text(
                              "NRP 500",
                              style: AppWidget.semiTextStyle(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/medicine.png',
                          height: 120, width: 120, fit: BoxFit.cover),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text("Second product",
                                  style: AppWidget.semiTextStyle())),
                          const SizedBox(height: 5),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text("Second product description",
                                  style: AppWidget.LightTextStyle())),
                          const SizedBox(height: 5),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text("NPR 1200",
                                  style: AppWidget.semiTextStyle())),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//showitem TOP
  Widget showItem() {
//selection
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //medicine
        GestureDetector(
          onTap: () {
            medicine = true;
            chat = false;
            device = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: medicine ? const Color(0Xff6FC8B8) : Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/medicine.png',
                  height: 80, width: 80, fit: BoxFit.cover),
            ),
          ),
        ),
        //AI CHAT
        GestureDetector(
          onTap: () {
            medicine = false;
            chat = true;
            device = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: chat ? const Color(0Xff6FC8B8) : Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/chat doctor.png',
                  height: 80, width: 80, fit: BoxFit.cover),
            ),
          ),
        ),
        //device
        GestureDetector(
          onTap: () {
            medicine = false;
            chat = false;
            device = true;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: device ? const Color(0Xff6FC8B8) : Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/ddd.png',
                  height: 80, width: 80, fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}
