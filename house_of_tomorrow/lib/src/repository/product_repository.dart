import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/view/shopping/shopping_view.dart';
import 'package:house_of_tomorrow/util/helper/network_helper.dart';

final findProductList = FutureProvider.autoDispose
    .family<List<Product>, String>((ref, keyword) async {
  await Future.delayed(const Duration(milliseconds: 555));
  try {
    final res = await NetworkHelper.dio.get(PRODUCTURL);
    final productList = jsonDecode(res.data)
        .map<Product>((json) => Product.fromJson(json))
        .where((product) {
      if (keyword.isEmpty) return true;
      return "${product.name}${product.brand}"
          .toLowerCase()
          .contains(keyword.toLowerCase());
    }).toList();
    return productList;
  } catch (e, s) {
    log('Failed to fetch product list', error: e, stackTrace: s);
    return <Product>[]; // Return an empty list if there's an error
  }
});
