import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/util/helper/immutable_helper.dart';

final cartProvider =
    NotifierProvider<RiverpodCart, List<CartItem>>(RiverpodCart.new);

class RiverpodCart extends Notifier<List<CartItem>> {
  @override
  build() {
    return const [];
  }

  // 선택된 상품 목록 반환
  List<CartItem> getSelectedCartItemList() {
    return state.where((cartItem) => cartItem.isSelected).toImmutableList();
  }

  void add(CartItem newCartitem) {
    state = [...state, newCartitem].toImmutableList();
  }

  void update(int selectedIndex, CartItem newCartitem) {
    state = state.asMap().entries.map((entry) {
      return entry.key == selectedIndex ? newCartitem : entry.value;
    }).toImmutableList();
  }

  void delete(List<CartItem> deleteList) {
    state = state.where((cartItem) {
      return !deleteList.contains(cartItem);
    }).toImmutableList();
  }
}
