import 'package:book_store_app/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book_model.dart';
var bk ;
class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.selectedBook});
  final selectedBook;

  @override
  Widget build(BuildContext context) {
    print(selectedBook.cover_image_url);
    // var books = context.watch<BookProvider>().books;
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(selectedBook.cover_image_url),
                      fit: BoxFit.contain,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectedBook.title),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('fareed ahmed')],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          multiWidget( selectedBookCategories: selectedBook.categories, selectedBookFormats: selectedBook.available_format,),
        ],
      ),
    );
  }
}

class multiWidget extends StatefulWidget {
   const multiWidget({
    super.key, required this.selectedBookCategories, required this.selectedBookFormats
  });
  final selectedBookCategories;
  final selectedBookFormats;

  @override
  State<multiWidget> createState() => _multiWidgetState();
}

class _multiWidgetState extends State<multiWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List options = ['Description', 'Categories', 'Format'];
    List<Widget> categoryWidgets = [
      descriptionWidget(),
      categoryWidget( categories: widget.selectedBookCategories
      ),
      formatWidget(formats: widget.selectedBookFormats)
      // descriptionWidget(),
    ];
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [
    //     Column(
    //       children: [Text('Description')],
    //     ),
    //     Column(
    //       children: [Text('Categories')],
    //     ),
    //     Column(
    //       children: [Text('Format')],
    //     ),
    //   ],
    // );
    return Column(
      children: [
        Container(
          color: Colors.amber,
          margin: EdgeInsets.symmetric(vertical: 20.0 / 2),
          height: 30.0,
          child: ListView.builder(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: options.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  print(index);
                  selectedIndex = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20.0,
                  right: index == options.length - 1 ? 20.0 : 0,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: index == selectedIndex
                      ? Colors.white.withOpacity(0.4)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  options[index].toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        categoryWidgets[selectedIndex],
      ],
    );
  }
}

class descriptionWidget extends StatelessWidget {
  const descriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              "Ad quis pariatur magna do. Velit aliquip culpa minim exercitation ex eiusmod velit. Eu aliquip quis sit duis non Lorem voluptate elit mollit dolore veniam. Cillum ipsum in ea dolor laborum deserunt sunt irure fugiat aliqua cupidatat est cupidatat adipisicing. Esse id non aliqua culpa. Nisi eiusmod veniam ad exercitation sint. Eu officia irure eiusmod proident sint. Anim enim enim labore tempor id tempor anim elit cillum exercitation et ea quis quis. Culpa laborum sint pariatur sit aliquip. Ea fugiat elit esse duis ipsum tempor ut sunt aliqua officia et aliquip deserunt."),
        )
      ],
    );
  }
}


class categoryWidget extends StatelessWidget {

  categoryWidget({
    super.key, required this.categories
  });
  var categories;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
            scrollDirection: Axis.vertical,
          itemCount: categories.length,
          itemBuilder: (context, index) => ListTile(
            // tileColor: Colors.amber,
            title: Text(categories[index]),
          ),
        ),
      ],
    );

  }
}

class formatWidget extends StatelessWidget {
  formatWidget({super.key, required this.formats});
  var formats;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: formats.length,
      itemBuilder: (context, index) => ListTile(
        // tileColor: Colors.amber,
        title: Text(formats[index]),
      ),
    );
  }
}
