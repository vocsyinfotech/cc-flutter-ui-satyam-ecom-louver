import 'package:flutter/material.dart';
import 'package:thelouvre/model/categorymodel.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

// ignore: use_key_in_widget_constructors
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<CategoryModel>? first;
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];
  bool _isObscure = false;

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Styles.semiBold(
                "Find your watch",
                ff: "AvenirHeavy",
                fs: 30,
              ),
            ),
            Styles.semiBold(
              "Search through more than 1000+ watches",
              ff: "AvenirBook",
              fs: 14,
            ),
            sizevertical(height: 20.0),
            sizevertical(height: 20.0),
            TextField(
              cursorColor: skin1,
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: _isObscure ? gray2 : skin1,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }),
                hintText: "Search",
                hintStyle: const TextStyle(color: black1),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: skin1),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundUsers[index]["id"].toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Text(_foundUsers[index]['name']),
                          subtitle: Text(
                              '${_foundUsers[index]["age"].toString()} years old'),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 15, color: gray3),
                    ),
            ),
            sizevertical(height: 20.0),
            Flatbtn(() {}, "Search", skin1),
          ],
        ),
      ),
    );
  }
}
