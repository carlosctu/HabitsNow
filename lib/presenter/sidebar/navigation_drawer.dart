import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/colors.dart';
import '../widgets/alert_box_bepremium.dart';
import '../db/pages/reviews_page.dart';
import '../db/widgets/rate_us_alert_box.dart';
import '../configuration/configuration_page.dart';
import 'widgets/header_sidebar.dart';
import 'widgets/navigation_item.dart';
import 'widgets/sidebar_item_builder.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  late DateFormat dateFormat;
  late DateFormat timeFormat;
  late DateFormat dayFormat;
  void openUrl() async {
    const number = '5547988608094';
    try {
      await launch(
        'https://wa.me/$number?text=Testando123',
      );
    } catch (e) {
      if (kDebugMode) {
        print('Deu erro $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('pt_BR');
    dayFormat = DateFormat.EEEE('pt_BR');
  }

  var dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) => Drawer(
        width: MediaQuery.of(context).size.width / 1.4,
        child: Container(
          color: AppColors.backgroundPage,
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: HeaderSideBar(
                      dayFormat: dayFormat,
                      dateTime: dateTime,
                      dateFormat: dateFormat,
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildSideBarItem(context,
                      item: NavigationItem.home,
                      text: 'Início',
                      icon: Icons.home_outlined,
                      onClicked: () {}),
                  buildSideBarItem(context,
                      item: NavigationItem.categories,
                      text: 'Categorias',
                      icon: Icons.category_outlined,
                      onClicked: () {}),
                  Container(
                    height: 12,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white12,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  buildSideBarItem(
                    context,
                    item: NavigationItem.configurations,
                    text: 'Configurações',
                    icon: Icons.tune_outlined,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConfigurationPage(),
                        ),
                      );
                    },
                  ),
                  Container(
                    height: 12,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white10,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  buildSideBarItem(
                    context,
                    item: NavigationItem.becomePremium,
                    text: 'Obtenha Premium',
                    icon: Icons.verified_outlined,
                    onClicked: () {
                      BePremium alert = const BePremium();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                  ),
                  buildSideBarItem(
                    context,
                    item: NavigationItem.rateUs,
                    text: 'Avalie o aplicativo',
                    icon: Icons.rate_review_outlined,
                    // ignore: avoid_print
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RateUsAlexBox(),
                        ),
                      );
                    },
                  ),
                  buildSideBarItem(
                    context,
                    item: NavigationItem.customize,
                    text: 'Reviews',
                    icon: Icons.reviews_outlined,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReviewsPage(),
                        ),
                      );
                    },
                  ),
                  buildSideBarItem(
                    context,
                    item: NavigationItem.contactUs,
                    text: 'Contate-nos',
                    icon: Icons.report_outlined,
                    onClicked: () {
                      openUrl();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
