import 'package:flutter/material.dart';


class home_page extends StatelessWidget {
  final String usermessage;
  home_page({Key? key, required this.usermessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
       // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Welcome $usermessage', style: TextStyle(color: Colors.white))
        ),
        body: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-00UPk7cBtplMzWS9XjNL0aCPGBVSu3e0yg&usqp=CAU', width: 500, height: 500,),
            ],
          ),
        ),
      ),
    );
  }
}