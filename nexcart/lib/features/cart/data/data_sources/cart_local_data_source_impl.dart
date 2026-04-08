import 'package:nexcart/core/database/database_helper.dart';
import 'package:nexcart/features/cart/data/data_sources/cart_local_data_source.dart';
import 'package:nexcart/features/cart/domain/entities/cart_entity.dart';
import 'package:sqflite/sql.dart';

class CartLocalDataSourceImpl extends CartLocalDataSource {
  final DatabaseHelper _databaseHelper;

  CartLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<void> addToCart(CartItem item) async {
    final db = await _databaseHelper.database;

    db.insert(
      'cart',
      _toMap(item),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<bool> isProductInCart(int productId) async {
    final db = await _databaseHelper.database;

    final result = await db.query(
      'cart',
      where: 'product_id = ?',
      whereArgs: [productId],
      limit: 1,
    );

    return result.isNotEmpty;
  }

  @override
  Future<void> removeFromCart(int productId) async {
    final db = await _databaseHelper.database;

    await db.delete('cart', where: 'product_id = ?', whereArgs: [productId]);
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    final db = await _databaseHelper.database;

    final rows = await db.query('cart');
    return rows.map((row) => _fromMap(row)).toList();
  }

  Map<String, dynamic> _toMap(CartItem item) {
    return {'product_id': item.productId, 'quantity': item.quantity};
  }

  CartItem _fromMap(Map<String, dynamic> map) {
    return CartItem(
      productId: map['product_id'] as int,
      quantity: map['quantity'] as int,
    );
  }
}
