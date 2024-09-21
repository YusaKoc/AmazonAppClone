import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {



  String _selectedOption = '0';


  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedOption = value!;
    });
  }

  Widget _getDynamicWidget() {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    switch (_selectedOption) {
      case '0':
        return case0();
      case '1':
        return case1(ekranGenisligi);
      default:
        return Container();
    }
  }

  Column case1(double ekranGenisligi) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                border: OutlineInputBorder(borderRadius: BorderRadius.zero),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Mobile number or email",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                border: OutlineInputBorder(borderRadius: BorderRadius.zero),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Create a password",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                border: OutlineInputBorder(borderRadius: BorderRadius.zero),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Checkbox(
                  checkColor: Colors.orange,
                  value: false,
                  onChanged: (bool? value){
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13.0),
                child: Text("Show password"),
              ),
            ],
          ),
          SizedBox(
            width: ekranGenisligi/1.1,
            child: ElevatedButton(
              onPressed: (){
                GoRouter.of(context).go("/accountDetails");
              },
              child: Text("Continue"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                backgroundColor: Color.fromARGB(255, 240, 197, 104),
              ),
            ),
          ),
          writePrivacyCreate(),
        ],
      );
  }
  Column case0() {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "E-mail (phone for mobile accounts)",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                border: OutlineInputBorder(borderRadius: BorderRadius.zero),
              ),
            ),
          ),
          SizedBox(
            width: ekranGenisligi/1.1,
            child: ElevatedButton(
              onPressed: (){
                GoRouter.of(context).go("/accountDetails");
              },
              child: Text("Continue"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                backgroundColor: Color.fromARGB(255, 240, 197, 104),
              ),
            ),
          ),
          writePrivacySignin(),
        ],
      );
  }


  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Amazon.co.uk',style: TextStyle(fontWeight: FontWeight.bold),)),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome",style: Theme.of(context).textTheme.titleLarge,),
                ],
              ),
            ),
            buildLoginCard(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: buildPrivacies(context),
            )
          ],
        ),
      ),
    );
  }

  Card buildLoginCard() {
    return Card(
          elevation: 10,
          color: Colors.white,
          child: Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    Text('Create account.',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(' New to Amazon?'),
                  ],
                ),
                leading: Radio<String>(
                  value: '1',
                  groupValue: _selectedOption,
                  onChanged: _handleRadioValueChange,
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Text('Sign-In.',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(' Already a customer?'),
                  ],
                ),
                leading: Radio<String>(
                  value: '0',
                  groupValue: _selectedOption,
                  onChanged: _handleRadioValueChange,
                ),
              ),
              _getDynamicWidget(),
            ],

          ),
        );
  }

  Column buildPrivacies(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Conditions of Use",style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.cyan),),
                Text("Privacy Notice",style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.cyan),),
                Text("Help",style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.cyan),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Cookies Notice",style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.cyan),),
                Text("Interest-Based Ads Notice",style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.cyan),),
              ],
            ),
            SizedBox(height: ekranYuksekligi/60,),
            Center(child: Text("© 1996-2021, Amazon, Inc. or its affiliates",style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey),))
          ],
        );
  }
}




Padding writePrivacySignin() {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0,right: 25,bottom: 25),
    child: RichText(
      text: TextSpan(
        text: 'By signing-in you agree to ',
        style: TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: "Amazon's Conditions of Use & Sale.",
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(
            text: ' Please see our ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Privacy Notice',
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(
            text: ', our ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Cookies Notice',
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(
            text: ' and our ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Interest-Based Ads Notice',
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(
            text: '.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    ),
  );
}

Padding writePrivacyCreate() {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0,right: 25,bottom: 25),
    child: RichText(
      text: TextSpan(
        text: 'By creating an account you agree to ',
        style: TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: "Amazon's Conditions of Use & Sale.",
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(
            text: ' Please see our ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Privacy Notice',
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(
            text: ', our ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Cookies Notice',
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(
            text: ' and our ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Interest-Based Ads Notice',
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(
            text: '.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    ),
  );
}

