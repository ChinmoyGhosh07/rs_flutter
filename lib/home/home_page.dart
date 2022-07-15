import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retailershakti_flutter/live_cart/presentation/live_cart_page.dart';
import 'package:retailershakti_flutter/utils/routes.dart';

import '../models/catalog.dart';
import '../widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 4));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    //List<Product> list = List.from(productsData).map<Product>((product) => Product.fromMap(product)).toList();
    CatalogModel.products = List.from(productsData)
        .map<Product>((product) => Product.fromMap(product))
        .toList();
    setState(() {});
  }

  moveToCart(){
    Navigator.pushNamed(context,MyRoutes.cartMain);

    //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LiveCartPage()));
  }

  _makingPhoneCall() async {
    var url = Uri.parse("tel:9804450397");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(5, (index) => CatalogModel.products[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Retailershakti",
          style: TextStyle(color: Colors.white),
        ),
        /*leading: GestureDetector(
          onTap: () { *//* Write listener code here *//* },
          child: Icon(
            Icons.menu,  // add custom icons also
          ),
        ),*/
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: _makingPhoneCall,
                child: const Icon(
                  Icons.call,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: moveToCart,
                child: const Icon(
                    Icons.shopping_cart
                ),
              )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.products.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                //itemCount: CatalogModel.products.length,
                itemCount: CatalogModel.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        print(
                            "${CatalogModel.products[index].displayName} pressed");
                      },
                      //leading: Image.network(dummyList[index].productImage),
                      title: Text(CatalogModel.products[index].displayName),
                      trailing: Text("\$${CatalogModel.products[index].mrp}"),
                    ),
                  );
                  /*return ProductWidget(
              product: CatalogModel.products[index],
          );*/
                },
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
