import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 23, 32, 1),
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(22),
              child: Container(
                margin: EdgeInsets.only(top: 42),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/logoFlutter.svg'),
                    SizedBox(
                      height: 30,
                    ),
                    const Text("Welcome back!",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                    const Text(
                      "Pick up where you left off",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 40),
                    _buildListTile(
                      context,
                      Icons.account_circle,
                      "List Users",
                      "/listUser",
                    ),
                    _buildListTile(
                      context,
                      Icons.shopping_cart,
                      "List Purchase",
                      "/listPurchase",
                    ),
                    _buildListTile(
                      context,
                      Icons.sell,
                      "List Sales",
                      "/listSales",
                    ),
                    _buildListTile(
                      context,
                      Icons.shopping_bag_rounded,
                      "List Product",
                      "/listProduct",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, IconData iconData, String title, String routeName) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, routeName),
      leading: Icon(iconData, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
    );
  }
}
