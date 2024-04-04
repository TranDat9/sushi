import 'package:first_app/components/button.dart';
import 'package:first_app/model/shop.dart';
import 'package:first_app/pages/food_detail_page.dart';
import 'package:first_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/food_tile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // food menu

  //
  void navigateToFoodDetials(int index) {
    // get the food item
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Center(
          child: Text(
            'Tokyo',
            style: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey[900],
              ))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // promo banner
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get 32% Promo',
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                MyButton(text: 'Radeem', onTap: () {}),
              ],
            ),
            Image.asset(
              'lib/images/three.png',
              height: 100,
            ),
          ]),
        ),
        const SizedBox(height: 20),
        // search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // list of menu
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Food Menu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey[800],
            ),
          ),
        ),
        const SizedBox(height: 10),
        //populer food
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodMenu.length,
            itemBuilder: (context, index) => FoodTile(
              onTap: () => navigateToFoodDetials(index),
              food: foodMenu[index],
            ),
          ),
        ),
        const SizedBox(height: 25),
        // populer food
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 2),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Image.asset(
                  'lib/images/sushi.png',
                  height: 60,
                ),
                Column(
                  children: [
                    Text(
                      "Salmo Eggs",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // price
                    Text(
                      '\$21.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //heart
            Icon(
              Icons.favorite_border,
              color: Colors.grey[700],
              size: 28,
            )
          ]),
        )
      ]),
    );
  }
}
