import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookNotifier extends ChangeNotifier {
  int _qty = 1;

  void increaseQty() {
    _qty += 1;

    notifyListeners();
  }

  void decreaseQty() {
    _qty = max(0, _qty - 1);

    notifyListeners();
  }
}

final changeNotifierProvider =
    ChangeNotifierProvider<BookNotifier>((ref) => BookNotifier());

class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final bookNotifier = ref.watch(changeNotifierProvider);
    int bookQty = bookNotifier._qty;

    return Scaffold(
        appBar: AppBar(
          title: const Text("ChangeNotifier Page"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Book Quantity: $bookQty",
                style: TextStyle(fontSize: 26.0),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                  width: 200.0,
                  child: ElevatedButton(
                      onPressed: () {
                        bookNotifier.increaseQty();
                      },
                      child: const Text("Add Book"))),
              SizedBox(height: 10.0),
              SizedBox(
                  width: 200.0,
                  child: ElevatedButton(
                      onPressed: () {
                        bookNotifier.decreaseQty();
                      },
                      child: const Text("Remove Book")))
            ],
          ),
        ));
  }
}
