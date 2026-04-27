import 'package:trade_021/features/wishlist/data/datasources/wishlist_datasource.dart';
import 'package:trade_021/features/wishlist/data/models/wishlist_model.dart';
import 'package:trade_021/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:trade_021/features/wishlist/domain/repositories/wishlist_repository.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistLocalDataSource localDataSource;

  WishlistRepositoryImpl(this.localDataSource);

  @override
  List<WishlistItem> getWishlist() {
    return localDataSource.getItems();
  }

  @override
  void updateOrder(List<WishlistItem> items) {
    final models = items.map((e) => WishlistItemModel.fromEntity(e)).toList();

    localDataSource.updateOrder(models);
  }
}
