import 'package:Durga/utils/quotes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  //const CustomAppBar({super.key});
  Function? onTap;
  int? quoteIndex;
  CustomAppBar({this.onTap, this.quoteIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap!();
      },
      child: Container(
        child: Text(sweetSayings[quoteIndex!],
                style: TextStyle(fontSize:18),),
      ),
    );
  }
}