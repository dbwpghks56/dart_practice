import 'package:apple_store/4-riverpod/cart.dart';
import 'package:apple_store/4-riverpod/store.dart';
import 'package:apple_store/common/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 현재 선택된 index
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            /// Store
            Store(),

            /// Cart
            Cart(),
          ],
        ),
        bottomNavigationBar: BottomBar(
          currentIndex: currentIndex,
          cartTotal: "0",
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
        ),
      ),
    );
  }
}
