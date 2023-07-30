import 'dart:math';

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/prvider/card_item.dart';
import 'package:ecommerce/screens/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

//int quantity=0;
class ProductInfo extends StatefulWidget {
  //const ProductInfo({ Key? key }) : super(key: key);
  static String id = "ProductInfo";

//int quantity=0;
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    var h= MediaQuery.of(context).size.height;

    List o = [];
    // int quantity=1;
    Product product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage("${product.pLocation}"),
            ),
            //======

            //======
          ),
          //=====
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * .1,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(

                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,color: basiccolor,)),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(CardItemScreen.id);
                      },
                      child: Icon(Icons.shopping_cart,color: basiccolor,)),
                ],
              ),
            ),
          ),
          //======

          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  Opacity(
                    opacity: .5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .3,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${product.pName}",
                                  style: TextStyle(
                                      fontSize:25 , fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                //Text("${product.pPrice}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w900),),
                                Text(
                                  "${product.pDescription}",
                                  style: TextStyle(
                                      fontSize: 23, fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${product.pPrice} \$",
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w900,color: Colors.black),
                                    ),
                                    // Text(
                                    //   "\$",
                                    //   style: TextStyle(
                                    //       fontSize: 20,
                                    //       fontWeight: FontWeight.w900),
                                    // ),
                                  ],
                                ),
                                SizedBox(height: 30,),
                                Container(
                                  height:MediaQuery.of(context).size.height * .06,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipOval(
                                        child: Material(
                                          color: basiccolor,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                quantity++;
                                              });
                                            },
                                            child: SizedBox(
                                              width: 28,
                                              height: 28,
                                              child: Icon(Icons.add),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 10,),
                                      Text(
                                        "${quantity.toString()}",
                                        style: TextStyle(fontSize: 50,color: Colors.black),
                                      ),
                                      SizedBox(width: 10,),

                                      ClipOval(
                                        child: Material(
                                          color: basiccolor,
                                          child: GestureDetector(
                                            onTap: () {
                                              if (quantity > 0) {
                                                setState(() {
                                                  quantity--;
                                                });
                                              }
                                            },
                                            child: SizedBox(
                                              width: 28,
                                              height: 28,
                                              child: Icon(Icons.remove),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                    ),
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width,
                    child: Builder(builder: (context) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    CartItem cartItem =
                                        Provider.of<CartItem>(context, listen: false);
                                    product.pQuantity = quantity;
                                    bool exist = false;
                                    var productsincart = cartItem.products;
                                    for (var productincart in productsincart) {
                                      if (productincart.pName == product.pName) {
                                        exist = true;
                                      }
                                    }
                                    if (exist) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("already added")));
                                    } else {
                                      cartItem.addProduct(product);

                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Added to cart")));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: basiccolor),
                                  child: Text(
                                    "Add to cart".toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(width: 20,),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      _showModalBottomSheet(context);
                                    },
                                    
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: basiccolor),
                                    child: Text(
                                      "Rate".toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.bold),
                                    )),
                              )

                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void _showModalBottomSheet(BuildContext context) {
    double ratingInner = 3.0;
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: 500,
              padding: EdgeInsets.all(10),
              // rating and feedback input
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // ios docker bottom line
                    Container(
                      height: 7,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    // rating bar
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        // updateOnDrag: false,
                        // tapOnlyMode: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            ratingInner = rating;
                          });
                          print(rating);
                        },
                      ),
                    ),
                    // rate in text
                    Text(
                      '${ratingInner}',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    // feedback input
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Feedback',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    // submit button that close the bottom sheet
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrangeAccent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                        )),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

//  CartItem cartItem= Provider.of<CartItem>(context,listen: false);
//                  product.pQuantity=quantity;
//                 cartItem.addProduct(product);
//                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to cart")));
