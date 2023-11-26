import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/screens/signupScreen.dart';

import '../widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>() ;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    return Scaffold(
      backgroundColor: KmainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
        Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          height: MediaQuery.of(context).size.height * .2,
          child: const Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/icons8-buy-50.png'),
              ),
              Positioned(
                bottom: 0,
                child: Text(
                  'Buy it',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
    ),
            SizedBox(height: height * .1,),
            CustomTextField(
              hintText: 'Enter Email',
              IconData: Icon(Icons.email),
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: height * .02,),
            CustomTextField(
              hintText: 'Enter Password',
              textInputType: TextInputType.name,
              IconData: Icon(Icons.lock),
            ),
            SizedBox(height: height * .1,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:90 , ),
              child: MaterialButton(
                color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed:(){
                  if(_globalKey.currentState!.validate()){

                  }
                  },
                  child: Text(
                    'LOGIN', style: TextStyle(
                    color: Colors.white,
                  ),
                  )
              ),
            ),
            SizedBox(height: height * .05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have an acount? ", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                ),),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                },
                    child: Text('Sign up', style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )))
              ],
            )

          ],
        ),
      ),
    );
  }
}

