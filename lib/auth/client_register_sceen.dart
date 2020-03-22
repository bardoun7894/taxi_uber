import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_uber/themes/mainTheme.dart';

class ClientRegisterScreen extends StatefulWidget {
  @override
  _ClientRegisterScreenState createState() => _ClientRegisterScreenState();
}

class _ClientRegisterScreenState extends State<ClientRegisterScreen> {
  String email;
  String password;
  String passwordConfirm;
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _passwordConfirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((sharedPref){
   sharedPref.setBool('seen', true);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Sign Up",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: Color(0xFF636363)),
        )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,bottom: 32),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 75,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "email",
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "password",
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "confirm password",
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height*.06,
               
                    width: double.infinity,
                     child: FlatButton(onPressed: ( ){   },
                   shape: RoundedRectangleBorder(
                      
                    borderRadius: BorderRadius.all(Radius.circular(16))),              
                    color: mainTheme.primaryColorDark,
                    child: Text('Sign Up',style:TextStyle(color: Colors.white)  )),
                      ),
                      ),
                
                  Center(
                    child: Row(children: <Widget>[
                     Text('Already Member?'),
                     Padding(padding: EdgeInsets.only(right: 20)),
                     FlatButton(child: Text('SignIn',style: TextStyle(color: mainTheme.primaryColorDark),), onPressed: () {},)

                    ],),
                  ),
               
                _or(context),
                 _driverButton(context)
              ],
            )),
      ),
    );
  }

  Widget _or(BuildContext context) {
    return Row(
      children: <Widget>[
       Flexible( child:  hLine(context)),
        
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('OR',style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold),),
         ),
    
       Flexible( child:  hLine(context)),
                ],
              );
            }
          
  Widget _driverButton(BuildContext context) {
   return  Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*.06,
                   child: FlatButton(onPressed: ( ){   },
               shape:  RoundedRectangleBorder(
                      
                    borderRadius: BorderRadius.all(Radius.circular(16))),              
                    color: mainTheme.primaryColorDark,
                    child: Text('Create Driver Account',style:TextStyle(color: Colors.white)  )),
                  ),
                );
            
            }
          
 Widget hLine(BuildContext context) {
              return Container(height: 1,color: Colors.grey.shade400,);
            }
}
