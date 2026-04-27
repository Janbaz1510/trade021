import 'package:flutter/material.dart';

class HomeTopbar extends StatelessWidget {
  const HomeTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: const [
          Expanded(child: MarketItem()),
          VerticalDividerWidget(),
          Expanded(child: MarketItem()),
        ],
      ),
    );
  }
}

class MarketItem extends StatelessWidget {
  const MarketItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Expanded(
              child: Text(
                "SENSEX 18TH SEP",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(width: 8),
            Text("BSE"),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: const [
            Text(
              "966.85",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 8),
            Text("0.85 (0.09%)", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 60,
        child: VerticalDivider(thickness: 1.5, color: Colors.grey),
      ),
    );
  }
}
