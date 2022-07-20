import 'package:flutter/material.dart';
import '../../core/colors.dart';
import 'widgets/navigation_item.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/alert_box_bepremium.dart';
import 'widgets/alex_box_rateourapp.dart';
import 'widgets/header_sidebar.dart';
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
                  const SizedBox(height: 18),
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
                  const Divider(
                    height: 40,
                    color: Colors.white70,
                  ),
                  buildSideBarItem(context,
                      item: NavigationItem.customize,
                      text: 'Personalizar',
                      icon: Icons.color_lens_outlined,
                      onClicked: () {}),
                  buildSideBarItem(context,
                      item: NavigationItem.configurations,
                      text: 'Configurações',
                      icon: Icons.tune_outlined,
                      onClicked: () {}),
                  const Divider(
                    height: 30,
                    color: Colors.white70,
                  ),
                  buildSideBarItem(context,
                      item: NavigationItem.becomePremium,
                      text: 'Obtenha Premium',
                      icon: Icons.verified_outlined, onClicked: () {
                    BePremium alert = const BePremium();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }),
                  buildSideBarItem(context,
                      item: NavigationItem.rateUs,
                      text: 'Avalie o aplicativo',
                      icon: Icons.rate_review,
                      // ignore: avoid_print
                      onClicked: () {
                    RateOurApp alert = const RateOurApp();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }),
                  buildSideBarItem(context,
                      item: NavigationItem.contactUs,
                      text: 'Contate-nos',
                      icon: Icons.report_outlined, onClicked: () {
                    _openWhatsAppChat();
                  }),
                ],
              ),
            ],
          ),
        ),
      );

  void _openWhatsAppChat() async {
    String phoneNumber = '5547988608094';
    var url = 'https://wa.me/$phoneNumber?';
// ignore: deprecated_member_use
    await launch(url);
  }
}
