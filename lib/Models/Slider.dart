class SliderModel{
  String image;
  String title1,title2, subTitle1,subTitle2;
  SliderModel(this.title1,this.title2,this.subTitle1,this.subTitle2,this.image);
}
List sliders =[
SliderModel('Welcome to', 'Workout Fitness App', 'Reference site about lorem', 'llpuim, goinginformation origins', 'assets/Images/1.PNG'),
SliderModel('Unlimited', ' Fitness Course','Reference site about lorem', 'llpuim, goinginformation origins','assets/Images/2.PNG'),
SliderModel('Save Money', ' Get GYM Membership','Reference site about lorem', 'llpuim, goinginformation origins','assets/Images/3.PNG'),
];

class Workout{
  String rate,time,kcl,title;
  String image;
  Workout(this.rate,this.time,this.kcl,this.title,this.image);
}
List workouts =[
Workout('4.8','12 min','120 Kcal','Push ypur Body','assets/Images/one.PNG'),
Workout('4.5','45 min','350 Kcal','Body Building','assets/Images/two.PNG'),
Workout('1.5','42 min','330 Kcal','Body Building','assets/Images/three.PNG'),
Workout('1.5','42 min','330 Kcal','Body Building', 'assets/Images/four.PNG'),
Workout('1.5','42 min','330 Kcal','Body Building', 'assets/Images/five.PNG'),
Workout('1.5','42 min','330 Kcal','Body Building', 'assets/Images/six.PNG'),
Workout('1.5','42 min','330 Kcal','Body Building', 'assets/Images/seven.PNG'),
];


