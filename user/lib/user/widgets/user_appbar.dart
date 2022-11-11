import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user/user/screens/login.dart';
import 'package:user/user/screens/order_screen.dart';

class appbar_user extends StatelessWidget {
  const appbar_user({
    Key? key,
    required this.hei,
    required this.wid,
  }) : super(key: key);

  final double hei;
  final double wid;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        // ignore: sort_child_properties_last
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => order_details()));
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        height: hei * 0.16,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 125, 124, 124)),
      ),
      Padding(
        padding: EdgeInsets.only(top: hei * 0.13, left: 30, right: 30),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1,
                  offset: Offset(1, 3),
                  color: Color.fromARGB(255, 213, 213, 213),
                )
              ]),
          child: SizedBox(
            height: hei * 0.055,
            width: wid * 0.88,
            child: TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: "what are you looking for ?",
                contentPadding: EdgeInsets.only(top: 2),
                hintStyle: GoogleFonts.poppins(
                    fontSize: wid * 0.035,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
