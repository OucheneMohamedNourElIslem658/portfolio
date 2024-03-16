import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'components/custom_devider.dart';
import 'components/decoration.dart';
import 'components/statistic_item.dart';


class About extends StatelessWidget {
  const About({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: size.height),
      child: Stack(
        children: [
          size.width > 1100
          ? Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset('assets/images/decoration1.svg'),
          )
          : const SizedBox(),
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset('assets/images/decoration2.svg'),
          ),
          size.width > 1100
          ?Positioned(
            bottom: 100,
            child: SvgPicture.asset('assets/images/decoration3.svg'),
          ) : const SizedBox(),
          size.width > 1100
          ? Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/decoration4.svg'
            ),
          )
          : Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/decoration6.svg'
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(
              left: size.width > 1100 ? 150 : size.width > 730 ? 50 : 25,
              right: size.width > 1100 ? 150 : size.width > 730 ? 50 : 25,
              top: size.width > 1100 ? 150 : 70,
              bottom: 30
            ),
            child: Column(
              children: [
                if (size.width > 1100) Row(
                  children: [
                    const Expanded(
                      child: DecorationTexts(),
                    ),
                    Image.asset('assets/images/profile_pic_decoration.png')
                  ],
                ) else Column(
                  children: [
                    Image.asset(
                      size.width > 730
                      ? 'assets/images/profile_pic_decoration.png'
                      : 'assets/images/profile_pic_decoration2.png'
                    ),
                    const DecorationTexts()
                  ],
                ),
                size.width > 730
                ? const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatisticItem(number: 3,group: 'Front Projects'),
                      CustomDevider(),
                      StatisticItem(number: 3,group: 'Technologies Used'),
                      CustomDevider(),
                      StatisticItem(number: 10,group: 'Reviews'),
                    ],
                  ),
                )
                : const Column(
                  children: [
                    SizedBox(height: 40),
                    Row(
                      children: [
                        CustomDevider(),
                        SizedBox(width: 30),
                        StatisticItem(number: 3,group: 'Front Projects'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CustomDevider(),
                        SizedBox(width: 20),
                        StatisticItem(number: 3,group: 'Technologies Used'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CustomDevider(),
                        SizedBox(width: 20),
                        StatisticItem(number: 10,group: 'Reviews'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
