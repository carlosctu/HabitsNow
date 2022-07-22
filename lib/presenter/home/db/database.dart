import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'review.dart';

class ReviewsDatabase {
  static final ReviewsDatabase instance = ReviewsDatabase._init();

  static Database? _database;

  ReviewsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('reviews.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableReviews ( 
  ${ReviewsFields.id} $idType, 
  ${ReviewsFields.isImportant} $boolType,
  ${ReviewsFields.number} $integerType,
  ${ReviewsFields.title} $textType,
  ${ReviewsFields.description} $textType,
  ${ReviewsFields.time} $textType
  )
''');
  }

  Future<Review> create(Review note) async {
    final db = await instance.database;
    final id = await db.insert(tableReviews, note.toJson());
    return note.copy(id: id);
  }

  Future<Review> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableReviews,
      columns: ReviewsFields.values,
      where: '${ReviewsFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Review.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Review>> readAllReviews() async {
    final db = await instance.database;

    const orderBy = '${ReviewsFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tablereviews ORDER BY $orderBy');

    final result = await db.query(tableReviews, orderBy: orderBy);

    return result.map((json) => Review.fromJson(json)).toList();
  }

  Future<int> updateReviews(Review note) async {
    final db = await instance.database;

    return db.update(
      tableReviews,
      note.toJson(),
      where: '${ReviewsFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableReviews,
      where: '${ReviewsFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
