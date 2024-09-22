import 'package:brewly/components/custom_colors.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaH = MediaQuery.of(context).size.height;
    final mediaW = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: CustomColors().grey1,
      ),
      height: 238,
      width: 156,
    );
  }
}
