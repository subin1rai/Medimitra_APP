import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medimitra/widgets.dart/app_Widgets.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                )),
            Image.asset(
              'assets/ddd.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1,
              fit: BoxFit.fill,
            ),
            // const SizedBox(height: 15),

            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Device",
                      style: AppWidget.semiTextStyle(),
                    ),
                    Text(
                      "Stethoscope",
                      style: AppWidget.HeadlineTextStyle(),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      --a;
                    }
                    setState(() {});
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  a.toString(),
                  style: AppWidget.semiTextStyle(),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    ++a;
                    setState(() {});
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Habitant morbi tristique senectus et netus et malesuada fames ac. Nunc congue nisi vitae suscipit tellus mauris a diam maecenas. Vitae congue mauris rhoncus aenean. Volutpat lacus laoreet non curabitur gravida arcu. Imperdiet proin fermentum leo vel orci porta. Sed viverra tellus in hac habitasse platea dictumst. In aliquam sem fringilla ut.',
              style: AppWidget.LightTextStyle(),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: AppWidget.semiTextStyle(),
                    ),
                     Text(
                      "NPR: 2400",
                      style: AppWidget.HeadlineTextStyle(),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40,15,40,15),
                  decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(26)),
                  child: Row(children: [
                    Text("Add to Cart", style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),),
                    Container( 
                      child: Icon(Icons.shopping_cart_outlined ,color: Colors.white),
                    )
                  ],),
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}
