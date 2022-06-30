


class Product{
  final String productId;
  final String displayName;
  final String mrp;
  final String productImage;

  Product(this.productId, this.displayName, this.mrp, this.productImage);

  factory Product.fromMap(Map<String,dynamic> map){
    return Product(
        map["ProductId"],
        map["DisplayName"],
        map["MRP"],
        map["ProductImage"]
    );
  }

  toMap() => {
    productId,
    displayName,
    mrp,
    productImage
  };

 // Product({required this.productId,required this.displayName,required this.mrp,required this.productImage});
}



class CatalogModel{
  static List<Product> products = <Product>[];
}