import 'dart:convert';
import 'dart:async';
import 'dart:core';
import 'package:excapade_app/screens/products.dart';
import 'package:excapade_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:validate/validate.dart';
import 'package:excapade_app/theme/theme.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:http/http.dart' as http;

class CategorySelect extends StatefulWidget {
  @override
  _CategorySelect createState() => _CategorySelect();
}

class _CategorySelect extends State<CategorySelect> {
  @override
  String _myActivity;
  String _myActivityResult;
  final String url = "https://vast-mountain-83181.herokuapp.com";

  //Category Fetch
  List data = List(); //edited line
  String _mySelection;//edited line
  //Sub category fetch
  List sub_data = List();
  String sub_mySelection;
  // Dishes fetch
  List dish_data=List();
  String dish_mySelection;

  var cat_value="1";

  Future<String> getSubCategory(cat_value) async {
    var res = await http.get(
        Uri.encodeFull(url+"/api/v1/category/child/$cat_value"),
        headers:
        {
          "Accept": "application/json"
        }
    );
    var resBody = json.decode(res.body);

    setState(() {
      sub_data = resBody['data'];
    });
    print(resBody);
    return "Sucess";
  }
  Future<String> getCategory() async {
    var res = await http.get(
        Uri.encodeFull(url+"/api/v1/category/"),
        headers:
        {
          "Accept": "application/json"
        }
        );
    var resBody = json.decode(res.body);

      setState(() {
        data = resBody['data'];
      });
      print(resBody);
      return "Sucess";
    }

  Future<String> getDishes() async {
    var res = await http.get(
        Uri.encodeFull(url+"/api/v1/dishes/"),
        headers:
        {
          "Accept": "application/json"
        }
    );
    var resBody = json.decode(res.body);

    setState(() {
      dish_data = resBody['data'];
    });
    print(resBody);
    return "Sucess";
  }


  @override
  void initState() {
    super.initState();
    this.getCategory();
    this.getSubCategory(cat_value);
    this.getDishes();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            items:[
              BottomNavigationBarItem(
                icon: new Icon(Icons.favorite_border),
                title: new Text('Orders'),
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
        body: Container(
            child: Column(
                children: <Widget>[
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Choose Category",
                        style: TextStyle(
                            color: Color(0xff3c4858),
                            fontSize: 40.0,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Category",
                        style: TextStyle(
                            color: Color(0xff3c4858),
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        child: new DropdownButton(
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Theme.of(context).accentColor
                          ),
                          hint: new Text("Select.."),
                          items: data.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item['name'],
                              style: TextStyle(
                                color: Theme.of(context).accentColor
                              ),),
                              value: item['id'].toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              _mySelection = newVal;

                            });
                          },
                          value: _mySelection,
                        ),

                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Subcategory",
                            style: TextStyle(
                                color: Color(0xff3c4858),
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: new DropdownButton(
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Theme.of(context).accentColor
                          ),
                          hint: new Text("Select.."),
                          items: sub_data.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item['name'],
                                style: TextStyle(
                                    color: Theme.of(context).accentColor
                                ),),
                              value: item['id'].toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              sub_mySelection = newVal;
                            });
                          },
                          value: sub_mySelection,
                        ),

                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Dishes",
                            style: TextStyle(
                                color: Color(0xff3c4858),
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: new DropdownButton(
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Theme.of(context).accentColor
                          ),
                          hint: new Text("Select.."),
                          items: dish_data.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item['name'],
                                style: TextStyle(
                                    color: Theme.of(context).accentColor
                                ),),
                              value: item['id'].toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              dish_mySelection = newVal;
                            });
                          },
                          value: dish_mySelection,
                        ),

                      ),
                    ],
                  ),
                       SizedBox(
                         height: 10.0,
                       ),
                        RaisedButton(
                        onPressed: (){},
                          color: Color(0xff47525e),
                          child: Text("Submit",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                          ),

                          ),

                ],

                    ),
                  ),
    );

  }
}
