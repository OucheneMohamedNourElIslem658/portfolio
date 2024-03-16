import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '/constents/colors.dart';

class CustomNavigationController extends GetxController {
  final options = [
    {
      'icon': Icons.account_circle_outlined,
      'name': 'About',
      'isSelected': true,
      'isHovered': true,
    },
    {
      'icon': Icons.engineering_outlined,
      'name': 'Skills',
      'isSelected': false,
      'isHovered': false,
    },
    {
      'icon': Icons.info_outline,
      'name': 'Portfolio',
      'isSelected': false,
      'isHovered': false,
    },
    {
      'icon': Icons.reviews_outlined,
      'name': 'Testmonials',
      'isSelected': false,
      'isHovered': false,
    },
    {
      'icon': Icons.mail_outlined,
      'name': 'Contact',
      'isSelected': false,
      'isHovered': false,
    }
  ];
  final List<GlobalKey> keys = List.generate(5, (index) => GlobalKey()).obs;
  final List<double> listPositions = [];

  final ScrollController scrollController = ScrollController();
  bool isAppBarVisible = true;
  Color appBarBackgroundColor = CustomColors.transparent;

  void showAppBar() {
    isAppBarVisible = true;
    update();
  }

  void hideAppBar() {
    isAppBarVisible = false;
    update();
  }

  void changeAppBarBackgroundColor(){
    if (scrollController.offset == 0) {
      appBarBackgroundColor = CustomColors.transparent;
    } else {
      appBarBackgroundColor = CustomColors.white;
    }
    update();
  }

  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        showAppBar();
      } else if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        hideAppBar();
      }
      changeAppBarBackgroundColor();
      hoverByOffset();
    });
    super.onInit();
  }

  void fillListPositions() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      listPositions.clear();
      double cumulativeHeight = 0.0;
      for (var i = 0; i < keys.length; i++) {
        final pageBox = keys[i].currentContext?.findRenderObject() as RenderBox?;
        if (pageBox != null) {
          var pageHeight = pageBox.size.height;
          cumulativeHeight += pageHeight;
          listPositions.add(cumulativeHeight);
        }
      }
    });
  }

  void hoverByOffset() {
    double offset = scrollController.offset;
    for (int i = 0; i < listPositions.length; i++) {
      double position = listPositions[i];
      double previousPosition = i > 0 ? listPositions[i - 1] : 0;

      if (offset >= previousPosition && offset < position) {
        hoverItem(i);
        selectItem(i);
      }
    }
  }

  void hover(int index){
    options[index]['isHovered'] = true;
    update();
  }

  void unhover(int index){
    options[index]['isHovered'] = false;
    update();
  }

  void hoverItem(int index){
    for (var i = 0; i < options.length; i++) {
      unhover(i);
      if (index == i) {
        hover(index);
      }
    }
    update();
  }

  void selectItem(int index){
    for (var i = 0; i < options.length; i++) {
      if (i == index) {
        options[i]["isSelected"] = true;
      } else {
        options[i]["isSelected"] = false;
      }
    }
    update();
  }

  void scrollToTarget(int index) async {
    final context = keys[index].currentContext;
      if (context != null) {
        await Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
  }
}