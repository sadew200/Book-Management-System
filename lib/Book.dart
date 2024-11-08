class Book{
  late String _title;
  late String _author;
  late String _ISBN;
  late String _status;


  @override
  String toString() {
    return 'Book{_title: $_title, _author: $_author, _ISBN: $_ISBN, _status: $_status}';
  }

  String get title => _title;

  Book.all(this._title, this._author, this._ISBN, this._status);


  set title(String value) {
    _title = value;
  }



  Book();

  String get author => _author;

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  String get ISBN => _ISBN;


  set ISBN(String value) {
    _ISBN = value;
  }

  set author(String value) {
    _author = value;
  }

}