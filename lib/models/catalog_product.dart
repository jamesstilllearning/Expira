class CatalogProduct {
  const CatalogProduct({required this.barcode, required this.name, this.brand, this.category, this.packageSize, this.packageUnit, this.description, this.imageUrl, required this.provider, this.providerId, this.lastSuccess, this.lookupStatus = 'success', this.lastAttempt});

  final String barcode, name, provider;
  final String? brand, category, packageSize, packageUnit, description, imageUrl, providerId;
  final DateTime? lastSuccess, lastAttempt;
  final String lookupStatus;

  bool get usable => name.trim().isNotEmpty;
  Map<String, dynamic> toJson() => {'barcode': barcode, 'name': name, 'brand': brand, 'category': category, 'packageSize': packageSize, 'packageUnit': packageUnit, 'description': description, 'imageUrl': imageUrl, 'provider': provider, 'providerId': providerId, 'lastSuccess': lastSuccess?.toIso8601String(), 'lookupStatus': lookupStatus, 'lastAttempt': lastAttempt?.toIso8601String()};
  factory CatalogProduct.fromJson(Map<String, dynamic> j) => CatalogProduct(barcode: j['barcode'] as String, name: j['name'] as String, brand: j['brand'] as String?, category: j['category'] as String?, packageSize: j['packageSize'] as String?, packageUnit: j['packageUnit'] as String?, description: j['description'] as String?, imageUrl: j['imageUrl'] as String?, provider: j['provider'] as String, providerId: j['providerId'] as String?, lastSuccess: j['lastSuccess'] == null ? null : DateTime.tryParse(j['lastSuccess'] as String), lookupStatus: j['lookupStatus'] as String? ?? 'success', lastAttempt: j['lastAttempt'] == null ? null : DateTime.tryParse(j['lastAttempt'] as String));
}
