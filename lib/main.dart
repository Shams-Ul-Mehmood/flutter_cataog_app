import 'package:catalog_app/core/Store.dart';
import 'package:catalog_app/screens/Cart_Screen.dart';
import 'package:catalog_app/screens/Home_Detail_Screen.dart';
import 'package:catalog_app/screens/Home_Screen.dart';
import 'package:catalog_app/screens/Login_Screen.dart';
import 'package:catalog_app/utils/Our_Screens_Routes.dart';
import 'package:catalog_app/widgets/Catalog_Themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(
      // store: VxState.store,
      store: My_Store(),
      child: Catalog_App()));
}

class Catalog_App extends StatelessWidget
{
  @override
  Widget build(BuildContext buildContext)
  {
    return MaterialApp(
      title: "Catalog App",
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      themeAnimationCurve: Easing.emphasizedDecelerate,
      themeAnimationDuration: Duration(seconds: 2),
      themeAnimationStyle: AnimationStyle(
        duration: Duration(seconds: 2),
        reverseDuration: Duration(seconds: 2),
        curve: Curves.easeInCubic,
        reverseCurve: Curves.elasticInOut,
      ),
      theme: Catalog_Themes.catalogLightThemeData(buildContext),
      themeMode: ThemeMode.system,
      darkTheme: Catalog_Themes.catalogDarkThemeData(buildContext),
      // routeInformationParser: VxInformationParser(),

      // home: LoginScreen(),
      // routes attribute use for pages or screens navigation
      initialRoute: ScreensRoutes.loginRoute,
      // initialRoute: "/",
      routes: {
        // "/": (buildContext) => LoginScreen(),
        ScreensRoutes.homeRoute : (buildContext) => HomeScreen(),
        ScreensRoutes.loginRoute : (buildContext) => new LoginScreen(),
       // ScreensRoutes.homeDetailRoute : (buildContext) => new HomeDetailScreen(catalogItem: catalogItem),
        ScreensRoutes.cartRoute : (buildContext) => new Cart_Screen(),
      },
    );
  }
}