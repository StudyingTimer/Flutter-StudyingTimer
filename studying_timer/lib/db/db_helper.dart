// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  final int version = 1; 
  Database? db; 

  Future<Database?> openDb() async {
    // ignore: prefer_conditional_assignment
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'clothes.db'),
          onCreate: (database, version) {
            database.execute(
                'CREATE TABLE clothes(id INTEGER PRIMARY KEY, name TEXT, clothImage File)');
            
          }, version: version);
    }
    return db;
  }
}


