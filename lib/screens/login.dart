import 'package:excapade_app/screens/products.dart';
import 'package:excapade_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:excapade_app/theme/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:excapade_app/Constants.dart';


class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}


String _validateEmail(String value) {
  try {
    Validate.isEmail(value);
  } catch (e) {
    return 'Invalid email';
  }

  return null;
}

String _validatePassword(String value) {
  if (value.length < 6) {
    return 'Invalid password';
  }

  return null;
}
class _LoginData {
  String email = '';
  String password = '';
}

class _LoginState extends State<Login> {

  String loginResponse="";
  Color bResponseColor;
  Color responseColor;
  _LoginData _data = new _LoginData();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  void _showSnackBar(String text) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }
   final String url = "https://vast-mountain-83181.herokuapp.com";
    String USER_NAME;
    String USER_EMAIL;
    String AUTH_TOKEN;

   Future<Map<String, dynamic>> doLogin(String email, String password) async {
    if (this._formKey.currentState.validate()) {
        _formKey.currentState.save();
    final Map<String, dynamic> authData = {
      "email": email,
      "password": password
    };

    final http.Response response = await http.post(url+'/api/v1/login',body: json.encode(authData), headers: {"Content-Type": "application/json"});

    final Map<String, dynamic> authResponseData = json.decode(response.body);

    if (response.statusCode == 200) {
      if (authResponseData.containsKey("error")) {
        if (authResponseData["error"] == "Invalid Credentials") {
          print("Invalid Credentials");
          setState(() {
            loginResponse = "These credentials do not match our record";
            responseColor = Colors.red;
            bResponseColor = Colors.red[100];
          });

        //  return {"success": false};
        }
      }
      else {
        if(authResponseData.containsKey("user"))
        {
           USER_NAME = authResponseData["user"]["name"];
           USER_EMAIL = authResponseData["user"]["email"];
           AUTH_TOKEN = authResponseData["authToken"];
           print(AUTH_TOKEN);

        print("Login Success");
        print(USER_NAME);
        print(USER_EMAIL);
        setState(() {
          loginResponse = "Login Success";
          responseColor = Colors.green;
          bResponseColor = Colors.green[100];
        });


        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Products(USER_NAME: USER_NAME,USER_EMAIL: USER_EMAIL)
        ));
        //return {"success": true};
      }
    }

    }
    }

//    else if (response.statusCode == 200) {
//
//      return {'success': true, 'message': 'Successfuly login!'};
//    }

  }


  Widget _buildFormLogin() {
    return Form(
      key: this._formKey,
      child: Column(
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.grey),
            child: TextFormField(
              controller: _emailController,
                style: TextStyle(
                  color: Colors.grey,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
//                validator: _validateEmail,
//                onSaved: (String value) {
//                  this._data.email = value;
//                }
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.grey),
            child: TextFormField(
              controller: _passController,
                style: TextStyle(
                  color: Colors.grey,
                ),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
//                validator: _validatePassword,
//                onSaved: (String value) {
//                  this._data.password = value;
//                }
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildErrorBox() {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 15.0),
      height: 40.0,
      child: Container(
        color: bResponseColor,
        child: Center(
          child: Text(
            '$loginResponse',
            style: TextStyle(
              fontSize: 16.0,
              color: responseColor,
            ),

          ),
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 15.0),
      height: 40.0,
      child: Center(
        child: GestureDetector(
          child: Text(
            'Forgot password?',
            style: TextStyle(
              fontSize: 14.0,
              color: kMainColor,
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        color: kMainColor,
        child: Text(
          'Sign in',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        onPressed: ()
        {
          doLogin(_emailController.text,_passController.text);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(left: 50.0,right: 50.0,top: 0,bottom: 0),
            children: <Widget>[
               Image.asset("assets/images/logo.jpg"),
              _buildErrorBox(),
              SizedBox(
                height: 10.0,
              ),
              _buildFormLogin(),
              SizedBox(
                height: 20.0,
              ),
              _buildLoginButton(),
              SizedBox(
                height: 15.0,
              ),
               _buildForgotPassword(),
            ],
          ),
        ),
      ),
    );
  }
}
