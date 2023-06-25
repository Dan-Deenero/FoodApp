import 'package:flutter/material.dart';
import 'package:foodui/contants.dart';
import 'package:get/get.dart';

class FoodSection extends StatelessWidget {
  const FoodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          sizedHeight(40),
          TextFormField(
            decoration: InputDecoration(
                isCollapsed: true,
                fillColor: kGreyColor,
                hintText: 'Search',
                filled: true,
                contentPadding: const EdgeInsets.all(12),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          sizedHeight(30),
          DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: kBlackColor,
                  isScrollable: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), // Creates border
                      color: yellowColor),
                  tabs: [
                    buildTab(Icons.local_pizza, 'All'),
                    buildTab(Icons.fastfood, 'Fast Food'),
                    buildTab(Icons.coffee, 'Drinks'),
                  ],
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Column(
                          children: [
                            buildContainer('Burger', '1 flame grilled',
                                '\$6.50', 'burger.png'),
                            sizedHeight(25),
                            buildContainer('Coffee', '1 flame grilled',
                                '\$6.50', 'coffee.png'),
                            sizedHeight(25),
                            buildContainer('Hot Dog', '1 flame grilled',
                                '\$6.50', 'hot_dog.png'),
                            sizedHeight(25),
                            buildContainer('Pop Corn', '1 flame grilled',
                                '\$6.50', 'popcorn.png'),
                          ],
                        ),
                      ),
                      Container(),
                      Container(),
                    ])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildContainer(
      String title, String sub, String price, String image) {
    return Container(
      width: double.infinity,
      height: Get.height * 0.1 + 60,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(0, 1),
                spreadRadius: 5,
                blurRadius: 10)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                sub,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                price,
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Image.asset(
            kImageUrl + image,
          )
        ],
      ),
    );
  }

  Tab buildTab(IconData iconData, String title) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            iconData,
            size: 25,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(title),
        ],
      ),
    );
  }
}
