import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class products extends StatelessWidget {
  const products(
      {Key? key,
      required this.hei,
      required this.wid,
      required this.offer,
      this.image,
      required this.product_name,
      required this.sellingamount,
      required this.Netamount})
      : super(key: key);

  final double hei;
  final double wid;
  final offer, image, product_name, sellingamount, Netamount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Row(children: [
              Container(
                // ignore: sort_child_properties_last
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                height: hei * 0.18,
                width: wid * 0.37,
                decoration: const BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 207, 207, 207),
                        blurRadius: 3)
                  ],
                  color: Colors.white,
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Stack(children: [
                Container(
                  height: hei * 0.024,
                  width: wid * 0.095,
                  decoration: const BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.black, Colors.grey]),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    offer,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: wid * 0.025,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                )
              ]),
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top: 18, right: 40),
                child: Container(
                  height: hei * 0.18,
                  width: wid * 0.37,
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 203, 203, 203),
                          blurRadius: 3)
                    ], borderRadius: BorderRadius.circular(20)),
                    child: const CircleAvatar(
                      // ignore: sort_child_properties_last
                      child: ImageIcon(
                        AssetImage(
                          'assets/heart.png',
                        ),
                        color: Color.fromARGB(255, 91, 91, 91),
                        size: 16,
                      ),
                      radius: 18,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: wid * 0.3,
                  child: Text(
                    product_name,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      "₹ " + sellingamount,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 255, 0, 0),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(width: 6),
                  Container(
                    child: Text(
                      "₹ " + Netamount,
                      style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 147, 147, 147),
                          fontSize: wid * 0.025,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
