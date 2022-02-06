import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookCollection {
  final int qty;
  final int pages;

  BookCollection({this.qty = 1, this.pages = 200});

  BookCollection copy({int? qty, int? pages}) =>
      BookCollection(qty: qty ?? this.qty, pages: pages ?? this.pages);
}

class BookNotifier extends StateNotifier<BookCollection> {
  BookNotifier() : super(BookCollection());

  void setPages(int pages) {
    final newBookCollection = state.copy(pages: pages);

    state = newBookCollection;
  }

  void increaseQty() {
    int qty = state.qty + 1;
    final newBookCollection = state.copy(qty: qty);

    state = newBookCollection;
  }

  void decreaseQty() {
    int qty = max(0, state.qty - 1);
    final newBookCollection = state.copy(qty: qty);

    state = newBookCollection;
  }
}

final stateNotifierProvider =
    StateNotifierProvider<BookNotifier, BookCollection>(
        (ref) => BookNotifier());

class StateNotifierPage extends ConsumerWidget {
  const StateNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final book = ref.watch(stateNotifierProvider);
    final qty = book.qty;
    final pages = book.pages;

    final bookNotifier = ref.read(stateNotifierProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          title: const Text("StateNotifier Page"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Book Quantity: $qty",
                style: TextStyle(fontSize: 26.0),
              ),
              Text(
                "Book Pages: $pages",
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
                      child: const Text("Remove Book"))),
              SizedBox(
                  child: Slider(
                value: pages.toDouble(),
                max: 300,
                onChanged: (double value) {
                  bookNotifier.setPages(value.toInt());
                },
              ))
            ],
          ),
        ));
  }
}
