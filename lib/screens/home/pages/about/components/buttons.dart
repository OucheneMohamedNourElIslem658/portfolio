import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constents/text_styles.dart';

import '../../../../../constents/colors.dart';
import '../../../controllers/custom_navigation_controller.dart';


class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(CustomNavigationController());
    return GetBuilder<CustomNavigationController>(
      builder: (_) {
        return Container(
          height: 60,
          decoration: BoxDecoration(
            color: CustomColors.white,
            boxShadow: [
              BoxShadow(
                color: CustomColors.greenPrimary.withOpacity(0.2),
                offset: const Offset(0, -6),
                blurRadius: 10,
                spreadRadius: 2
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              navigationController.options.length, 
              (index) {
                final option = navigationController.options[index];
                final name = option['name'] as String ;
                final icon = option['icon'] as IconData ;
                final isSelected = option['isSelected'] as bool;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: isSelected ? 150 : 40,
                  height: 40,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? CustomColors.greenPrimary : Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child: GestureDetector(
                    onTap: () {
                      navigationController.selectItem(index);
                      navigationController.scrollToTarget(index);
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Icon(
                            icon,
                            color: isSelected ? CustomColors.white : CustomColors.black,
                          ),
                          SizedBox(width: isSelected ? 15 : null),
                          isSelected
                            ? Text(
                              name,
                              style: TextStyles.headline12
                            )
                            : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        );
      }
    );
  }
}
