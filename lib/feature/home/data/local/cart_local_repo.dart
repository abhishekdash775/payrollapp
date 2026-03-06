import 'package:payrollapp/core/database/product_database.dart';
import 'package:payrollapp/feature/home/data/model/product_model/product_model.dart';
import 'package:sqflite/sqflite.dart';

class CartLocalRepo {
  final String _tableName = "cart";

  /// ================= ADD TO CART =================
  Future<void> insertProductToCart(ProductModel product) async {
    final db = await ProductDatabase.database;

    final existing = await db.query(
      _tableName,
      where: "id = ?",
      whereArgs: [product.id],
    );

    if (existing.isNotEmpty) {
      final currentQty = existing.first["quantity"] as int;

      await db.update(
        _tableName,
        {"quantity": currentQty + 1},
        where: "id = ?",
        whereArgs: [product.id],
      );
    } else {
      final map = product.toDb(0);
      map["quantity"] = 1;

      await db.insert(
        _tableName,
        map,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

   }

  /// ================= GET CART PRODUCTS =================
  Future<List<ProductModel>> getCartProducts() async {
    final db = await ProductDatabase.database;

    final result = await db.query(_tableName);

    return result.map((e) => ProductModel().productFromDb(e)).toList();
  }

  /// ================= REMOVE PRODUCT =================
  Future<void> removeFromCart(int id) async {
    final db = await ProductDatabase.database;

    await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  /// ================= UPDATE QUANTITY =================
  Future<void> updateQuantity(int id, int quantity) async {
    final db = await ProductDatabase.database;

    if (quantity <= 0) {
      await removeFromCart(id);
      return;
    }

    await db.update(
      _tableName,
      {"quantity": quantity},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  /// ================= GET TOTAL COUNT =================
  Future<int> getCartCount() async {
    final db = await ProductDatabase.database;

    final result = await db.rawQuery(
      "SELECT SUM(quantity) as total FROM $_tableName",
    );

    return (result.first["total"] as int?) ?? 0;
  }

  /// ================= GET TOTAL PRICE =================
  Future<double> getTotalAmount() async {
    final db = await ProductDatabase.database;

    final result = await db.rawQuery(
      "SELECT SUM(price * quantity) as total FROM $_tableName",
    );

    return (result.first["total"] as num?)?.toDouble() ?? 0.0;
  }

  /// ================= CLEAR CART =================
  Future<void> clearCart() async {
    final db = await ProductDatabase.database;
    await db.delete(_tableName);
  }
}