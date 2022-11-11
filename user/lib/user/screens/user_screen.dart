import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user/user/screens/view_products.dart';
import 'package:user/user/widgets/public.dart';
import '../widgets/category.dart';
import '../widgets/image_slider.dart';
import '../widgets/products.dart';
import '../widgets/user_appbar.dart';

class user extends StatefulWidget {
  var p_name;
  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    var doc = GetStorage().read('mobile');
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('products')
                .doc('8148082690')
                .collection('products')
                .snapshots(),
            builder: (context, snapshot) {
              return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .doc('8148082690')
                    .collection('category')
                    .snapshots(),
                builder: (context, snapshot1) {
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> documents =
                        snapshot.data!.docs;
                    final List<DocumentSnapshot> document =
                        snapshot1.data!.docs;

                    return SingleChildScrollView(
                        child: Column(children: [
                      appbar_user(hei: hei, wid: wid), //----------->appbar_user
                      const SizedBox(height: 15),

                      Image_slider(
                        hei: hei,
                        wid: wid,
                        img1: documents[0]['image'],
                        img2: documents[0]['url_2'],
                        img3: documents[0]['url_3'],
                        img4: documents[0]['url_4'],
                        img5: documents[0]['url_5'],
                        context: context,
                      ),

                      const SizedBox(height: 25),

                      Padding(
                        padding: EdgeInsets.only(
                            left: wid * 0.057, right: wid * 0.057),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Categories",
                              style: GoogleFonts.poppins(
                                  fontSize: wid * 0.045,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text("View All  >",
                                style: GoogleFonts.poppins(
                                    fontSize: wid * 0.035,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey))
                          ],
                        ),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: SizedBox(
                          height: hei * 0.17,
                          child: ListView.builder(
                              shrinkWrap: true,
                              primary: true,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.all(8),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: document.length,
                              itemBuilder: (context, index) {
                                return category(
                                    hei: hei,
                                    wid: wid,
                                    img: document[index]['image'],
                                    text: document[index]['Category']);
                              }),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: wid * 0.057),
                        child: Row(
                          children: [
                            Text("Featured",
                                style: GoogleFonts.poppins(
                                    fontSize: wid * 0.045,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1 / 1.3,
                                    crossAxisCount: 2),
                            shrinkWrap: true,
                            primary: true,
                            padding: EdgeInsets.only(top: 12),
                            itemCount: documents.length,
                            itemBuilder: (context, index) {
                              var data = documents[index];
                              return GestureDetector(
                                onTap: () {
                                  count(data['Product_name'], data);
                                },
                                child: products(
                                  hei: hei,
                                  wid: wid,
                                  offer: "60%",
                                  product_name: data['Product_name'],
                                  image: data['url_2'],
                                  Netamount: data['Reduced_price'],
                                  sellingamount: data['Selling_price'],
                                ),
                              );
                            }),
                      ),
                    ]));
                  }
                  return Container();
                },
              );
            }));
  }

  count(doc, data) {
    FirebaseFirestore.instance
        .collection('Orders')
        .doc('+918148082690')
        .collection('views')
        .doc(doc)
        .collection('views')
        .doc(GetStorage().read('mobile'))
        .set({'view': 1}).whenComplete(() => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ViewProduct(data),
              ),
            ));
  }
}
