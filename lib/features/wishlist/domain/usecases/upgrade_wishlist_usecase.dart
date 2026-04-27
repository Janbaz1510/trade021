import 'package:trade_021/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:trade_021/features/wishlist/domain/repositories/wishlist_repository.dart';

class UpdateWishlistOrder {
  final WishlistRepository repo;
  UpdateWishlistOrder(this.repo);

  void call(List<WishlistItem> items) {
    repo.updateOrder(items);
  }
}
