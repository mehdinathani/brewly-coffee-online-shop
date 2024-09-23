import 'package:brewly/components/custom_colors.dart';
import 'package:flutter/material.dart';

class DetailitemView extends StatefulWidget {
  final String imagePath;
  final String itemName;
  final String tag;

  const DetailitemView(
      {super.key,
      required this.imagePath,
      required this.itemName,
      required this.tag});

  @override
  State<DetailitemView> createState() => _DetailitemViewState();
}

class _DetailitemViewState extends State<DetailitemView> {
  @override
  Widget build(BuildContext context) {
    final mediaH = MediaQuery.of(context).size.height;
    final mediaW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios_new),
        title: const Text(
          "Detail",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Center(
              child: Container(
                width: mediaW, // 80% of the screen width
                height: mediaH * 0.3, // 40% of the screen height
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.left,
                      widget.itemName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: CustomColors().dark,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.tag,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: CustomColors().lightgrey),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "⭐ 4.8",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: CustomColors().dark,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/Fast Delivery.png"),
                    Image.asset("assets/images/Quality Bean.png"),
                    Image.asset("assets/images/Extra Milk.png"),
                  ],
                )
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
