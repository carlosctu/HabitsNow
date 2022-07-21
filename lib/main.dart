import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presenter/core/colors.dart';
import 'presenter/home/habits/state/provider/habits_provider.dart';
import 'presenter/home/sidebar/widgets/navigation_provider.dart';
import 'presenter/home/task/provider/task_provider.dart';
import 'presenter/home/task/task.dart';
import 'presenter/widgets/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
          child: const TaskPage(),
        ),
        ChangeNotifierProvider<TaskProvider>(
          create: (context) => TaskProvider(),
        ),
        ChangeNotifierProvider<HabitsProvider>(
          create: (context) => HabitsProvider(),
        ),
      ],
      child: MaterialApp(
        color: AppColors.backgroundPage,
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: "Main Page",
        home: const SplashPage(),
      ),
    ),
  );
}

// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override

//   // ignore: library_private_types_in_public_api
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) => buildPages();

//   Widget buildPages() {
//     final provider = Provider.of<NavigationProvider>(context);
//     final navigationItem = provider.navigationItem;

//     switch (navigationItem) {
//       case NavigationItem.home:
//         return const HomePage();
//       case NavigationItem.categories:
//         return const HomePage();
//       case NavigationItem.customize:
//         return const HomePage();
//       case NavigationItem.configurations:
//         return const HomePage();
//       case NavigationItem.becomePremium:
//         return const BePremium();
//       case NavigationItem.rateUs:
//         return const RateOurApp();
//       case NavigationItem.contactUs:
//         return const HomePage();
//     }
//   }
// }
