import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext buildContext)
  {
    final imageUrl = 'https://propakistani.pk/wp-content/uploads/2022/03/Shahid-Afridi-1.jpg';
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 7,
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Shams Afridi"),
                  accountEmail: Text("afridi30@gmail.com"),
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    // boxShadow: [
                    //   BoxShadow(
                    //     spreadRadius: 0.5, offset: Offset(1,1), blurRadius: 0.5, blurStyle: BlurStyle.inner,
                    //   ),
                    // ],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(7),
                    backgroundBlendMode: BlendMode.lighten,
                    // gradient: LinearGradient(
                    //   colors: [ Colors.black87, Colors.indigoAccent ],
                    // ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
            ),

            ListTile(
              leading: Icon(Icons.home, color: Colors.white,),

              title: Text("Home", textScaleFactor: 1.3 , style: TextStyle( fontSize: 15, color: Colors.white ),),
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.white,),

              title: Text("Profile", textScaleFactor: 1.3 , style: TextStyle( fontSize: 15, color: Colors.white ),),
            ),
            ListTile(
              leading: Icon(Icons.email_outlined, color: Colors.white,),

              title: Text("Email", textScaleFactor: 1.3 , style: TextStyle( fontSize: 15, color: Colors.white ),),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.circleInfo, color: Colors.white,),

              title: Text("About Us", textScaleFactor: 1.3 , style: TextStyle( fontSize: 15, color: Colors.white ),),
            ),
          ],
        ),
      ),
    );
  }
}