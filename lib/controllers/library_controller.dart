import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg_26/models/teams_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LibraryController extends GetxController {
  static LibraryController get to => Get.find();
  static Database? _db;
  var tasks = <TeamsModel>[].obs;

  Future<Database?> get db async {
    _db ??= await initDB();
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'task_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            idTeam TEXT, 
            strTeam TEXT, 
            strDescriptionEN TEXT,
            strCountry TEXT,
            strBadge TEXT,
            strLogo TEXT,
            strStadium TEXT,
            isFavorite BOOLEAN
          )
        ''');
      },
    );
  }

  Future<int> addTask(TeamsModel task) async {
    var dbClient = await db;

    List<Map<String, dynamic>> existingTasks = await dbClient!.query(
      'tasks',
      where: 'strTeam = ?',
      whereArgs: [task.strTeam],
    );

    if (existingTasks.isEmpty) {
      int result = await dbClient.insert('tasks', task.toMap());
      task.id = result;

      loadTasks();
      return result;
    } else {
      return -1;
    }
  }



  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks
        .assignAll(queryResult.map((data) => TeamsModel.fromMap(data)).toList());
  }

  Future<void> deleteTask(int id) async {
    var dbClient = await db;
    await dbClient!.delete('tasks', where: 'id = ?', whereArgs: [id]);
    loadTasks();
  }
}
