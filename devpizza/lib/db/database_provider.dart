import 'package:devpizza/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String TABLE_USER = 'user';
  static const String COLUMN_EMAIL = 'email';
  static const String COLUMN_ID = 'id';
  static const String COLUMN_PASSWORD = 'password';
  static const String COLUMN_NAME = 'name';
  static const String COLUMN_STREET = 'street';
  static const String COLUMN_STREETNUMBER = 'streetNumber';

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print("Database getter call");

    if (_database != null) {
      return _database;
    }

    _database = await createDataBase();
    return _database;
  }

  Future<Database> createDataBase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'devpizzaDB.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        print("Creating User table");
        await database.execute(
          "CREATE TABLE $TABLE_USER ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_EMAIL TEXT,"
          "$COLUMN_PASSWORD TEXT,"
          "$COLUMN_NAME TEXT,"
          "$COLUMN_STREET TEXT,"
          "$COLUMN_STREETNUMBER TEXT"
          ")",
        );
      },
    );
  }

  Future<List<User>> getUsers() async {
    final db = await database;
    var users = await db.query(
      TABLE_USER,
      columns: [
        COLUMN_ID,
        COLUMN_EMAIL,
        COLUMN_NAME,
        COLUMN_STREET,
        COLUMN_STREETNUMBER
      ],
    );

    List<User> userList = List<User>();

    users.forEach((currentUser) {
      User user = User.fromMap(currentUser);
      userList.add(user);
    });

    return userList;
  }

  Future<User> insert(User user) async {
    final db = await database;
    user.id = await db.insert(TABLE_USER, user.toMap());

    return user;
  }
}
