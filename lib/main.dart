import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presenter/home/sidebar/widgets/navigation_provider.dart';
import 'presenter/home/sidebar/widgets/navigator_pages.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: "Main Page",
        home:  const NavigatorPages(),
      ),
    ),
  );
}
