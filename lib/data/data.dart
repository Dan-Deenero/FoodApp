import 'package:flutter/material.dart';
import 'package:foodui/contants.dart';

class FastFoods {
  final String foodName;
  final String foodImageUrl;
  final Color foodColor;

  FastFoods(
      {required this.foodName,
      required this.foodImageUrl,
      required this.foodColor});
}

List<FastFoods> getFoodDetails = [
  FastFoods(
    foodName: 'Coffee',
    foodImageUrl: '${kImageUrl}coffee.png',
    foodColor: const Color(0xffe4f4fa),
  ),
  FastFoods(
    foodName: 'Donut',
    foodImageUrl: '${kImageUrl}donut.png',
    foodColor: const Color(0xffffebec),
  ),
  FastFoods(
    foodName: 'Burger',
    foodImageUrl: '${kImageUrl}burger.png',
    foodColor: const Color(0xffe4f4fa),
  ),
  FastFoods(
    foodName: 'Pop Corn',
    foodImageUrl: '${kImageUrl}popcorn.png',
    foodColor: const Color(0xffffebec),
  )
];
