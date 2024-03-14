import 'package:house_of_tomorrow/src/model/lang.dart';
import 'package:house_of_tomorrow/src/model/product_color.dart';

class Product {
  final Lang name;
  final Lang brand;
  final Lang description;
  final int price;
  final String priceUnit;
  final String rating;
  final List<ProductColor> productColorList;

  const Product({
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.priceUnit,
    required this.rating,
    required this.productColorList,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: Lang.fromJson(json['name'] ?? {}),
      brand: Lang.fromJson(json['brand'] ?? {}),
      description: Lang.fromJson(json['desc'] ?? {}),
      price: json['price'] ?? 0,
      priceUnit: json['priceUnit'] ?? '￦',
      rating: json['rating'] ?? '0.0',
      productColorList: (json['colorList'] ?? [])
          .map<ProductColor>((e) => ProductColor.fromJson(e))
          .toList(),
    );
  }
}
