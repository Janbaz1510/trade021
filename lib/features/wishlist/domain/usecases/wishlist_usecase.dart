import 'package:trade_021/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:trade_021/features/wishlist/domain/repositories/wishlist_repository.dart';

class GetWishlist {
  final WishlistRepository repo;
  GetWishlist(this.repo);

  List<WishlistItem> call() => repo.getWishlist();
}
