import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseController {
  var isFav = false.obs;
  //Create a private constructor
  DataBaseController._();
  static const databaseName = 'Category.db';
  static final DataBaseController instance = DataBaseController._();
  static Database? _database;
  Future<Database?> get database async {
    if (_database == null) {
      return await initializeDatabase();
    }
    return _database;
  }

  initializeDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), databaseName),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Category(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, productid TEXT, title TEXT,description TEXT,image TEXT,price TEXT)");
    });
  }

  /// set into table
  insertTodo(MovieData todo) async {
    try {
      final db = await database;
      var res = await db!
          .insert(MovieData.TABLENAME, todo.toMap(),
              conflictAlgorithm: ConflictAlgorithm.replace)
          .then((value) {
        Get.snackbar('FAVOURITE', 'ADD INTO FAVOURITE!');
        ("inserted data>>>>>>>>>>");
      });
      return res;
    } catch (e) {
      ('DATABASE ERROR : $e');
    }
  }

  /// get table
  Future<List<MovieData>> retrieveTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db!.query(MovieData.TABLENAME);
    return List.generate(maps.length, (i) {
      return MovieData(
          id: maps[i]['id'],
          productid: maps[i]['productid'],
          price: maps[i]['price'],
          description: maps[i]['description'],
          image: maps[i]['image'],
          title: maps[i]['title']);
    });
  }

  updateTodo(MovieData todo) async {
    final db = await database;
    await db!.update(MovieData.TABLENAME, todo.toMap(),
        where: 'id = ?',
        whereArgs: [todo.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteTodo({required int id}) async {
    var db = await database;
    db!.delete(MovieData.TABLENAME, where: 'id = ?', whereArgs: [id]);
    Get.snackbar('Favourite', 'Remove from Favourite');
  }
}

class MovieData {
  int? id;
  final String productid;
  final String title;
  final String description;
  final String image;
  final String price;

  // ignore: constant_identifier_names
  static const String TABLENAME = "Category";
  MovieData({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.productid,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'productid': productid,
    };
  }
}
