import 'package:flutter/material.dart';

class CommonRowWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String currentPrice;
  final String currentValue;
  const CommonRowWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.currentPrice,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(subTitle, style: TextStyle(color: Colors.grey)),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              currentPrice,
              style: TextStyle(
                color: currentValue.contains('-') ? Colors.red : Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(currentValue, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
