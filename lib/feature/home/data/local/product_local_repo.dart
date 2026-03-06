import 'package:payrollapp/core/database/product_database.dart';
import 'package:payrollapp/feature/home/data/model/product_model/product_model.dart';
import 'package:sqflite/sqflite.dart';


class ProductLocalRepo {

  static const String _tableName = "products";

  // ================= INSERT PAGE PRODUCTS =================

 Future<void> insertPageProducts(
  List<ProductModel> products,
  int page,
) async {
  final db = await ProductDatabase.database;

  final batch = db.batch();

  for (var product in products) {
    final map = product.toDb(page);
    batch.insert(
      _tableName,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  await batch.commit(noResult: true);

  await _deleteOldPages(page);

  print("✅ Page $page saved (${products.length} items)");
}

  // ================= FETCH PRODUCTS BY PAGE =================

  Future<List<ProductModel>> getProductsByPage(int page) async {

    final db = await ProductDatabase.database;

    final result = await db.query(
      _tableName,
      where: 'page = ?',
      whereArgs: [page],
    );

    print("📦 [LOCAL DB] Offline products fetched for page $page");

    return result.map((map) => ProductModel().productFromDb(map)).toList();
  }

  // ================= DELETE OLD PAGES =================

  Future<void> _deleteOldPages(int currentPage) async {

    final db = await ProductDatabase.database;

    final minPageToKeep = currentPage - 2;

    await db.delete(
      _tableName,
      where: 'page < ?',
      whereArgs: [minPageToKeep],
    );

    print("🧹 [LOCAL DB] Old pages removed (< $minPageToKeep)");
  }

  // ================= CLEAR ALL PRODUCTS =================

  Future<void> clearAllProducts() async {

    final db = await ProductDatabase.database;

    await db.delete(_tableName);

    print("🗑️ [LOCAL DB] All products cleared");
  }
}
