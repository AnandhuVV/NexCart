import 'package:nexcart/core/database/database_helper.dart';
import 'package:nexcart/features/products/data/data_sources/local_data_source/products_local_data_source.dart';
import 'package:nexcart/features/products/domain/entities/product_entity.dart';
import 'package:sqflite/sqflite.dart';

class ProductsLocalDataSourceImpl extends ProductsLocalDataSource {
  ProductsLocalDataSourceImpl(this._databaseHelper);

  final DatabaseHelper _databaseHelper;

  @override
  Future<void> cacheProducts(List<ProductEntity> products) async {
    final db = await _databaseHelper.database;
    final batch = db.batch();

    for (final product in products) {
      batch.insert(
        'products',
        _toMap(product),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  @override
  Future<void> clearProducts() async {
    final db = await _databaseHelper.database;
    await db.delete('products');
  }

  @override
  Future<List<ProductEntity>> getCachedProducts() async {
    final db = await _databaseHelper.database;
    final maps = await db.query('products');

    return maps.map((map) => _fromMap(map)).toList();
  }

  Map<String, dynamic> _toMap(ProductEntity product) {
    return {
      'id': product.id,
      'title': product.title,
      'description': product.description,
      'category': product.category,
      'price': product.price,
      'discount_percentage': product.discountPercentage,
      'rating': product.rating,
      'stock': product.stock,
      'thumbnail': product.thumbnail,
      'images': product.images.join(','),
      'availability_status': product.availabilityStatus,
      'brand': product.brand,
    };
  }

  ProductEntity _fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      price: map['price'] as double,
      discountPercentage: map['discount_percentage'] as double,
      rating: map['rating'] as double,
      stock: map['stock'] as int,
      thumbnail: map['thumbnail'] as String,
      images: (map['images'] as String).split(','),
      availabilityStatus: map['availability_status'] as String,
      brand: map['brand'] as String?,
    );
  }
}
