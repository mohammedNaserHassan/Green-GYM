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
  int id;
  String rate,time,kcl,title;
  String image;
  Workout(this.rate,this.time,this.kcl,this.title,this.image,this.id);
}
List workouts =[
  Workout('1.5','42 min','330 Kcal','Body Building', 'assets/Images/seven.PNG',0),
  Workout('4.5','45 min','350 Kcal','Body Building','assets/Images/two.PNG',1),
Workout('4.8','12 min','120 Kcal','Push ypur Body','assets/Images/one.PNG',2),
Workout('1.5','42 min','330 Kcal','Body Building','assets/Images/three.PNG',3),
Workout('1.5','42 min','330 Kcal','Body Building', 'assets/Images/four.PNG',4),
Workout('1.5','42 min','330 Kcal','Body Building', 'assets/Images/five.PNG',5),
Workout('1.5','42 min','330 Kcal','Body Building', 'assets/Images/six.PNG',6),
Workout('1.6','42 min','330 Kcal','Body Building', 'assets/Images/two.PNG',7),
Workout('6.5','42 min','330 Kcal','Body Building', 'assets/Images/six.PNG',8),
Workout('9.5','42 min','330 Kcal','Body Building', 'assets/Images/three.PNG',9),
Workout('1.5','42 min','330 Kcal','Body Building', 'assets/Images/six.PNG',10),
Workout('15.2','42 min','330 Kcal','Body Building', 'assets/Images/seven.PNG',11),
Workout('1.2','42 min','330 Kcal','Body Building', 'assets/Images/six.PNG',12),
];
List images = [
  'assets/Images/Trainings/1.gif',
  'assets/Images/Trainings/2.gif',
  'assets/Images/Trainings/3.gif',
  'assets/Images/Trainings/4.gif',
  'assets/Images/Trainings/5.gif',
  'assets/Images/Trainings/6.gif',
  'assets/Images/Trainings/7.gif',
  'assets/Images/Trainings/8.gif',
  'assets/Images/Trainings/9.gif',
  'assets/Images/Trainings/10.gif',
  'assets/Images/Trainings/11.gif',
  'assets/Images/Trainings/12.gif',
  'assets/Images/Trainings/13.gif',
];


