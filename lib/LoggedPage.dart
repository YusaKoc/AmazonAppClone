import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoggedPage extends StatefulWidget {
  const LoggedPage({super.key});

  @override
  State<LoggedPage> createState() => _LoggedPageState();
}

class _LoggedPageState extends State<LoggedPage> {

  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _timer;

  final List<String> _imageUrls = [
    'images/amazon-alexa.png',
    "images/swipeItem1.png",
    "images/swipeItem2.png"
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.cyan.withOpacity(0.4),
                  Colors.greenAccent.withOpacity(0.6)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.cyan.withOpacity(0.2),
                      Colors.greenAccent.withOpacity(0.4)
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: ekranYuksekligi / 35,
                      ),
                      SizedBox(
                        width: ekranGenisligi / 1.1,
                        child: buildSearchBar(),
                      ),
                      SizedBox(
                        height: ekranYuksekligi / 35,
                      ),

                      Row(
                        children: [
                          SizedBox(
                            width: ekranGenisligi / 16,
                          ),
                          Text("Alexa Lists"),
                          SizedBox(
                            width: ekranGenisligi / 16,
                          ),
                          Text("Prime"),
                          SizedBox(
                            width: ekranGenisligi / 16,
                          ),
                          Text("Video"),
                          SizedBox(
                            width: ekranGenisligi / 16,
                          ),
                          Text("Music"),
                        ],
                      ),
                      SizedBox(
                        height: ekranYuksekligi / 45,
                      ),
                    ],
                  ),
                ),
              ),
              buildShowModalSheet(context, ekranGenisligi, ekranYuksekligi),
              buildAutoSwipeableCards(ekranYuksekligi),
              buildCardSwipe(ekranYuksekligi),
              buildTopDeal(ekranGenisligi, ekranYuksekligi)
            ],
          ),
        ),
      ),
    );
  }


  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart_rounded), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.list_outlined), label: ""),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.black,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(color: Colors.cyan, applyTextScaling: true),
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white.withOpacity(0.9),
    );
  }

  Container buildAutoSwipeableCards(double ekranYuksekligi) {
    return Container(
      height: ekranYuksekligi / 3,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _imageUrls.length,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          return Image.asset(
            _imageUrls[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  SearchBar buildSearchBar() {
    return SearchBar(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Icon(Icons.search),
      ),
      trailing: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.mic,
                color: Colors.black.withOpacity(0.3),
              ),
            )
          ],
        )
      ],
      hintText: "Search Amazon.co.uk",
      hintStyle: MaterialStateProperty.all(
        TextStyle(color: Colors.black.withOpacity(0.3)),
      ),
    );
  }

  SizedBox buildCardSwipe(double ekranYuksekligi) {
    return SizedBox(
      height: ekranYuksekligi / 4,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildCard2(
            title: "Brand new products",
            description: "£2.71",
            image: "cardItem1.png",
          ),
          buildCard2(
            title: "BONTEC TV Wall\n Mount for most 37...",
            description: "£16.99",
            image: "cardItem2.png",
          ),
          buildCard2(
            title: "Fire TV Cube",
            description: "",
            image: "tvcube.jpg",
          ),
        ],
      ),
    );
  }

  SizedBox buildTopDeal(double ekranGenisligi, double ekranYuksekligi) {
    return SizedBox(
      width: ekranGenisligi / 1.05,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: Text(
                "Top Deal",
                style: TextStyle(
                    fontSize: ekranGenisligi / 22, fontWeight: FontWeight.w500),
              ),
            ),
            Center(child: Image.asset("images/img_1.png")),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: Text("Starbucks: Nesspresso Coffe Capsules"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 5),
              child: Text("£15.19 - £24.99"),
            ),
            SizedBox(
              height: ekranYuksekligi / 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: Text(
                "See all deals",
                style: TextStyle(color: Colors.cyan),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class buildCard2 extends StatelessWidget{
  final String title;
  final String description;
  final String image;
  final Color color;
  final double elevation;
  final double borderRadius;

  buildCard2({
    required this.image,
    required this.title,
    required this.description,
    this.color = Colors.white,
    this.elevation = 4.0,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Card(
        color: color,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: ekranYuksekligi/6,child: Image.asset("images/${image}")),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: ekranGenisligi/25,fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 2.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    description,
                    style: TextStyle(fontSize: ekranGenisligi/35, color: Colors.grey[700]),
                  ),
                )
              ],
            ),
          ],
        )
    );
  }
}

GestureDetector buildShowModalSheet(BuildContext context, double ekranGenisligi, double ekranYuksekligi) {
  return GestureDetector(
    onTap: (){
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
          ),
          context: context,
          builder: (BuildContext context){
            return Container(
              width: ekranGenisligi,
              height: ekranYuksekligi/3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Choose your location",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
                          Text("Delivery options and delivery speeds may vary for different locations",style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.black.withOpacity(0.6)),),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              width: ekranGenisligi/3,
                              height: ekranYuksekligi/7,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Colors.grey)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text("Manage address book",style: TextStyle(color: Colors.blue),),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(Icons.place,color: Colors.blue,),
                          ),
                          Text("Enter a UK postcode",style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.blue),)
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(Icons.language_outlined,color: Colors.blue,),
                        ),
                        Text("Deliver outside the UK",style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.blue),)
                      ],
                    )
                  ],
                ),
              ),
            );
          }
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: ekranGenisligi / 40,
          ),
          Icon(Icons.place_outlined),
          SizedBox(
            width: ekranGenisligi / 26,
          ),
          Text("Deliver to United States")
        ],
      ),
    ),
  );
}
