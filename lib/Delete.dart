

import 'package:flutter/material.dart';

import 'Book.dart';
import 'Repository.dart';

class Delete extends StatefulWidget {
  @override
  _DeleteState createState() => _DeleteState();

}

class _DeleteState extends State<Delete>{

  final TextEditingController _txtSearch = TextEditingController();
  final TextEditingController _txtDelete = TextEditingController();
  List<Book> data = [];

  String _getSearchValue() {
    return _txtSearch.text;
  }
  String _getDeleteValue() {
    return _txtDelete.text;
  }


  void _searchBooks() {
    setState(() {
      data.clear();
    });

    Repository.bookList.forEach((book) {
      if (book.title.contains(_getSearchValue()) || book.author.contains(_getSearchValue())) {
        setState(() {
          data.add(book);
        });
      }
    });
  }

  void _deleteBooks() {

      setState(() {
        Repository.bookList.remove(data.first);
        data.clear();
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Page"),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextField for searching by Title / Author
                Container(
                  width: 300,
                  child: TextField(
                    controller: _txtSearch,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(labelText: "Title / Author"),
                  ),
                ),
                // Search button
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                    onPressed: _searchBooks,  // Trigger the search when pressed
                    child: Text(
                      "SEARCH",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            // Displaying the DataTable of books
            Container(
              margin: EdgeInsets.only(top: 50),
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Title')),
                  DataColumn(label: Text('Author')),
                  DataColumn(label: Text('ISBN')),
                  DataColumn(label: Text('Status')),
                ],
                rows: data.map((book) {
                  return DataRow(
                    cells: [
                      DataCell(Text(book.title)),
                      DataCell(Text(book.author)),
                      DataCell(Text(book.ISBN)),
                      DataCell(Text(book.status)),
                    ],
                  );
                }).toList(),
              ),
            ),
            // Search button
                Container(
                  margin: EdgeInsets.only(left: 20,top: 40),
                  child: ElevatedButton(
                    onPressed: _deleteBooks,  // Trigger the search when pressed
                    child: Text(
                      "DELETE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}