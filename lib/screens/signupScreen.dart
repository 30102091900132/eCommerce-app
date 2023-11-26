import 'package:ecommerce/provider/modelHud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../services/auth.dart';
import '../widget/custom_text_field.dart';
import 'login_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class SignupScreen extends StatelessWidget {
 SignupScreen({super.key});
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>() ;
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
                  userName = value;
                },
                hintText: 'Enter Name',
                textInputType: TextInputType.name,
                IconData: const Icon(Icons.person),
              ),
              SizedBox(height: height * .02,),
              CustomTextField(
                onClick: (value){
                  email = value ;
                },
                hintText: 'Enter Email',
                IconData: const Icon(Icons.email),
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: height * .02,),
              CustomTextField(
                onClick: (value){
                  password = value ;
                },
                hintText: 'Enter Password',
                textInputType: TextInputType.name,
                IconData: const Icon(Icons.lock),
              ),
              SizedBox(height: height * .1,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:90 , ),
                child: Builder(
                  builder: (context) => MaterialButton(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed:() async {
                        final modelhud = Provider.of<ModelHud>(context , listen: false) ;
                        modelhud.changeisLoading(true) ;
                        if(_globalKey.currentState!.validate()){
                          _globalKey.currentState?.save();
                          print(email);
                          print(password);

                          try{
                            final authResult =await auth.signUp(email!, password!) ;
                            modelhud.changeisLoading(false) ;
                          print(authResult.user?.uid) ;

                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                          } catch(e) {
                            modelhud.changeisLoading(false) ;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    e.toString(),
                                )));
                          }
                        }
                      },
                      child: const Text(
                        'SIGN UP', style: TextStyle(
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
                  const Text("Do have an acount? ", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                  TextButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                      child: const Text('Login', style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
