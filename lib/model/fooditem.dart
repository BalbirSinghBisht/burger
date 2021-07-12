import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

FooditemList fooditemList = FooditemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Cheese Burger",
    hotel: "Monkey Bar",
    price: 50.00,
    imgUrl:
        "https://www.foodrepublic.com/wp-content/uploads/2012/03/033_FR11785.jpg",
  ),
  FoodItem(
    id: 2,
    title: "Burger",
    hotel: "KFC",
    price: 60.00,
    imgUrl:
        "https://twisper.com/wp-content/uploads/2020/03/close-up-photo-of-burger-3915906-scaled.jpg",
  ),
  FoodItem(
    id: 3,
    title: "Extra Cheese Burger ",
    hotel: "Burger King",
    price: 90.00,
    imgUrl:
        "https://media-cdn.tripadvisor.com/media/photo-s/0f/ee/36/38/saftiges-beef-frisch.jpg",
  ),
  FoodItem(
    id: 4,
    title: "Street Burger",
    hotel: "Hard Rock Cafe",
    price: 45.00,
    imgUrl:
        "https://media-cdn.tripadvisor.com/media/photo-s/19/fe/73/5e/la-larco-street.jpg",
  ),
  FoodItem(
    id: 5,
    title: "Spicy Burger",
    hotel: "Anand Healthy Kitchen",
    price: 75.00,
    imgUrl: "https://shireenanwer.com/wp-content/uploads/2020/09/Hot-And-Spicy-Grilled-Burger-Recipe.jpg",
  ),
  FoodItem(
    id: 6,
    title: "NonVeg Burger",
    hotel: "KFC",
    price: 100.00,
    imgUrl:
        "http://feenix.co.in/wp-content/uploads/2018/01/104316205-Screen-Shot-2017-03-02-at-11.59.09-AM.1910x1000.jpg",
  ),
  FoodItem(
    id: 7,
    title: "Hamburger",
    hotel: "Sassy House",
    price: 250.00,
    imgUrl:
      "https://inthekitch.net/wp-content/uploads/Electric-Skillet-Hamburgers_Featured-Image.jpg",
  ),
]);

class FooditemList {
  List<FoodItem> foodItems;

  FooditemList({@required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String hotel;
  double price;
  String imgUrl;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.hotel,
    @required this.price,
    @required this.imgUrl,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}
