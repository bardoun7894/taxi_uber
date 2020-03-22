import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_uber/auth/client_register_sceen.dart';
import 'utils/welcome.dart';
import 'homePage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool seen = sharedPreferences.getBool("seen");
  Widget homeScreen = HomePage();
   if(seen ==null || !seen){
     homeScreen=WelcomePage();
       }else{

   String UserId=sharedPreferences.getString('user_id');
         
         if(UserId==null|| UserId==''){
          
          homeScreen=ClientRegisterScreen();
             }

       }
   runApp(Wssalni(homeScreen));
     }
class Wssalni extends StatelessWidget {
  final Widget homeScreen;
  Wssalni(this.homeScreen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: this.homeScreen,
    );
  }
}
