import 'package:trade_021/features/wishlist/domain/entities/wishlist_entity.dart';

abstract class WishlistRepository {
  List<WishlistItem> getWishlist();
  void updateOrder(List<WishlistItem> items);
}
