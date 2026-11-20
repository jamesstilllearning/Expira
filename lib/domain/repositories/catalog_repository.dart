import 'package:expira/core/errors/failure.dart';
import 'package:expira/core/errors/result.dart';
import 'package:expira/domain/models/catalog_product.dart';

/// Repository interface for product catalog operations.
abstract class CatalogRepository {
  /// Looks up a product by barcode (cache-first, then remote).
  Future<Result<CatalogProduct>> lookup(String barcode);

  /// Saves a product to the catalog.
  Future<Result<CatalogProduct>> save(CatalogProduct product);

  /// Gets a product from the local cache by barcode.
  Future<Result<CatalogProduct?>> getByBarcode(String barcode);

  /// Watches catalog changes (for real-time updates).
  Stream<Result<List<CatalogProduct>>> watch();
}