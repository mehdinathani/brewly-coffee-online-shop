import 'dart:developer';

import 'package:brewly/components/button.dart';
import 'package:brewly/components/coffee_card.dart';
import 'package:brewly/components/custom_colors.dart';
import 'package:brewly/data/data.dart';
import 'package:brewly/functions/shopping_cart.dart';
import 'package:brewly/screens/orders_view.dart';
import 'package:flutter/material.dart';

class DetailitemView extends StatefulWidget {
  final Map<String, dynamic> selectedItem; // Expect the whole item

  const DetailitemView({super.key, required this.selectedItem});

  @override
  State<DetailitemView> createState() => _DetailitemViewState();
}

class _DetailitemViewState extends State<DetailitemView> {
  final ShoppingCart _shoppingCart = ShoppingCart();
  void addToFavorites(Map<String, dynamic> item) {
    // Check if item is already in the favorites list
    if (!CoffeeShopItems().favoriteItems.contains(item)) {
      setState(() {
        CoffeeShopItems()
            .favoriteItems
            .add(item); // Add item to the favorites list
      });
      log("${item['name']} added to favorites");
    } else {
      log("${item['name']} is already in favorites");
    }
  }

  // void addToOrders(Map<String, dynamic> item) {
  //   setState(() {
  //     CoffeeShopItems().orderedItems.add(item); // Add item to the orders list
  //   });
  //   log("${item['name']} added to orders");
  // }

  int? selectedSizeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    selectedSizeIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaH = MediaQuery.of(context).size.height;
    final mediaW = MediaQuery.of(context).size.width;
    final List<String> sizes = CoffeeShopItems().sizes;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios_new),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Detail",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                addToFavorites(widget.selectedItem);
              },
              child: const Icon(Icons.favorite_border)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: mediaW, // 80% of the screen width
                  height: mediaH * 0.3, // 40% of the screen height
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      widget.selectedItem['img'][0], // Display the item's image
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
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
                        widget.selectedItem['name'],
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
                        widget.selectedItem['tags'][0],
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
              const Divider(),
              Text(
                textAlign: TextAlign.start,
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CustomColors().dark,
                ),
              ),
              Text(
                widget.selectedItem['description'],
                style: TextStyle(
                  fontSize: 14,
                  color: CustomColors().lightgrey,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Size",
                style: TextStyle(
                  color: CustomColors().dark,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Ensure you return the widget here
                    return CoffeeFlavorCard(
                      isSelected: selectedSizeIndex == index,
                      onTap: () {
                        selectedSizeIndex = index;
                        log(index.toString());
                        log('Tap on ${sizes[index]}');
                        setState(() {});
                      },
                      flavorName: sizes[index],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width:
                        20, // Use width instead of height for horizontal spacing
                  ),
                  itemCount: sizes.length,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(color: CustomColors().lighter),
                      ),
                      Text(
                        '\$ ${widget.selectedItem['price'].toStringAsFixed(2)}', // Display formatted price
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: CustomColors().brown1,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomButton(
                        buttonWidth: 200,
                        buttonText: "Buy Now",
                        onTap: () {
                          // addToOrders(widget.selectedItem);
                          ShoppingCart().addItem(widget.selectedItem);
                          log(_shoppingCart.orderedItems.toString());
                          setState(() {});
                          // log(CoffeeShopItems().orderedItems.toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrdersView(),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
