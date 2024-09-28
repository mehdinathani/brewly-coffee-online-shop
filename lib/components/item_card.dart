import 'package:brewly/components/custom_colors.dart';
import 'package:brewly/screens/detailItem_view.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final String catergory;
  final num price;
  final Function()? onTap;
  final Function()? onButtonTap;

  const ItemCard({
    super.key,
    required this.imagePath,
    required this.itemName,
    required this.catergory,
    required this.price,
    this.onTap,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    final mediaH = MediaQuery.of(context).size.height;
    final mediaW = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors().slightbrown,
          borderRadius: BorderRadius.circular(16),
        ),
        height: 238,
        width: 156,
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Apply border radius to the image
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded corners
              child: Image.asset(
                imagePath,
                height: 100,
                width: 110,
                fit: BoxFit
                    .cover, // Ensures the image covers the container properly
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.start,
                    itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    catergory,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  // const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        '\$${price.toStringAsFixed(2)}', // Format price to 2 decimal places
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      // IconButton(onPressed: () {}, icon: Icon(Icons.add))
                      GestureDetector(
                        onTap: onButtonTap,
                        child: Image.asset("assets/images/addbutton.jpg"),
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
