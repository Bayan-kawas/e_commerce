import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String imgPath;
  final String lable;

  CategoryItem({required this.imgPath,required this.lable});

  @override
  Widget build(BuildContext context) {
    return Column(
   //   crossAxisAlignment:CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right:20),
          height: 60,
          width:60,
          decoration:BoxDecoration(
            color:Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Image.asset(imgPath),
        ),
        SizedBox(
          height:10
        ),
        Padding(
          
          padding: EdgeInsets.only(right: 15),
          child:Text(lable,
          style:TextStyle(

            fontSize:12
          ),
          ),
        ),
      ],
    );
  }
}
