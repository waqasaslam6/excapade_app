import 'package:excapade_app/models/product.dart';
import 'package:excapade_app/screens/delivery.dart';
import 'package:excapade_app/screens/login.dart';
import 'package:excapade_app/screens/orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';


class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}


class _CartState extends State<Cart> {

  void _showModalSheet() {
    showModalBottomSheet(context: context, builder: (builder) {
      return Container(
        constraints: BoxConstraints(
          maxHeight: 120,
        ),
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 50,right: 50,bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Subtotal:',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).accentColor,
                    fontSize: 16.0
                  ),),
                  Text('\$27.00',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).accentColor,
                        fontSize: 16.0
                    ),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Discount:',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).accentColor,
                        fontSize: 16.0
                    ),),
                  Text('\$2.00',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).accentColor,
                        fontSize: 16.0
                    ),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total:',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).accentColor,
                        fontSize: 16.0
                    ),),
                  Text('\$25.00',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).accentColor,
                        fontSize: 16.0
                    ),),
                ],
              ),
            ],
          ),
        ),
        padding: EdgeInsets.all(0.0),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: Padding(
        padding: const EdgeInsets.only(top: 10,left: 0,right: 0,bottom: 10),
              child: Column(
                 children: <Widget>[
                      Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                     Text("Menu",
                     style: TextStyle(
                      fontWeight: FontWeight.w500,
                 color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                        ),),
    GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Orders()
        ));
      },
      child: Text("Cart",
        style: TextStyle(

        fontWeight: FontWeight.w500,
      color: Theme.of(context).primaryColor,
      fontSize: 20.0,
      ),),
    ),
    GestureDetector(
      onTap: (){
        _showModalSheet();
      },
      child: Text("Checkout",
      style: TextStyle(
      fontWeight: FontWeight.w500,
      color: Theme.of(context).primaryColor,
      fontSize: 20.0,
      ),),
    ),
    ],
    ),
  ]
    )
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              _buildCardItem(),
              SizedBox(height: 10,),
              _buildCardItem(),
              SizedBox(height: 10,),
              _buildCardItem(),
              SizedBox(height: 10,),
              _buildCardItem(),
              

            ],
          ),
        ),
      ),
    );
  }
}



Widget _buildCardItem()
{
  return Card(
    elevation: 2,
    color: Color(0xffe5e9f2),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 12,bottom: 0,left: 0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/images/p1.jpg",width: 140,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Dish 1",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8190a5),
                          fontSize: 18.0,
                        ),
                      ),
                      Text("1 per serving",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8190a5),
                          fontSize: 18.0,
                        ),),
                      Text("3 Services",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8190a5),
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 0,),
            Container(
              color: Color(0xff47525e),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Remove',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),),
                  Text('Edit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600
                    ),),
                  Text('\$12.00',style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );

}