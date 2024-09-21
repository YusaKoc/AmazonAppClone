import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ekranYuksekligi/12),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                    child: Icon(Icons.arrow_back),
                  onTap: (){
                    GoRouter.of(context).go("/loggedPage");
                  },
                ),
              ),
              Container(height:ekranYuksekligi/2,child: buildSearchBar(),width: ekranGenisligi/1.3,),
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.cyan.withOpacity(0.4), Colors.greenAccent.withOpacity(0.6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ekranYuksekligi/60,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text("Orders",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildCards(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text("Account Settings",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildCards2(),
            ),
          ],
        ),
      ),
    );
  }
}

BottomNavigationBar buildBottomNavigationBar() {

  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart_rounded), label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.list_outlined), label: ""),
    ],
    selectedItemColor: Colors.black,
    showUnselectedLabels: true,
    selectedIconTheme: IconThemeData(color: Colors.cyan, applyTextScaling: true),
    unselectedItemColor: Colors.black,
    backgroundColor: Colors.white.withOpacity(0.9),
  );
}


SearchBar buildSearchBar() {
  return SearchBar(
    elevation: MaterialStateProperty.all(10),
    backgroundColor: MaterialStateProperty.all(Colors.white) ,
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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

Card buildCards() {
  return Card(
    elevation: 10,
    color: Colors.white,
    child: Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Orders"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),

        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Subscribe & Save"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Amazon Day"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ],
    ),
  );
}

Card buildCards2() {
  return Card(
    elevation: 10,
    color: Colors.white,
    child: Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Login & Security"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),

        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Prime Membership"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Create a free business account"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Payments"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Purchase preferences"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Adresses"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Login with Amazon"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Manage saved IDs"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Manage your profile"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Content and devices"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Manage gift card balance"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top up account"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shop with Points"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Amazon Household"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Audible settings"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ],
    ),
  );
}
