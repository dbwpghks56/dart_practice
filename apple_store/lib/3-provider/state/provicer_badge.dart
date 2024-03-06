import 'package:apple_store/3-provider/state/provider_cart.dart';
import 'package:flutter/material.dart';

class ProviderBadge with ChangeNotifier {
  int count = 0;
  final ProviderCart providerCart;

  ProviderBadge({
    required this.providerCart,
  }) {
    providerCart.addListener(providerCartListener);
  }

  void providerCartListener() {
    count = providerCart.cartProductList.length;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    providerCart.removeListener(providerCartListener);
    super.dispose();
  }
}
