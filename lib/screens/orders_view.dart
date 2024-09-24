import 'package:brewly/components/button.dart';
import 'package:brewly/components/coffee_card.dart';
import 'package:brewly/components/custom_colors.dart';
import 'package:brewly/data/data.dart';
import 'package:brewly/screens/delivery_view.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  int? selectedIndex = 0;
  final dOptions = CoffeeShopItems().dOptions;
  final ordersList = CoffeeShopItems().orderedItems;
  @override
  Widget build(BuildContext context) {
    final mediaH = MediaQuery.of(context).size.height;
    final mediaW = MediaQuery.of(context).size.width;
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
          "Order",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 52,
              decoration: BoxDecoration(color: CustomColors().boxBorder),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CoffeeFlavorCard(
                        boxWidth: (mediaW / 2) - 24,
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        flavorName: dOptions[index],
                        isSelected: selectedIndex == index,
                      );
                    },
                    itemCount: dOptions.length),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.start,
              "Delivery Address",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: CustomColors().dark,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Jl. Kpg Sutoyo",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: CustomColors().dark,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: CustomColors().lighter,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 26,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                      border: Border.all(color: CustomColors().dark)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.edit_location_alt_outlined,
                        size: 14,
                      ),
                      Text(
                        "Edit Address",
                        style: TextStyle(
                            fontSize: 12,
                            color: CustomColors().dark,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 26,
                  width: 101,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                      border: Border.all(color: CustomColors().dark)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.note_add_sharp,
                        size: 14,
                      ),
                      Text(
                        "Add Note",
                        style: TextStyle(
                            fontSize: 12,
                            color: CustomColors().dark,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                ordersList[index]['img'][0],
                                width: 54,
                                height: 54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ordersList[index]['name'],
                              style: TextStyle(
                                fontSize: 16,
                                color: CustomColors().dark,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ordersList[index]['tags'][0],
                              style: TextStyle(
                                fontSize: 12,
                                color: CustomColors().lighter,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            InkWell(
                              child: Image.asset(
                                "assets/images/Icon_minus.png",
                                width: 24,
                                height: 24,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("1"),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: Image.asset(
                                "assets/images/Icon_plus.png",
                                width: 24,
                                height: 24,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: CoffeeShopItems().orderedItems.length,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 327,
              height: 56,
              child: Image.asset("assets/images/Discount.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Payment Summary",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: CustomColors().dark,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: CustomColors().dark,
                  ),
                ),
                Text(
                  "4.53",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: CustomColors().dark,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Fee",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: CustomColors().dark,
                  ),
                ),
                Spacer(),
                Text(
                  "\$ 2.0",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: CustomColors().dark,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "\$ 1.0",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: CustomColors().dark,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 165,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(0), top: Radius.circular(16))),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.wallet_travel_outlined,
                              weight: 20,
                              color: CustomColors().brown1,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cash/Wallet",
                              style: TextStyle(
                                fontSize: 14,
                                color: CustomColors().dark,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "\$ 5.53",
                              style: TextStyle(
                                fontSize: 12,
                                color: CustomColors().brown1,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          weight: 20,
                          color: CustomColors().dark,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        buttonText: "Order",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeliveryView(),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
