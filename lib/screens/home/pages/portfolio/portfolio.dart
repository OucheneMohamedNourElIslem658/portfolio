import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'components/description.dart';
import 'components/projects_list.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({
    super.key, 
    required this.size
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: size.height),
      child: Stack(
        children: [
          if (size.width > 850) Positioned(
            top: 40,
            child: SvgPicture.asset('assets/images/decoration3.svg')
          ) else const SizedBox(),
          if (size.width > 850) Positioned(
            bottom: 100,
            right: 0,
            child: SvgPicture.asset('assets/images/decoration7.svg')
          ) else const SizedBox(),
          if (size.width > 1100) Padding(
              padding:  EdgeInsets.only(
                left: size.width > 1200 ? 150 : size.width > 730 ? 50 : 25,
                right: size.width > 1200 ? 150 : size.width > 730 ? 50 : 25,
                top: size.width > 1100 ? 150 : 70
              ),
              child: const  Row(
                children: [
                  Expanded(
                    child: Description()
                  ),
                  SizedBox(width: 40),
                  ProjectsList()
                ],
              ),
            ) else Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Padding(
                  padding:  EdgeInsets.only(
                    left: size.width > 730 ? 50 : 25,
                    right: size.width > 730 ? 50 : 25,
                    top: size.width > 1100 ? 150 : 70,
                  ),
                  child: const Description(),
                ),
                const SizedBox(height: 40),
                const Center(
                  child: ProjectsList(
                    focusedItemsNumber: 3
                  )
                ),
                const SizedBox(height: 30)
              ],
          )
        ],
      ),
    );
  }
}