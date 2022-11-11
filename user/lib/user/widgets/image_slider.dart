import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';

class Image_slider extends StatelessWidget {
  const Image_slider({
    required BuildContext context,
    required this.hei,
    required this.wid,
    this.img1,
    this.img2,
    this.img3,
    this.img4,
    this.img5,
  });

  final double hei;
  final double wid;
  final img1, img2, img3, img4, img5;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: hei * 0.14,
        width: wid * 0.91,
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 166, 166, 166),
                          blurRadius: 3,
                          offset: Offset(1, 1))
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: ImageSlideshow(
                      indicatorColor: const Color.fromARGB(255, 90, 90, 90),
                      autoPlayInterval: 5000,
                      isLoop: true,
                      children: [
                        images(img: img1),
                        images(img: img2),
                        images(img: img3),
                        images(img: img4),
                        images(img: img5),
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  Row(
                    children: [
                      Text("Flash sale",
                          style: GoogleFonts.poppins(
                              shadows: [
                                const Shadow(
                                  color: Color.fromARGB(255, 1, 1, 1),
                                  blurRadius: 2,
                                  offset: Offset(1, 1.5),
                                )
                              ],
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: wid * 0.05,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("view more >",
                          style: GoogleFonts.poppins(
                              shadows: [
                                const Shadow(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    blurRadius: 3,
                                    offset: Offset(1, 1.5))
                              ],
                              color: Color.fromARGB(255, 255, 166, 0),
                              fontSize: wid * 0.04,
                              fontWeight: FontWeight.w400)),
                    ],
                  )
                ]),
              ),
            ])));
  }
}

class images extends StatelessWidget {
  const images({
    Key? key,
    required this.img,
  }) : super(key: key);

  final img;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.95,
      child: Container(
        child: Image.network(
          img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
