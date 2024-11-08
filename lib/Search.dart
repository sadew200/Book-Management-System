import 'package:flutter/material.dart';
import 'package:flutter_projects/Book.dart';
import 'package:flutter_projects/Repository.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _txtSearch = TextEditingController();
  List<Book> data = [];

  // Method to get the search value from the TextField
  String _getSearchValue() {
    return _txtSearch.text;
  }

  // Method to reload the search results based on the input search text
  void _searchBooks() {
    // Clear the previous search results
    setState(() {
      data.clear();
    });

    // Perform the search based on title or author
    Repository.bookList.forEach((book) {
      if (book.title.contains(_getSearchValue()) || book.author.contains(_getSearchValue())) {
        setState(() {
          data.add(book);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Page"),
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
          ],
        ),
      ),
    );
  }
}
