class Features{
  String image;
  String title;
  String desc;

  Features({required this.image,required this.title, required this.desc});
}

List<Features> features = [
  Features(image: 'images/about_app/scroll.jpg', title: 'Find and Discover fashion trends',
      desc: 'The app\'s smooth scrolling ensures effortless browsing and discovery of a vast variety of clothes and fashion trends'),
  Features(image: 'images/about_app/shopping.jpg', title: 'Enjoy and Buy from brands',
      desc: 'Experience delight purchasing quality products from renowned and trusted brands'),
  Features(image: 'images/about_app/add_to_cart.jpg', title: 'Add products to your cart and pay later',
      desc: 'Seamlessly add items, defer payment until checkout for your convenience'),
  Features(image: 'images/about_app/rate.jpg', title: 'Rate Different products and give your feedback',
      desc: 'Provide valuable feedback by rating and reviewing diverse product selections')




];