
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,required this.onClick, required this.hintText, required this.IconData, required this.textInputType
  });
  String hintText ;
  Icon IconData ;
  final Function onClick ;

  TextInputType textInputType;
    String? _errorMessage(String str){
    switch(hintText){
      case 'Enter Name' : return 'Name is Empty' ;
      case 'Enter Email' : return 'Email is Empty' ;
      case 'Enter Password' : return 'password is Empty' ;
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 ,),
      child: TextFormField(
        onSaved: onClick(),
        obscureText: hintText == 'Enter Password' ? true : false,
        validator: (value) {
          if(value!.isEmpty){
            return _errorMessage(hintText) ;
          }
        },
        cursorColor: KmainColor,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: IconData,
          prefixIconColor: KmainColor,
          filled: true, //for to appear background color
          fillColor: KsacondaryColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}