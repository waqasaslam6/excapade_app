import 'package:excapade_app/models/product.dart';
import 'package:excapade_app/screens/delivery.dart';
import 'package:excapade_app/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';


 class Orders extends StatefulWidget {
   @override
   _OrdersState createState() => _OrdersState();
 }

 class _OrdersState extends State<Orders> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       bottomNavigationBar: BottomNavigationBar(
           currentIndex: 0,
           items:[
             BottomNavigationBarItem(
               icon: new Icon(Icons.favorite_border),
               title: new Text("Orders"),
             ),
             BottomNavigationBarItem(
               icon: new Icon(Icons.menu),
               title: new Text('Menu'),
             ),
             BottomNavigationBarItem(
                 icon: Icon(Icons.trending_up),
                 title: Text('Promotions')
             )
           ]
       ),

       body: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             _buildOrderHeader(context),
          //   SizedBox(height: 30,),
             _buildOrderList(context),
             _buildOrderList(context),
             _buildOrderList(context),
             _buildCalculations(context),
             Padding(
               padding: const EdgeInsets.only(top:15,right: 25),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: <Widget>[
                   RaisedButton(
                     onPressed: (){},
                     color: Color(0xff47525e),
                     child: Text("Back to Menu",
                       style: TextStyle(
                         color: Colors.white,
                       ),),
                   ),
                   SizedBox(width: 20,),
                   RaisedButton(
                     onPressed: (){},
                     color: Color(0xff47525e),
                     child: Text("Complete Order",
                       style: TextStyle(
                         color: Colors.white,
                       ),),
                   ),
                 ],
               ),
             ),
           ],
         ),
       ),
     );
   }
 }

 Widget _buildOrderHeader(context)
 {
   return Container(
     constraints: BoxConstraints(
       maxHeight: 150,
       minHeight: 100,
     ),
     padding: EdgeInsets.only(left: 25,top: 10),
     color: Theme.of(context).backgroundColor,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         Row(
           children: <Widget>[
             Text("Your Orders :",
               style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 26.0,
                   color: Theme.of(context).accentColor
               ),),
           ],
         ),
         Row(
           children: <Widget>[
             Text("14th February 2020",
               style: TextStyle(
                   fontSize: 18.0,
                   color: Theme.of(context).accentColor
               ),),
           ],
         ),

       ],

     ),
   );


 }
Widget _buildCalculations(context)
{
    return Container(
      padding: EdgeInsets.only(left: 20,right: 60,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Subtotal :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                  fontSize: 20.0,
                  decorationColor: Color(0xffe5e9f2),
                ),),
              Text("\$56.00",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 22.0,
                  decorationColor: Color(0xffe5e9f2),
                ),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Discount :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                  fontSize: 20.0,
                  decorationColor: Color(0xffe5e9f2),
                ),),
              Text("10%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 22.0,
                  decorationColor: Color(0xffe5e9f2),
                ),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Total :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                  fontSize: 20.0,
                  decorationColor: Color(0xffe5e9f2),
                ),),
              Text("\$50.40",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 22.0,
                  decorationColor: Color(0xffe5e9f2),
                ),),
            ],
          ),
        ],
      ),
    );

}

 Widget _buildOrderList(context)
 {
   return SingleChildScrollView(
     child: Container(
       padding: EdgeInsets.all(20.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           Column(
             children: <Widget>[
               Text("Product Name",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 color: Theme.of(context).accentColor,
                 fontSize: 20.0,
                 decorationColor: Color(0xffe5e9f2),
               ),),
               Text("No. servings",
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Theme.of(context).primaryColor,
                   fontSize: 16.0,
                   decorationColor: Color(0xffe5e9f2),
                 ),),
             ],
           ),
           Text("\$12.00",
             style: TextStyle(
               fontWeight: FontWeight.bold,
               color: Theme.of(context).primaryColor,
               fontSize: 22.0,
               decorationColor: Color(0xffe5e9f2),
             ),),
           IconButton(
             onPressed: (){},
             icon: Image.asset('assets/icons/remove.png'),
           ),
            IconButton(
              onPressed: (){},
              icon: Image.asset('assets/icons/edit.png'),
            ),
         ],
       ),

     ),
   );
 }