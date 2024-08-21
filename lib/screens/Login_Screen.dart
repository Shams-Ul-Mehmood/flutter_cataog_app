import 'package:catalog_app/screens/Home_Screen.dart';
import 'package:catalog_app/utils/Our_Screens_Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget
{
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
{
  String userName = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();

  void moveToHome(BuildContext buildContext) async {
   if( _formKey.currentState!.validate() ) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1),);
      await Navigator.push(
          context, MaterialPageRoute(builder: (buildContext) => HomeScreen()));
      setState(() {
        changeButton = false;
      });
     }
  }

  @override
  Widget build(BuildContext buildContext)
  {
    return Material(
      // color: Colors.white,
      color: buildContext.canvasColor,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                children: [
                  Container( width: 900, height: 350, child: Image.asset("assets/images/hey_welcome.png",fit: BoxFit.fill,), ),
                ],
              ),
              SizedBox(height: 10,),
              Text("Welcome $userName", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black87 ),),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        focusColor: Colors.black87,
                        labelText: "Username",
                        hintText: "Enter Username",
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if( value!.isEmpty )
                          {
                            return "Username is required";
                          }
                        return null;
                      },
                      controller: userNameController,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.left,
                      spellCheckConfiguration: SpellCheckConfiguration(misspelledSelectionColor: Colors.red, spellCheckService: DefaultSpellCheckService()),
                      scrollPhysics: ScrollPhysics(),
                      selectionControls: MaterialTextSelectionControls(),
                      magnifierConfiguration: TextMagnifierConfiguration(),
                      enableInteractiveSelection: true,
                      textDirection: TextDirection.ltr,
                      mouseCursor: MouseCursor.defer,
                      clipBehavior: Clip.antiAlias,
                      autofocus: true,
                      // focusNode: _userNameFocusNode,
                      scribbleEnabled: true,
                      enabled: true,
                      autocorrect: true,
                      cursorErrorColor: Colors.red,
                      cursorOpacityAnimates: true,
                      showCursor: true,
                      autovalidateMode: AutovalidateMode.always,
                      smartQuotesType: SmartQuotesType.enabled,
                      onChanged: (value) {
                        userName = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        focusColor: Colors.black87,
                        labelText: "Password",
                        hintText: "Enter Password",
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.lock),
                      ),
                      // focusNode: _userPasswordFocusNode,
                      obscureText: true,
                      validator: (value){
                        if( value!.isEmpty )
                          {
                            return "Password is required";
                          }
                        else if( value.length < 8 )
                          {
                            return "Password length should be at least 8 characters";
                          }
                        return null;
                      },
                    ),
                    SizedBox(height: 35,),
                    // ElevatedButton(
                    //     onPressed: (){
                    //       setState(() {
                    //         changeButton = true;
                    //       });
                    //       // Navigator.push(context, MaterialPageRoute(builder: (buildContext) => HomeScreen() ));
                    //       // Navigator.pushNamed(context, ScreensRoutes.homeRoute);
                    //     },
                    //     child: changeButton ? Icon(Icons.done, color: Colors.white,) : Text("Login", style: TextStyle(fontSize: 15, color: Colors.white),),
                    //     style: TextButton.styleFrom(elevation: 8, minimumSize: Size(150, 50),),
                    //   ),

                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular( changeButton? 50 : 8),
                      child:
                      InkWell(  // InkWell-Widget use to make a clickable widget.
                        onTap: () => moveToHome(buildContext),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: Center(child: changeButton ? Icon(Icons.done, color: Colors.white,) : Text("Login", style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white, ),)),
                          //decoration: BoxDecoration(
                           // color: Colors.deepPurple,
                            // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                            // borderRadius: BorderRadius.circular( changeButton? 50 : 8),
                          //),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}