import 'package:excapade_app/screens/products.dart';
import 'package:excapade_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:validate/validate.dart';
import 'package:excapade_app/theme/theme.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        //_myActivityResult = _myActivity;
      });
    }
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
                  "Delivery",
                  style: TextStyle(
                    color: Color(0xff3c4858),
                    fontSize: 40.0,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.all(16),
              color: Colors.transparent,
              child: DropDownFormField(
                titleText: 'Outlets',
                hintText: 'Select...',
                value: _myActivity,
                onSaved: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                dataSource: [
                  {
                    "display": "One Riverside",
                    "value": "Running",
                  },
                  {
                    "display": "Region Square 2",
                    "value": "region square 2",
                  },
                  {
                    "display": "Gadong",
                    "value": "gadong",
                  },


                ],
                textField: 'display',
                valueField: 'value',
              ),

            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: <Widget>[
                  Text(
                    "Your address:",
                    style: TextStyle(
                      color: Color(0xff3c4858),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Unit: 6, 2nd Floor, Block A \nWarisan Mata-Mata Complex Gadong",

                    style: TextStyle(
                      color: Color(0xff3c4858),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Color(0xff3c4858),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: <Widget>[
                  Text(
                    "Remark:",
                    style: TextStyle(
                        color: Color(0xff3c4858),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Ring the door bell when arrive",

                    style: TextStyle(
                      color: Color(0xff3c4858),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Color(0xff3c4858),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){},
                    color: Color(0xff3c4858),
                    child: Text("Submit",
                    style: TextStyle(
                      color: Colors.white
                    ),),
                  )
                ],
              ),
            ),
          ]
    )
      )
    );
  }
}
