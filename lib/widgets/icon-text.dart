// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/widgets.dart';
import 'package:veegil_bank/utilis/dimensions.dart';
import 'package:veegil_bank/widgets/big_text.dart';
import 'package:veegil_bank/widgets/small_text.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const IconTextWidget({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.icon24 * 1.67),
        SizedBox(
          height: Dimensions.icon16 / 4,
        ),
        BigText(
          text: text,
          size: Dimensions.font18,
          fontWeight: FontWeight.w700,
        )
      ],
    );
  }
}
