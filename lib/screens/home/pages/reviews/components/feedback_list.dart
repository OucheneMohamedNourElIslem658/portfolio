import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../constents/colors.dart';
import '../../../../../constents/text_styles.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    super.key,
    this.viewportFraction,
    this.maxWidth
  });

  final double? viewportFraction,maxWidth;

  @override
  Widget build(BuildContext context) {
    final carouselController = Get.put(CustomCrousalController());
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: maxWidth ?? 1200),
          child: GetBuilder<CustomCrousalController>(
            builder: (_) {
              return MouseRegion(
                onHover: (event) => carouselController.hover(),
                onExit: (event) => carouselController.unHover(),
                child: CarouselSlider(
                  carouselController: carouselController.carouselController,
                  items: List.generate(
                    carouselController.reviewsList.length,
                    (index) {
                      final review = carouselController.reviewsList[index];
                      final rate = review['rate'] as int;
                      final content = review['review'] as String;
                      final name = review['name'] as String;
                      final profession  = review['profession'] as String;
                      final image = review['image'] as String;
                      return Center(
                        child: Review(
                          text: content, 
                          reviewerName: name, 
                          reviewerProfession: profession, 
                          reviewerImage: image, 
                          rate: rate
                        ),
                      );
                    }
                  ), 
                  options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    height: 220,
                    viewportFraction: viewportFraction ?? 0.35,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    autoPlay: !carouselController.isHovered,
                  )
                ),
              );
            }
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScrollButton(
              icon: 'assets/icons/arrow_back.svg', 
              onPressed: () => carouselController.scrollToPrevious()
            ),
            ScrollButton(
              icon: 'assets/icons/arrow_forward.svg', 
              onPressed: () => carouselController.scrollToNext()
            ),
          ],
        ),
      ],
    );
  }
}

class Review extends StatelessWidget {
  const Review({
    super.key, 
    required this.text, 
    required this.reviewerName, 
    required this.reviewerProfession, 
    required this.reviewerImage, 
    required this.rate
  });

  final String text;
  final String reviewerName;
  final String reviewerProfession;
  final String reviewerImage;
  final int rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: CustomColors.white,
        boxShadow: [
          BoxShadow(
            color: CustomColors.greyShadow.withOpacity(0.05),
            spreadRadius: 10,
            blurRadius: 10
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRatingBar(rate: rate),
          const SizedBox(height: 5),
          Expanded(
            child: Text(
              text,
              style: TextStyles.headline16,
            ),
          ),
          const SizedBox(height: 10),
          FeedBackerProfile(
            image: reviewerImage, 
            name: reviewerName, 
            profession: reviewerProfession
          )
        ],
      ),
    );
  }
}

class ScrollButton extends StatelessWidget {
  const ScrollButton({
    super.key, 
    required this.icon, 
    required this.onPressed
  });

  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed, 
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: const CircleBorder(),
        side: BorderSide(
          color: CustomColors.transparent
        )
      ),
      child: SvgPicture.asset(icon)
    );
  }
}

class FeedBackerProfile extends StatelessWidget {
  const FeedBackerProfile({
    super.key, 
    required this.image, 
    required this.name, 
    required this.profession,
  });

  final String image;
  final String name;
  final String profession;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              image
            ),
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyles.headline17,
              ),
              Text(
                profession,
                style: TextStyles.headline18,
              )
            ],
          )
        )
      ],
    );
  }
}

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key, 
    required this.rate,
  });

  final int rate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rate.toDouble(),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2),
      itemBuilder: (context, _) => SvgPicture.asset('assets/icons/star.svg'),
      itemSize: 12,
      onRatingUpdate: (rating) {},
      ignoreGestures: true,
    );
  }
}

class CustomCrousalController extends GetxController {
  final CarouselController carouselController = CarouselController();
  var isHovered = false;

  final reviewsList = [
    {
      'rate': 4,
      'review': 'As a web developer, I wasn\'t aware that Flutter could be used for website development. Learning about it from your portfolio has sparked my interest; it seems both fun and useful. I believe my next learning venture will be Flutter! You\'ve earned a solid 4 stars for your work',
      'name': 'Seffih Fadi',
      'profession':'Web Developer',
      'image': 'assets/images/fadi.jpg'
    },
    {
      'rate': 5,
      'review': 'Your Flutter portfolio website is truly impressive, showcasing a perfect blend of aesthetic appeal and professional content. The fact that you built it using Flutter reflects your creativity and a commendable ability to tackle challenges. I hope you continue to achieve success in all your endeavors.',
      'name': 'Gaouaou Abd Errahman',
      'profession':'Flutter Developer',
      'image': 'assets/images/mario.png'
    },
    {
      'rate': 5,
      'review': 'I really liked both the UI and the content 👏 Respect to your excellent work! Best regards 🌟',
      'name': 'Zegtouf Safie',
      'profession':'UI/UX Designer',
      'image': 'assets/images/safie.png'
    },
  ];

  void scrollToNext() => carouselController.nextPage();
  void scrollToPrevious() => carouselController.previousPage();
  void hover() {
    isHovered = true;
    update();
  }

  void unHover() {
    isHovered = false;
    update();
  }
}