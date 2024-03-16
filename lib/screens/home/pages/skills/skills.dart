import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/description.dart';
import 'components/skills_list.dart';

class Skills extends StatelessWidget {
  const Skills({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: size.height),
      child: Stack(
        alignment: Alignment.center,
        children: [
          size.width > 1100
          ? Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset('assets/images/decoration5.svg'),
          ): const SizedBox(),
          size.width > 1100
          ? Align(
            alignment: const Alignment(0.25, 0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SvgPicture.asset('assets/images/decoration_arrow1.svg')
            )
          ) : const SizedBox(),
          if (size.width > 1450) Positioned(
            left: 30,
            bottom: size.height/3.2,
            child: SvgPicture.asset('assets/images/decoration_arrow2.svg')
          ) else const SizedBox(),
          Padding(
            padding:  EdgeInsets.only(
              left: size.width > 1450 ? 150 : size.width > 1200 ? 50 : 25,
              right: size.width > 1450 ? 150 : size.width > 1200 ? 50 : 25,
            ),
            child: size.width > 1100 
              ? const Row(
                children: [
                  Expanded(child: Description()),
                  SkillsList(),
                ],
              )
              : const Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Description(),
                    SizedBox(height: 40),
                    SkillsList(isVertical: false),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}