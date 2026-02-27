import "package:flutter/material.dart";
import "package:plant_app/const/constant.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  Widget _indicator(bool isActived) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      height: 10,
      width: isActived ? 20 : 8,
      margin: EdgeInsets.only(right: 5),
      color: Constant.primaryColor,
    );
  }

  List<Widget> _createIndicator() {
    List<Widget> _list = [];
    for (int i = 0; i < 3; i++) {
      bool isPageActive = currentPage == i ? true : false;
      if (isPageActive == true) {
        _list.add(_indicator(true));
      } else {
        _list.add(_indicator(false));
      }
    }
    return _list;
  }

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
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            children: <Widget>[
              CreatePage(
                imageAdress: 'assets/images/plant-one.png',
                title: Constant.titleOne,
                description: Constant.descriptionOne,
              ),
              CreatePage(
                imageAdress: 'assets/images/plant-two.png',
                title: Constant.titleTwo,
                description: Constant.descriptionTwo,
              ),
              CreatePage(
                imageAdress: 'assets/images/plant-three.png',
                title: Constant.titleThree,
                description: Constant.descriptionThree,
              ),
            ],
          ),
          Row(children: _createIndicator()),
        ],
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  final String imageAdress;
  final String title;
  final String description;
  const CreatePage({
    super.key,
    required this.imageAdress,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(imageAdress, height: 300, width: 300),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "yekan",
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Constant.primaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            description,
            style: TextStyle(
              fontFamily: "iransans",
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
