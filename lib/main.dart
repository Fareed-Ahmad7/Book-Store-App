import 'dart:convert';
import 'dart:ffi';

import 'package:book_store_app/book_provider.dart';
import 'package:book_store_app/pages/book_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/book_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider<BookProvider>(
      child: MyApp(),
      create: (_) => BookProvider(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var books = context.watch<BookProvider>().books;

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Book Store'),
        // ),

        body: Column(
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(32, 64, 0, 16),
                  // padding: EdgeInsets.all(64),
                  child: Text(
                    'Book Store Heading',
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text('search bar'),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          crossAxisCount: 2,
                        ),
                        itemCount: books.length,
                        itemBuilder: (context, index) {
                          final book = books[index];
                          // return Card(
                          //   color: Colors.amber,
                          //   child: Center(child: Text(book.title)),
                          // );
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookDetails(
                                            selectedBook: book,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(book.cover_image_url),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 


// class Book {
//   String? title;
//   String? cover_image_url;
//   double? priceInDollar;
//   List<String>? categories;
//   List<String>? availableFormat;

//   Book(
//       {this.title,
//       this.cover_image_url,
//       this.priceInDollar,
//       this.categories,
//       this.availableFormat});

//   Book.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     cover_image_url = json['cover_image_url'];
//     priceInDollar = json['price_in_dollar'];
//     categories = json['categories'].cast<String>();
//     availableFormat = json['available_format'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> Book = new Map<String, dynamic>();
//     Book['title'] = this.title;
//     Book['cover_image_url'] = this.cover_image_url;
//     Book['price_in_dollar'] = this.priceInDollar;
//     Book['categories'] = this.categories;
//     Book['available_format'] = this.availableFormat;
//     return Book;
//   }
// }

