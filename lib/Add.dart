import 'package:flutter/material.dart';
import 'package:flutter_projects/Book.dart';
import 'package:flutter_projects/Repository.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final TextEditingController _txtTitle = TextEditingController();
  final TextEditingController _txtAuthor = TextEditingController();
  final TextEditingController _txtISBN = TextEditingController();
  final TextEditingController _txtStatus = TextEditingController();

  // Method to get the title input value
  String _getTitleValue() {
    return _txtTitle.text;
  }

  // Method to get the author input value
  String _getAuthorValue() {
    return _txtAuthor.text;
  }

  // Method to get the ISBN input value
  String _getISBNValue() {
    return _txtISBN.text;
  }

  // Method to get the status input value
  String _getStatusValue() {
    return _txtStatus.text;
  }

  // Show an alert dialog when the book is successfully added
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successful'),
        content: Text('Book has been saved'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // Method to handle the form submission and add the new book
  void _addBook() {
    // Only add a book if all fields are filled
    if (_txtTitle.text.isNotEmpty &&
        _txtAuthor.text.isNotEmpty &&
        _txtISBN.text.isNotEmpty &&
        _txtStatus.text.isNotEmpty) {
      // Add the new book to the Repository's book list
      Repository.bookList.add(
        Book.all(
          _getTitleValue(),
          _getAuthorValue(),
          _getISBNValue(),
          _getStatusValue(),
        ),
      );

      // Print the book list (you can replace this with more useful logic)
      print(Repository.bookList);

      // Show the success alert dialog
      _showAlertDialog(context);

      // Clear the text fields after adding the book
      setState(() {
        _txtTitle.clear();
        _txtAuthor.clear();
        _txtISBN.clear();
        _txtStatus.clear();
      });
    } else {
      // Show a warning if any of the fields are empty
      _showAlertDialog(context);  // You might want to customize this for an error case
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Add Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title input field
            Container(
              width: 300,
              child: TextField(
                controller: _txtTitle,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
            ),
            // Author input field
            Container(
              width: 300,
              child: TextField(
                controller: _txtAuthor,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: 'Author',
                ),
              ),
            ),
            // ISBN input field
            Container(
              width: 300,
              child: TextField(
                controller: _txtISBN,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: 'ISBN',
                ),
              ),
            ),
            // Status input field
            Container(
              width: 300,
              child: TextField(
                controller: _txtStatus,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: 'Status',
                ),
              ),
            ),
            // Submit button to add the book
            Container(
              margin: EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: _addBook, // Trigger the book addition
                child: Text(
                  "ADD",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
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
