import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/description.dart';
import 'components/feedback_list.dart';

class Reviews extends StatelessWidget {
  const Reviews({
    super.key, 
    required this.size
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: size.height
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: size.width > 1100 ? 60 : 0,
            left: 0,
            child: SvgPicture.asset('assets/images/decoration8.svg')
          ),
          Positioned(
            top: size.width > 1100 ? 150 : 0,
            right: 0,
            child: SvgPicture.asset('assets/images/decoration9.svg')
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:  EdgeInsets.only(
                  left: size.width > 1100 ? 150 : size.width > 730 ? 50 : 25,
                  right: size.width > 1100 ? 150 : size.width > 730 ? 50 : 25,
                ),
                child: Description(
                  focusedCircle: size.width > 1100 
                    ? true 
                    : false,
                )
              ),
              const SizedBox(height: 80),
              ReviewsList(
                viewportFraction: size.width > 960 
                  ? null 
                  : size.width > 800 
                    ? 0.4 
                    : size.width > 500 
                      ? 0.6 
                      : 0.8,
              ),
              const SizedBox(height: 30)
            ],
          ),
        ],
      ),
    );
  }
}