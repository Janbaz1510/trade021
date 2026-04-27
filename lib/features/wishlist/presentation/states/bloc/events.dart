import 'package:trade_021/features/wishlist/domain/entities/wishlist_entity.dart';

abstract class WishlistEvent {}

class LoadWishlist extends WishlistEvent {}

class SaveReorderedWishlist extends WishlistEvent {
  final List<WishlistItem> items;
  SaveReorderedWishlist(this.items);
}
