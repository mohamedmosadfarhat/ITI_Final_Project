import 'package:ecommerce/screens/place_holder.dart';
import 'package:flutter/material.dart';
//import 'package:iti_final_project/screens/place_holder.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPassword = true;
  var emailController = TextEditingController();
  var firstNAme = TextEditingController();
  var lastName = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xfffda778),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
           Column(
             children: [
               Container(
                 color: Colors.white,
                 child: SizedBox(
                   height: MediaQuery.of(context).size.height*0.35,
                 ),
               ),
               Container(
                 height: MediaQuery.of(context).size.height *0.65,
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   borderRadius:BorderRadius.only(
                     topLeft: Radius.circular(50.0),
                     topRight: Radius.circular(50.0)
                   ),
                   color: Color(0xfffee8dc)
                 ),
               )
             ],
           ),
            Container(

              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                      children: [
                        SizedBox(height: 50.0,),
                    ClipOval(
                      child: Image(
                          height: 200.0,
                          width: 200.0,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/login1.jpg')),
                    ),
                    SizedBox(height: 70.0,),
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Color(0xffDA4C2D),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffDA4C2D)),),
                            labelText: 'First Name',
                            border: OutlineInputBorder(),
                          ),
                          cursorColor: Color(0xfffed8c3),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          controller: firstNAme,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                        width: 5.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          cursorColor: Color(0xfffed8c3),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Color(0xffDA4C2D),

                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffDA4C2D)),),
                            labelText: 'Last Name',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          controller: lastName,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email address must not be empty";
                        }
                        return null;
                      },
                      cursorColor: Color(0xfffed8c3),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Color(0xffDA4C2D),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffDA4C2D)),),
                        labelText: 'Email Address',
                        border: OutlineInputBorder(),
                        prefixIcon:
                        Icon(Icons.email_outlined, color: Color(0xffDA4C2D)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password must not be empty";
                          }
                          return null;
                        },
                        cursorColor: Color(0xfffed8c3),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isPassword,
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Color(0xffDA4C2D),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffDA4C2D)),),
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock_open, color: Color(0xffDA4C2D)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                              icon: Icon(
                                isPassword ? Icons.visibility : Icons.visibility_off,
                              ),
                              color: Color(0xffDA4C2D)),
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xfffc7c48)),
                      child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print(firstNAme.text);
                              print(lastName.text);
                              print(emailController.text);
                              print(passwordController.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => placeHolder()));

                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20.0, color: Colors.black),
                          )),
                    )
                  ]),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

// Container(
// color: Colors.white,
// height: MediaQuery.of(context).size.height,
// width: MediaQuery.of(context).size.width,
// padding: const EdgeInsets.all(20.0),
// child: SingleChildScrollView(
// child: Form(
// key: formKey,
// child: Column(children: [
// Image(
// height: 180.0,
// image: AssetImage('assets/images/login1.jpg')),
// SizedBox(height: 10.0,),
// Text(
// 'Register',
// style: TextStyle(
// fontSize: 30.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// SizedBox(
// height: 20.0,
// ),
// Row(children: [
// Expanded(
// child: TextFormField(
// validator: (value) {
// if (value!.isEmpty) {
// return "Required";
// }
// return null;
// },
// decoration: InputDecoration(
// labelStyle: TextStyle(
// color: Color(0xffDA4C2D),
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Color(0xffDA4C2D)),),
// labelText: 'First Name',
// border: OutlineInputBorder(),
// ),
// cursorColor: Color(0xfffed8c3),
// keyboardType: TextInputType.text,
// textInputAction: TextInputAction.next,
// controller: firstNAme,
// ),
// ),
// SizedBox(
// height: 10.0,
// width: 5.0,
// ),
// Expanded(
// child: TextFormField(
// validator: (value) {
// if (value!.isEmpty) {
// return "Required";
// }
// return null;
// },
// cursorColor: Color(0xfffed8c3),
// decoration: InputDecoration(
// labelStyle: TextStyle(
// color: Color(0xffDA4C2D),
//
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Color(0xffDA4C2D)),),
// labelText: 'Last Name',
// border: OutlineInputBorder(),
// ),
// keyboardType: TextInputType.text,
// textInputAction: TextInputAction.next,
// controller: lastName,
// ),
// ),
// ]),
// SizedBox(
// height: 10.0,
// ),
// TextFormField(
// validator: (value) {
// if (value!.isEmpty) {
// return "Email address must not be empty";
// }
// return null;
// },
// cursorColor: Color(0xfffed8c3),
// decoration: InputDecoration(
// labelStyle: TextStyle(
// color: Color(0xffDA4C2D),
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Color(0xffDA4C2D)),),
// labelText: 'Email Address',
// border: OutlineInputBorder(),
// prefixIcon:
// Icon(Icons.email_outlined, color: Color(0xffDA4C2D)),
// ),
// keyboardType: TextInputType.emailAddress,
// textInputAction: TextInputAction.next,
// controller: emailController,
// ),
// SizedBox(
// height: 10.0,
// ),
// TextFormField(
// validator: (value) {
// if (value!.isEmpty) {
// return "Password must not be empty";
// }
// return null;
// },
// cursorColor: Color(0xfffed8c3),
// keyboardType: TextInputType.visiblePassword,
// obscureText: isPassword,
// controller: passwordController,
// textInputAction: TextInputAction.next,
// decoration: InputDecoration(
// labelStyle: TextStyle(
// color: Color(0xffDA4C2D),
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Color(0xffDA4C2D)),),
// labelText: 'Password',
// border: OutlineInputBorder(),
// prefixIcon: Icon(Icons.lock_open, color: Color(0xffDA4C2D)),
// suffixIcon: IconButton(
// onPressed: () {
// setState(() {
// isPassword = !isPassword;
// });
// },
// icon: Icon(
// isPassword ? Icons.visibility : Icons.visibility_off,
// ),
// color: Color(0xffDA4C2D)),
// )),
// SizedBox(
// height: 10.0,
// ),
// SizedBox(
// height: 10.0,
// ),
// SizedBox(
// height: 20.0,
// ),
// Container(
// width: double.infinity,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(20)),
// color: Color(0xfffed8c3)),
// child: MaterialButton(
// onPressed: () {
// if (formKey.currentState!.validate()) {
// print(firstNAme.text);
// print(lastName.text);
// print(emailController.text);
// print(passwordController.text);
// }
// },
// child: Text(
// 'Sign Up',
// style: TextStyle(fontSize: 20.0, color: Colors.black),
// )),
// )
// ]),
// ),
// ),
// ),
