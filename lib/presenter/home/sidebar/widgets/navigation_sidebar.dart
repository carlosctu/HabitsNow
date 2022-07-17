import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:habits_now_app/presenter/home/sidebar/widgets/contact_us_page.dart';
import 'package:habits_now_app/presenter/home/sidebar/widgets/premium_page.dart';
import 'package:habits_now_app/presenter/home/sidebar/widgets/rate_app_page.dart';
import 'package:flutter/material.dart';

import '../../home_page.dart';

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      // Inicio
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
      break;
    case 1:
      // Categorias
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
      break;
    case 2:
      // Personalizar
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
      break;
    case 3:
      // Configurações
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
      break;
    case 4:
      // Obtenha Premium
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const PremiumPage(),
        ),
      );
      break;
    case 5:
      // Avalie nosso App
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const RateAppPage(),
        ),
      );
      break;
    case 6:
      // Contacte-nos
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Contactus(),
        ),
      );
      break;
    default:
  }
}
