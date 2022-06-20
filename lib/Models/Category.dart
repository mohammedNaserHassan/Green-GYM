import 'package:flutter/material.dart';
class CategoryModel{
  IconData? iconData;
  String? title;
  Color? color;
  CategoryModel({this.iconData,this.title,this.color});
}
List<CategoryModel> categories=[
  CategoryModel(iconData: Icons.person_rounded,title: "Information",color: Colors.teal),
  CategoryModel(iconData: Icons.local_fire_department ,title: "Calories",color: Colors.orange),
CategoryModel(iconData: Icons.heart_broken_sharp,title: "Hear",color: Colors.pink),
CategoryModel(iconData: Icons.local_hospital,title: "cardiorespiratory endurance",color: Colors.green),
CategoryModel(iconData: Icons.local_bar,title: "strength",color: Colors.blue),
CategoryModel(iconData: Icons.local_cafe,title: "endurance",color: Colors.red),
CategoryModel(iconData: Icons.local_atm,title: "cardiovascular",color: Colors.yellow),
CategoryModel(iconData: Icons.local_drink,title: "respiratory",color: Colors.purple),
CategoryModel(iconData: Icons.local_dining,title: "cardiovascular",color: Colors.brown),
CategoryModel(iconData: Icons.local_drink,title: "respiratory",color: Colors.grey),
CategoryModel(iconData: Icons.local_drink,title: "respiratory",color: Colors.black),
CategoryModel(iconData: Icons.local_drink,title: "respiratory",color: Colors.blue),

];