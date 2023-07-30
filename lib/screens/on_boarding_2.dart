import 'package:ecommerce/models/onboarding_model.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:iti_final_project/models/onboarding_model.dart';
// import 'package:iti_final_project/screens/login.dart';

class onBoarding2 extends StatefulWidget {
  const onBoarding2({Key? key}) : super(key: key);

  @override
  State<onBoarding2> createState() => _onBoarding2State();
}

class _onBoarding2State extends State<onBoarding2> {
  int currentIndex = 0;
 late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index){
                setState(() {
                  currentIndex = index;
                });
              },
                itemCount: content.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        ClipOval(
                            child: Image.asset(
                          content[index].image,
                          height: 300,
                        )),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          content[index].title,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          content[index].desc,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                List.generate(
                    content.length, (index) => buildDot(index, context))
              ,
            ),
          ),
          Container(
            height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Theme.of(context).primaryColor
              ),
               margin: EdgeInsets.all(40),
             width: double.infinity,
            child: MaterialButton(
              child: Text(currentIndex == content.length -1 ? 'Get Started' :'Next',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
              onPressed: (){
                if(currentIndex == content.length-1){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => Login()));
                }
                _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              // color: Theme.of(context).primaryColor

            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index,BuildContext context) {
    return Container(
                height: 10,
                width: currentIndex == index ? 25 : 10,
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
              );
  }
}
