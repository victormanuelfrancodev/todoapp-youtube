
import 'package:flutter/widgets.dart';

enum ThemeApp { light, dark }

class ThemeProvider extends InheritedWidget{

  Widget child;
  ThemeApp themeApp;
  Function(ThemeApp) onChangeTheme;  

  ThemeProvider({required this.child, required this.themeApp, required this.onChangeTheme}) : super(child: child);


  static ThemeProvider of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return oldWidget.themeApp != themeApp;
  }
  
}