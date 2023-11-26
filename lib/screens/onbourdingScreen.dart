import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnbourdingScreen extends StatelessWidget {
  const OnbourdingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(151, 117, 250, 1),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child:  Image.asset("assets/images/image_laze.png" , fit: BoxFit.cover),
          ),
          Positioned(
              top: 553,
              left: 16,
              right: 16,
              bottom: 16,
              child: Container(
            height: 345,
            width: 244,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 42 , vertical: 25),
                      child: Text("Look Good, Feel Good",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25 ,right: 25, top: 10, bottom: 20),
                      child: Text("Create your individual & unique style and look amazing everyday.",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
          )
          )
        ],
      ),
    );
  }
}
