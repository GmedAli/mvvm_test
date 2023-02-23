import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo/models/task.dart';

class LocaldbService {
  final String dbName = 'demo.db';

  Database? _db;

  Future<Database> open() async {
    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, 'demo.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('''CREATE TABLE Task (
            id INTEGER PRIMARY KEY,
            title TEXT,
            details TEXT,
            dueDate TEXT,
            createdAt TEXT
        )''');
    });
    return database;
  }

  Future<void> insertTask(TaskDTO task) async {
    _db ??= await open();

    await _db?.insert('Task', task.toJson());
  }

  Future<List<TaskDTO>> getTaskList() async {
    _db ??= await open();
    final List<Map<String, dynamic>> maps = await _db!.query('Task');
    List<TaskDTO> value =
        List.generate(maps.length, (index) => TaskDTO.fromJson(maps[index]));
    return value;
  }
}
