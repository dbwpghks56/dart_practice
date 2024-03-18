import 'package:house_of_tomorrow/src/model/product.dart';

class CartItem {
  final Product product;
  final int corlorIndex;
  final int count;
  final bool isSelected;

  const CartItem({
    required this.product,
    required this.corlorIndex,
    required this.count,
    required this.isSelected,
  });

  CartItem copyWith({
    Product? product,
    int? corlorIndex,
    int? count,
    bool? isSelected,
  }) {
    return CartItem(
      product: product ?? this.product,
      corlorIndex: corlorIndex ?? this.corlorIndex,
      count: count ?? this.count,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
