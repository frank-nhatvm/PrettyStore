import 'package:cupertinostore/backdrop.dart';
import 'package:cupertinostore/category_menu_page.dart';
import 'package:cupertinostore/model/product.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'colors.dart';

class SmallHouseApp extends StatefulWidget {
  @override
  _SmallHouseAppState createState() => _SmallHouseAppState();
}

class _SmallHouseAppState extends State<SmallHouseApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category){
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _kSmallHouseTheme,
      title: 'SmallHouse',
      home: Backdrop(
        currentCategory: Category.all,
        frontLayer: HomePage(category: _currentCategory,),
        backLayer: CategoryMenuPage(currentCategory: _currentCategory,onCategoryTap: _onCategoryTap,),
        frontTitle: Text('SmallHouse'),
        backTitle: Text('Menu'),
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings){
    if(settings.name != '/login'){
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true
    );

  }
}
final ThemeData _kSmallHouseTheme = _buildCustomTheme();

ThemeData _buildCustomTheme(){
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kShrinePink100,
      colorScheme: base.colorScheme.copyWith(
        secondary: kShrineBrown900,
      ),
    ),
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(
        color: kShrineBrown900
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrineBrown900,
        ),
      ),
      border: OutlineInputBorder(),
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline5: base.headline5.copyWith(
      fontWeight: FontWeight.w500,
    ),
    headline6: base.headline6.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    bodyText1: base.bodyText1.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}