

import 'Book.dart';

class Repository{
  static final List<Book> _bookList=[];

  static List<Book> get bookList => _bookList;
}