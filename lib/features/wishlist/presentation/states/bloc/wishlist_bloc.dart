import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_021/features/wishlist/domain/usecases/upgrade_wishlist_usecase.dart';
import 'package:trade_021/features/wishlist/domain/usecases/wishlist_usecase.dart';
import 'package:trade_021/features/wishlist/presentation/states/bloc/events.dart';
import 'package:trade_021/features/wishlist/presentation/states/bloc/states.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final GetWishlist getWishlist;
  final UpdateWishlistOrder updateOrder;

  WishlistBloc({required this.getWishlist, required this.updateOrder})
    : super(WishlistState(items: [])) {
    on<LoadWishlist>((event, emit) {
      emit(WishlistState(items: getWishlist()));
    });

    on<SaveReorderedWishlist>((event, emit) {
      updateOrder(event.items);
      emit(WishlistState(items: getWishlist()));
    });
  }
}
