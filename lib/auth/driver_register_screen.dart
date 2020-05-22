import 'package:flutter/material.dart';
import 'package:taxi_uber/themes/mainTheme.dart';
import 'package:taxi_uber/utils/shared_widgets.dart';

class DriverRegisterScreen extends StatefulWidget {
  DriverRegisterScreen({Key key}) : super(key: key);

  @override
  _DriverRegisterScreenState createState() => _DriverRegisterScreenState();
}

class _DriverRegisterScreenState extends State<DriverRegisterScreen> {
  var _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _confirmPassword;
  String _manufacture;
  String _modelCar;
  String _modelYear;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  TextEditingController _manufactureController = TextEditingController();
  TextEditingController _modelCarController = TextEditingController();
  TextEditingController _modelYearController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _manufactureController.dispose();
    _modelCarController.dispose();
    _modelYearController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Flexible(
                  child: PageView(
               children: <Widget>[
              _userNamePage(context),
                   ],
                   
                    ),
            ),
          ],
        ),
            ),
          );
        }



      
  Widget _userNamePage(  context) {
         return   Padding(
           padding: const EdgeInsets.all(24.0),
           child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 75,
                  ),
                  TextFormField(
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: fontWidgetSize.bodyFontSize),
                    decoration: InputDecoration(
                      hintText: "email",
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: fontWidgetSize.bodyFontSize),
                    decoration: InputDecoration(
                      hintText: "password",
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: fontWidgetSize.bodyFontSize),
                    decoration: InputDecoration(
                      hintText: "confirm password",
                    ),
                  ), 
            
                  Row(
                    children: <Widget>[
                      Text(
                        'Already Member?',
                        style: TextStyle(
                            color: Color(0xFF8A8A8A),
                            fontSize: fontWidgetSize.bodyFontSize - 2,
                            fontFamily: 'SFPro'),
                      ),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      FlatButton(
                        child: Text(
                          'SignIn',
                          style: TextStyle(
                              color: mainTheme.primaryColorDark,
                              fontSize: fontWidgetSize.bodyFontSize,
                              fontFamily: 'SFPro'),
                        ),
                        onPressed: () {
                         //TODO go to next
                        },
                      )
                    ],
                  ),
                 registerButton(context, 'Sign p',null),
                ],),
         );
          
  
       }
}
