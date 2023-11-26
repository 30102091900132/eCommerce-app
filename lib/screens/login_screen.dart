import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/screens/signupScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../provider/modelHud.dart';
import '../services/auth.dart';
import '../widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>() ;
  bool isAdmin = false ;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    String? password , email , userName;
    final auth = Auth();
    return Scaffold(
      backgroundColor: KmainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
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
                onClick: (value){
                  email = value ;
                },
                hintText: 'Enter Email',
                IconData: Icon(Icons.email),
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: height * .02,),
              CustomTextField(
                onClick: (value){
                  password = value ;
                },
                hintText: 'Enter Password',
                textInputType: TextInputType.name,
                IconData: Icon(Icons.lock),
              ),
              SizedBox(height: height * .1,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:90 , ),
                child: Builder(
                  builder:(context) => MaterialButton(
                    color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed:()async{
                      final modelHud_2 = Provider.of<ModelHud>(context, listen: false);
                      modelHud_2.changeisLoading(true);
                      if(_globalKey.currentState!.validate()){
                        _globalKey.currentState?.save();
                        print(email);
                        print(password);
                        try{
                          final result = await auth.signIn(email!, password!) ;
                          modelHud_2.changeisLoading(false);
                        print(result.user?.uid) ;} catch(e){
                          modelHud_2.changeisLoading(false);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                e.toString(),
                              )));
                        }
                      }
                      },
                      child: Text(
                        'LOGIN', style: TextStyle(
                        color: Colors.white,
                      ),
                      )
                  ),
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('I am admin' , textAlign: TextAlign.center ,style: TextStyle(
                      color: isAdmin ? KmainColor : Colors.white
                    ),),
                    Spacer(),
                    Text('I am user',textAlign: TextAlign.center ,style: TextStyle(
                        color: isAdmin ? Colors.white : KmainColor
                    ),
                    ),


                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

