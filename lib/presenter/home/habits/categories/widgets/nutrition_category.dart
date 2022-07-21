import 'package:flutter/material.dart';

class NutritionCategory extends StatelessWidget {
  const NutritionCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          Column(children: [
            Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 49, 49, 49),
                  borderRadius: BorderRadiusDirectional.circular(16),
                ),
                child: const Icon(
                  Icons.restaurant_menu_rounded,
                  size: 50,
                  color: Color.fromARGB(255, 218, 195, 25),
                )),
            const Text(
              'Saúde',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              '0 entradas',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                color: Color.fromARGB(255, 128, 128, 128),
                fontWeight: FontWeight.w600,
              ),
            )
          ]),
        ],
      ),
    );
  }
}
