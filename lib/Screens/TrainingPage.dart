import 'package:flutter/material.dart';
import 'package:gym_app/Models/Slider.dart';
class TrainingPage extends StatelessWidget {
  int index;
   TrainingPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(images[index]),
        )
      ),
    );
  }
}
