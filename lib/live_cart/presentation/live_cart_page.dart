import 'package:flutter/material.dart';
import 'package:retailershakti_flutter/live_cart/cart_payment_page.dart';
import 'package:retailershakti_flutter/live_cart/cart_search_page.dart';

class LiveCartPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LiveCartState();

}

class _LiveCartState extends State<LiveCartPage>{

  _clearCart(){

  }
  _callSearch(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CartSearchPage()));
  }

  _moveToPayment(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CartPaymentPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: _clearCart,
                child: const Icon(
                    Icons.remove_shopping_cart
                ),
              )
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children:  [

            Padding(padding: EdgeInsets.all(4),
              child: TextButton(onPressed: _callSearch,
                  child: Text("Search Products",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      //decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),


          ],
        ),
      ),
      //bottom section
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.grey,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "SAVE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: RaisedButton(
              onPressed: _moveToPayment,
              color: Colors.deepOrangeAccent,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.card_travel,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "CONTINUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}