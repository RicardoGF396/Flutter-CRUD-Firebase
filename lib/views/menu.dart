import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MenuScreen extends StatefulWidget {
  final String? userName;
  final String? profilePicture;

  MenuScreen({this.userName, this.profilePicture});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/logoFlutter.svg'),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            '${widget.profilePicture}',
                            width: 40,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    const Text("Welcome back!",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                    if (widget.userName != null)
                      Text(
                        '${widget.userName}',
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
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
                    TextButton(
                        onPressed: () {
                          _googleSignIn.signOut().then((value) => {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()))
                              });
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        child: Text('Log out'))
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
