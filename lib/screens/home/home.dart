import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/custom_app_bar.dart';
import 'controllers/custom_navigation_controller.dart';
import 'pages/about/about.dart';
import 'pages/about/components/buttons.dart';
import 'pages/contact/contact.dart';
import 'pages/portfolio/portfolio.dart';
import 'pages/reviews/reviews.dart';
import 'pages/skills/skills.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final navigationController = Get.put(CustomNavigationController());
    final appBarHeight = AppBar().preferredSize.height;
    navigationController.fillListPositions();
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: navigationController.scrollController,
            physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast
            ),
            child: Column(
              children: [
                About(
                  key: navigationController.keys[0],
                  size: size
                ),
                Skills(
                  key: navigationController.keys[1],
                  size: size
                ),
                Portfolio(
                  key: navigationController.keys[2],
                  size: size
                ),
                Reviews(
                  key: navigationController.keys[3],
                  size: size
                ),
                Contact(
                  key: navigationController.keys[4],
                  size: size
                )
              ],
            ),
          ),
          GetBuilder<CustomNavigationController>(
            builder: (_) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                top: navigationController.isAppBarVisible ? 0 : -appBarHeight,
                left: 0,
                right: 0,
                child: CustomAppBar(
                  size: size,
                  backgroundColor: navigationController.appBarBackgroundColor,
                )
              );
            }
          )
        ],
      ),
      bottomNavigationBar: size.width > 980
      ? null
      :const Buttons(),
    );
  }
}