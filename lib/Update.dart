

import 'package:flutter/material.dart';

import 'Book.dart';
import 'Repository.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();

}

class _UpdateState extends State<Update>{

  final TextEditingController _txtSearch = TextEditingController();
  final TextEditingController _txtUpdate = TextEditingController();
  List<Book> data = [];

  String _getSearchValue() {
    return _txtSearch.text;
  }
  String _getUpdateValue() {
    return _txtUpdate.text;
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

  void _updateBooks() {
        setState(() {
          data.first.status=_getUpdateValue();
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Page"),
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
                  margin: EdgeInsets.only(left: 20,top: 30),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextField for searching by Title / Author
                Container(
                  width: 300,
                  child: TextField(
                    controller: _txtUpdate,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(labelText: "Status"),
                  ),
                ),
                // Search button
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                    onPressed: _updateBooks,  // Trigger the search when pressed
                    child: Text(
                      "UPDATE",
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
          ],
        ),
      ),
    );
  }
} 