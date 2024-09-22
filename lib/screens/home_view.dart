import 'package:brewly/components/button.dart';
import 'package:brewly/components/coffee_card.dart';
import 'package:brewly/components/global.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? selectedFlavorIndex;

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final appBarH = mediaHeight * 0.35;
    final bodyH =
        mediaHeight - appBarH; // Calculating remaining height for body

    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AppBar Section
            Container(
              color: const Color(0xff313131),
              height: appBarH,
              width: mediaWidth,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffA2A2A2),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Text(
                          "Bilzen, Tanjungbalai",
                          style: TextStyle(color: Color(0xffD8D8D8)),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xffD8D8D8),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xff2A2A2A),
                          ),
                          width: mediaWidth * 0.70,
                          height: mediaHeight * 0.1,
                          child: const Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.search,
                                color: Color(0xffFFFFFF),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Search coffee",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffA2A2A2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        CustomButton(
                          buttonIcon: const Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ),
                          buttonText: "",
                          onTap: () {},
                          buttonWidth: mediaWidth * 0.2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Body Section
            Container(
              height: bodyH,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50, // Limit the height of ListView
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: coffeeFlavors.length,
                      itemBuilder: (context, index) {
                        return CoffeeFlavorCard(
                          onTap: () {
                            selectedFlavorIndex =
                                index; // Update the selected index
                            setState(() {});
                          },
                          flavorName: coffeeFlavors[index],
                          isSelected: selectedFlavorIndex == index,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 20,
                              crossAxisCount: 2,
                              mainAxisSpacing: 20),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          color: Colors.amber,
                        );
                      },
                    ),
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
