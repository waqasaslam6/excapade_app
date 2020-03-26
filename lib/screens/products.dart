

import 'package:excapade_app/models/product.dart';
import 'package:excapade_app/screens/cart.dart';
import 'package:excapade_app/screens/categorySelect.dart';
import 'package:excapade_app/screens/delivery.dart';
import 'package:excapade_app/screens/login.dart';
import 'package:excapade_app/screens/orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:excapade_app/Constants.dart';
//import 'package:flappy_search_bar/flappy_search_bar.dart';

class Products extends StatefulWidget {
  final String USER_NAME;
  final String USER_EMAIL;
  Products({this.USER_NAME,this.USER_EMAIL});

  @override
  _ProductsState createState() => _ProductsState(USER_NAME,USER_EMAIL);
}

class _ProductsState extends State<Products> {
  @override
    String USER_NAME;
     String USER_EMAIL;
    _ProductsState(this.USER_NAME,this.USER_EMAIL);


  Future<List<Product>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Product(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
       title: Container(
         decoration: BoxDecoration(
           shape: BoxShape.rectangle,
         ),
         child: TextField(
           style: TextStyle(
               color: Color(0xff909db1),
               fontSize: 20.0,
               fontWeight: FontWeight.w700

           ),
           decoration: InputDecoration(
             filled: true,
             hintText: "Search",
             fillColor: Color(0xffe5e9f2),
           ),
           textAlign: TextAlign.center,
         ),
       ),
      ),
      drawer: new Container(
        constraints: new BoxConstraints.expand(
          width: MediaQuery.of(context).size.width - 150,
        ),
        color: Colors.white,
        alignment: Alignment.center,
        child:
        new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
                padding: const EdgeInsets.all(0),
                child:
                new UserAccountsDrawerHeader(
                  accountName: new Text('$USER_NAME', style: TextStyle(
                      color: Colors.white
                  ),), accountEmail: new Text('$USER_EMAIL', style: TextStyle(
                    color: Colors.white
                ),),
                  currentAccountPicture: Image.asset('assets/images/logo.jpg'),
                  decoration: new BoxDecoration(
                    color: Theme.of(context).accentColor,
                  ),),
                decoration: new BoxDecoration(
                    color: Theme.of(context).accentColor,
                )
            ),
            new ListTile(
                leading: new Icon(Icons.home),
                title: new Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: new Icon(Icons.shopping_cart),
                title: new Text("Cart"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> Cart()));
                }),
            new ListTile(
                leading: new Icon(Icons.call_missed_outgoing),
                title: new Text("Delivery"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>Delivery()));
                }),
            new ListTile(
                leading: new Icon(Icons.category),
                title: new Text("Categories"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> CategorySelect()));
                }),
            new ListTile(
                leading: new Icon(Icons.rotate_90_degrees_ccw),
                title: new Text("Logout"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> Login()
                  ));
                }),


          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items:[
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite_border),
            title: new Text("$USER_NAME"),
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

      //there are serveral variants of Gridview
      //GridView.builder
      body: Padding(
        padding: const EdgeInsets.only(top: 0,left: 10,right: 10,bottom: 10),
        child: Column(
          children: <Widget>[


             SizedBox(height: 5,),
             Divider(
               color: Color(0xff909db1),
               height: 15,

             ),
             Padding(
               padding: const EdgeInsets.only(left: 15,right: 15.0),
               child: Row(
                 children: <Widget>[
                   Expanded(
                     child: RaisedButton(
                       color: Color(0xff8190a5),
                       onPressed: () {  },
                       child: Text("Self Collect",
                       style: TextStyle(
                       color: Colors.white,
                         fontWeight: FontWeight.w600,
                         fontSize: 20.0,
                       ),
                       ),
                     ),
                   ),
                   Expanded(
                     child: OutlineButton(
                       color: Color(0xff8190a5),
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(
                             builder: (context) => Delivery()
                         ));
                       },
                       child: Text("Delivery",
                       style: TextStyle(
                         color: Color(0xff8190a5),
                         fontSize: 20.0,
                         fontWeight: FontWeight.w600
                       ),
                       ),
                     ),
                   )
                 ],
               ),
             ),
            SizedBox(height: 15),
            Expanded(
              child: Container(
                child: GridView(
                  padding: EdgeInsets.only(top: 0,left: 15.0,right: 15.0,bottom: 0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //crossAxisCount: The number of children in the cross axis.
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                  ),
                  //specify the list of children for the grid
                  children: <Widget>[
                    _buildContainer1(),
                    _buildContainer2(),
                    _buildContainer3(),
                    _buildContainer(),
                  ],
                  //specify direction in which it scrolls (horizontal or vertical).
                  //scrollDirection: Axis.horizontal,
                ),

              ),

            ),

            Padding(
              padding: const EdgeInsets.only(right:15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Cart()
                      ));
                    },
                    color: Color(0xff47525e),
                    child: Text("Add to cart",
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer1() {
    return FittedBox(
      fit: BoxFit.fill,
      child: Container(
        child: Image.asset('assets/images/p1.jpg'),
      ),
    );
  }
}
Widget _buildContainer2() {
  return FittedBox(
    fit: BoxFit.fill,
    child: Container(
      child: Image.asset('assets/images/p2.jpg'),
    ),
  );
}
Widget _buildContainer3() {
  return FittedBox(
    fit: BoxFit.fill,
    child: Container(

      child: Image.asset('assets/images/p3.jpg'),
    ),
  );
}
Widget _buildContainer() {
  return FittedBox(
    fit: BoxFit.fill,
    child: Container(

     child: Image.asset('assets/images/p3.jpg'),
    ),
  );
}
