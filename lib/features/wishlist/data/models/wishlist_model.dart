import 'package:trade_021/features/wishlist/domain/entities/wishlist_entity.dart';

class WishlistItemModel extends WishlistItem {
  WishlistItemModel({
    required super.id,
    required super.title,
    required super.subTitle,
    required super.currentPrice,
    required super.currentValue,
  });

  factory WishlistItemModel.fromEntity(WishlistItem item) {
    return WishlistItemModel(
      id: item.id,
      title: item.title,
      subTitle: item.subTitle,
      currentPrice: item.currentPrice,
      currentValue: item.currentValue,
    );
  }
}
