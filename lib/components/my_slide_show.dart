import 'package:elibrary/components/error_image.dart';
import 'package:elibrary/components/my_gallery_viewer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MySlideShow extends StatefulWidget {
  MySlideShow({Key? key}) : super(key: key);

  @override
  State<MySlideShow> createState() => _MySlideShowState();
}

class _MySlideShowState extends State<MySlideShow> {
  int activeIndex = 0;
  final controller = CarouselSliderController();
  final imageUrls = [
    'https://thnal.com/assets/images/slides/thumb/1721033150_1720059978_librarybanner.jpg',
    'https://thnal.com/assets/images/slides/1721033041_banners.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                    carouselController: controller,
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = imageUrls[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyGalleryViewer(
                                imageUrls: imageUrls,
                                initialIndex: index,
                              ),
                            ),
                          );
                        },
                        child: buildImage(urlImage, index),
                      );
                    },
                    options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        enableInfiniteScroll: false,
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index))),
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildIndicator(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotWidth: 10, dotHeight: 10, activeDotColor: Colors.white),
        activeIndex: activeIndex,
        count: imageUrls.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) => Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const ErrorImage(size: 50);
          },
          loadingBuilder: (context, child, progress) {
            if (progress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
