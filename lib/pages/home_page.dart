import "package:flutter/material.dart";
import "package:plant_app/const/constant.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20),
            child: InkWell(
              onTap: () {},
              child: Text(
                "رد کردن",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'lalehzar',
                  fontSize: 16,
                  // fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 350,
                    child: Image.asset(
                      'assets/images/plant-one.png',
                      height: 300,
                      width: 300,
                    ),
                  ),
                  Text(Constant.titleOne),
                  Text(Constant.descriptionOne),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
