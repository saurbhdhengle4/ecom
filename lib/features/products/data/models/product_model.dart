import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.price,
    required super.discountPercentage,
    required super.rating,
    required super.stock,
    required super.tags,
    required super.brand,
    required super.sku,
    required super.weight,
    required super.dimensions,
    required super.warrantyInformation,
    required super.shippingInformation,
    required super.availabilityStatus,
    required super.reviews,
    required super.returnPolicy,
    required super.minimumOrderQuantity,
    required super.meta,
    required super.images,
    required super.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,

      title: json['title'] ?? '',

      description: json['description'] ?? '',

      category: json['category'] ?? '',

      price: (json['price'] ?? 0).toDouble(),

      discountPercentage: (json['discountPercentage'] ?? 0).toDouble(),

      rating: (json['rating'] ?? 0).toDouble(),

      stock: json['stock'] ?? 0,

      tags: List<String>.from(json['tags'] ?? []),

      brand: json['brand'] ?? '',

      sku: json['sku'] ?? '',

      weight: json['weight'] ?? 0,

      dimensions: DimensionsModel.fromJson(json['dimensions'] ?? {}),

      warrantyInformation: json['warrantyInformation'] ?? '',

      shippingInformation: json['shippingInformation'] ?? '',

      availabilityStatus: json['availabilityStatus'] ?? '',

      reviews: (json['reviews'] as List? ?? [])
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),

      returnPolicy: json['returnPolicy'] ?? '',

      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,

      meta: MetaModel.fromJson(json['meta'] ?? {}),

      images: List<String>.from(json['images'] ?? []),

      thumbnail: json['thumbnail'] ?? '',
    );
  }
}

// =====================================================
// DIMENSIONS MODEL
// =====================================================

class DimensionsModel extends Dimensions {
  DimensionsModel({
    required super.width,
    required super.height,
    required super.depth,
  });

  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      width: (json['width'] ?? 0).toDouble(),
      height: (json['height'] ?? 0).toDouble(),
      depth: (json['depth'] ?? 0).toDouble(),
    );
  }
}

// =====================================================
// META MODEL
// =====================================================

class MetaModel extends Meta {
  MetaModel({
    required super.createdAt,
    required super.updatedAt,
    required super.barcode,
    required super.qrCode,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),

      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),

      barcode: json['barcode'] ?? '',

      qrCode: json['qrCode'] ?? '',
    );
  }
}

// =====================================================
// REVIEW MODEL
// =====================================================

class ReviewModel extends Review {
  ReviewModel({
    required super.rating,
    required super.comment,
    required super.date,
    required super.reviewerName,
    required super.reviewerEmail,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: json['rating'] ?? 0,

      comment: json['comment'] ?? '',

      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),

      reviewerName: json['reviewerName'] ?? '',

      reviewerEmail: json['reviewerEmail'] ?? '',
    );
  }
}
