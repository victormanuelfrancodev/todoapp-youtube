
import 'package:flutter/material.dart';
import 'package:todo_app_youtube/todo/provider/theme_provider.dart';

class ThemeProviderWidget extends StatefulWidget {

  final Widget child;
  const ThemeProviderWidget({super.key, required this.child});

  @override
  State<ThemeProviderWidget> createState() => _ThemeProviderWidgetState();
}

class _ThemeProviderWidgetState extends State<ThemeProviderWidget> {

  ThemeApp themeApp = ThemeApp.light;

  onChangeTheme(ThemeApp newTheme){
    setState(() {
      themeApp = newTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(themeApp: themeApp, onChangeTheme: onChangeTheme, child: widget.child);
  }
}