import 'package:flutter/material.dart';

class HabitsPage extends StatefulWidget {

  const HabitsPage({ Key? key }) : super(key: key);

  @override
  State<HabitsPage> createState() => _HabitsPageState();
}

class _HabitsPageState extends State<HabitsPage> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
        backgroundColor:  Color.fromARGB(255, 16, 16, 16),          
           body: Container(child: Column(
             children: [
               Text('habitos'),
             ],
           ),),
       );
  }


}