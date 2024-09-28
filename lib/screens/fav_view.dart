import 'dart:developer';

import 'package:brewly/components/item_card.dart';
import 'package:brewly/data/data.dart';
import 'package:brewly/functions/shopping_cart.dart';
import 'package:brewly/screens/detailItem_view.dart';
import 'package:flutter/material.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  List favList = CoffeeShopItems().favoriteItems;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios_new),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text("Favourite"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (mediaWidth * 0.4) / (mediaHeight * 0.30),
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              mainAxisSpacing: 20),
          itemCount: favList.length,
          itemBuilder: (context, index) {
            return ItemCard(
              onButtonTap: () {
                ShoppingCart().addItem(
                  favList[index],
                );
                setState(() {
                  log(
                    ShoppingCart().orderedItems.toString(),
                  );
                });
              },
              onTap: () {
                log("");
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailitemView(
                      selectedItem: favList[index], // Pass the selected item
                    );
                  },
                ));
              },
              itemName: favList[index]['name'],
              catergory: favList[index]['category'],
              imagePath: favList[index]['img'][0],
              price: favList[index]['price'],
            );
          },
        ),
      ),
    );
  }
}
