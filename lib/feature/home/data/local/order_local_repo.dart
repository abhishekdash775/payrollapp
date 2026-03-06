import 'package:firebase_auth/firebase_auth.dart';
import 'package:payrollapp/core/database/product_database.dart';
import 'package:payrollapp/feature/home/data/model/product_model/product_model.dart';

class OrderLocalRepo {
  final _cartTableName = "cart";
  final _orderTableName = "orders";
  final _orderItemTableName = "order_items";

  Future<void> placeOrder({required double totalAmount}) async {
    final db = await ProductDatabase.database;
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final cartItem = await db.query(_cartTableName);
    int orderId = await db.insert(_orderTableName, {
      "userId": uid,
      "orderDate": DateTime.now().toIso8601String(),
      "totalAmount": totalAmount,
      "status": "pending",
    });
    for (var item in cartItem) {
      await db.insert(_orderItemTableName, {
        "orderId": orderId,
        "productId": item["id"],
        "title": item["title"],
        "price": item["price"],
        "quantity": item["quantity"],
        "thumbnail": item["thumbnail"],
      });
    }
    await db.delete("cart");
  }

  Future<void> updateOrderStatus(int orderId) async {
    final db = await ProductDatabase.database;
    await db.update(
      _orderTableName,
      {"status": "completed"},
      where: "id = ?",
      whereArgs: [orderId],
    );
  }

  Future<List<ProductModel>> getOrderItem(int orderId) async {
    final db = await ProductDatabase.database;
    final result = await db.query(
      _orderItemTableName,
      where: "orderId = ?",
      whereArgs: [orderId],
    );
    return result.map((e) => ProductModel().productFromDb(e)).toList();
  }

  Future<List<Map<String, Object?>>> getOrders() async {
    final db = await ProductDatabase.database;
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return await db.query(
      "orders",
      where: "userId = ?",
      whereArgs: [uid],
      orderBy: "id DESC",
    );
  }
}
