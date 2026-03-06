import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class ProductDatabase {
  ProductDatabase._();
  static Database? _database;
  static const String _dbName = "melloshop_db.db";

  // ================= DB INSTANCE =================

  static Future<Database> get database async {
    if (_database != null) {
      debugPrint('📦 [DB] Using existing database instance');
      return _database!;
    }

    debugPrint('🆕 [DB] Creating new database instance');
    _database = await _initDatabase();

    return _database!;
  }

  // ================= INIT DATABASE =================

  static Future<Database> _initDatabase() async {
    debugPrint('⚙️ [DB] Initializing database...');

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    debugPrint('📍 [DB] Database Path: $path');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onOpen: (db) {
        debugPrint('✅ [DB] Database opened successfully');
      },
    );
  }

  // ================= CREATE TABLE =================

  static Future<void> _onCreate(Database db, int version) async {
    debugPrint('🛠️ [DB] Creating tables...');

    await db.execute('''
  CREATE TABLE products(
  id INTEGER PRIMARY KEY,
  title TEXT,
  description TEXT,
  category TEXT,
  price REAL,
  discountPercentage REAL,
  rating REAL,
  stock INTEGER,
  tags TEXT,
  brand TEXT,
  sku TEXT,
  weight INTEGER,
  dimensions TEXT,
  warrantyInformation TEXT,
  shippingInformation TEXT,
  availabilityStatus TEXT,
  reviews TEXT,
  returnPolicy TEXT,
  minimumOrderQuantity INTEGER,
  meta TEXT,
  images TEXT,
  thumbnail TEXT,
  page INTEGER
);
    ''');
    await db.execute('''
CREATE TABLE cart(
  id INTEGER PRIMARY KEY,
  title TEXT,
  description TEXT,
  category TEXT,
  price REAL,
  discountPercentage REAL,
  rating REAL,
  stock INTEGER,
  tags TEXT,
  brand TEXT,
  sku TEXT,
  weight INTEGER,
  dimensions TEXT,
  warrantyInformation TEXT,
  shippingInformation TEXT,
  availabilityStatus TEXT,
  reviews TEXT,
  returnPolicy TEXT,
  minimumOrderQuantity INTEGER,
  meta TEXT,
  images TEXT,
  thumbnail TEXT,
  quantity INTEGER

);
''');
    await db.execute("""
CREATE TABLE orders(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  userId TEXT,
  orderDate TEXT,
  totalAmount REAL,
  status TEXT
);
""");
    await db.execute("""
CREATE TABLE order_items(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  orderId INTEGER,
  productId INTEGER,
  title TEXT,
  price REAL,
  quantity INTEGER,
  thumbnail TEXT
);
""");

    debugPrint('✅ [DB] Products table created successfully');
  }

  // ================= INSERT SINGLE =================
  static Future<int> insert(
    String table,
    Map<String, dynamic> values, {
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.replace,
  }) async {
    final db = await database;

    final result = await db.insert(
      table,
      values,
      conflictAlgorithm: conflictAlgorithm,
    );

    debugPrint("✅ [DB] Inserted into $table");
    return result;
  }

  // ================= INSERT BATCH =================
  static Future<void> insertBatch(
    String table,
    List<Map<String, dynamic>> values,
  ) async {
    final db = await database;
    final batch = db.batch();

    for (var value in values) {
      batch.insert(table, value, conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit(noResult: true);

    debugPrint("✅ [DB] Batch inserted into $table (${values.length})");
  }

  // ================= READ =================
  static Future<List<Map<String, dynamic>>> query(
    String table, {
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
    int? limit,
  }) async {
    final db = await database;

    final result = await db.query(
      table,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: limit,
    );

    debugPrint("📦 [DB] Queried $table (${result.length} rows)");
    return result;
  }

  // ================= UPDATE =================
  static Future<int> update(
    String table,
    Map<String, dynamic> values, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final db = await database;

    final result = await db.update(
      table,
      values,
      where: where,
      whereArgs: whereArgs,
    );

    debugPrint("✏️ [DB] Updated $table");
    return result;
  }

  // ================= DELETE =================
  static Future<int> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final db = await database;

    final result = await db.delete(table, where: where, whereArgs: whereArgs);

    debugPrint("🗑️ [DB] Deleted from $table");
    return result;
  }

  // ================= CLEAR TABLE =================
  static Future<void> clearTable(String table) async {
    final db = await database;
    await db.delete(table);
    debugPrint("🧹 [DB] Cleared table $table");
  }
}
