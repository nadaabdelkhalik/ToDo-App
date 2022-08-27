import 'package:flutter/material.dart';
button({required var text, required var onPressed,required var width,required var height} ) {
  return Container(
    padding: const EdgeInsets.all(16),
    height: height,
    width: width,
    child: MaterialButton(
      onPressed:onPressed ,
     splashColor: Colors.brown[300],
     shape:  const StadiumBorder(),
      textColor: Colors.white,
      color:Colors.brown ,
      
      child:  Text(text),
    ),
  );
  
}
