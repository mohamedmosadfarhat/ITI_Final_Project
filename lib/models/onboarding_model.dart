class OnBoardingModel {
  String image;
  String title;
  String desc;

   OnBoardingModel({required this.image,required this.title, required this.desc});
}


List<OnBoardingModel> content = [
  OnBoardingModel(
      image: 'assets/images/onboarding1.jpg',
      title: 'Buy from Brands',
      desc: 'Discover, buy your favorite brands anywhere now'),
  OnBoardingModel(
      image: 'assets/images/enjoy_watching.jpg',
      title: 'Enjoy Shopping',
      desc: 'Indulge in the latest fashion trends anywhere '),
  OnBoardingModel(
      image: 'assets/images/finish1.png',
      title: 'Finish',
      desc: 'get started now and order directly from the application'),

];