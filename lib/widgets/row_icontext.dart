// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/widgets.dart';
import 'package:veegil_bank/utilis/dimensions.dart';
import 'package:veegil_bank/widgets/big_text.dart';
import 'package:veegil_bank/widgets/small_text.dart';

class RowIconTextWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const RowIconTextWidget({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BigText(
          text: text,
          size: Dimensions.font16 * 1.3,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          width: Dimensions.width10,
        ),
        Icon(icon, color: iconColor, size: Dimensions.icon16 * 1.2),
      ],
    );
  }
}
