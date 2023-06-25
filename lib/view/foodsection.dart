import 'package:flutter/material.dart';
import 'package:foodui/contants.dart';

class FoodSection extends StatelessWidget {
  const FoodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          sizedHeight(40),
          TextFormField(
            decoration: InputDecoration(
                isCollapsed: true,
                fillColor: kGreyColor,
                hintText: 'Search',
                filled: true,
                contentPadding: const EdgeInsets.all(15),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          sizedHeight(30),
          DefaultTabController(
              length: 3,
              child: TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: kBlackColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), // Creates border
                    color: yellowColor),
                tabs: [
                  buildTab(Icons.local_pizza, 'All'),
                  buildTab(Icons.fastfood, 'Fast Food'),
                  buildTab(Icons.coffee, 'Drinks'),
                ],
              ))
        ],
      ),
    );
  }

  Tab buildTab(IconData iconData, String title) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(iconData),
          Text(title),
        ],
      ),
    );
  }
}
