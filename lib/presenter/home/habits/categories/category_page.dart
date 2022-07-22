import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'widgets/nutrition_category.dart';
import 'widgets/outdoor_category.dart';

import '../../../core/colors.dart';
import '../../../widgets/custom_top_bar.dart';
import '../../habits/categories/widgets/abandoned_category.dart';
import '../../sidebar/navigation_drawer.dart';
import 'widgets/health_category.dart';
import 'widgets/meditation_category.dart';
import 'widgets/sports_category.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: const CustomTopBar(title: 'Categorias'),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categorias customizadas',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            const Text(
              '5 disponíveis',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 73, 73, 73),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.widgets_outlined,
                      size: 35,
                      color: Color.fromARGB(255, 73, 73, 73),
                    ),
                    Text(
                      'Sem categorias personalizadas',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 73, 73, 73),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Categorias padrão',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Editável para usuários premium',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 73, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.25,
                height: 100,
                enableInfiniteScroll: false,
                padEnds: false,
              ),
              items: const <Widget>[
                AbandonedCategory(),
                MeditationCategory(),
                SportsCategory(),
                HealthCategory(),
                NutritionCategory(),
                OutdoorCategory()
              ],
            ),
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15),
                color: AppColors.iconActivePage,
              ),
              height: 40,
              child: const Center(
                child: Text(
                  'NOVA CATEGORIA',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
