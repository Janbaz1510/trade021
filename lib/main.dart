import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_021/features/wishlist/data/datasources/wishlist_datasource.dart';
import 'package:trade_021/features/wishlist/data/repositories/wishlist_repository_impl.dart';
import 'package:trade_021/features/wishlist/domain/usecases/upgrade_wishlist_usecase.dart';
import 'package:trade_021/features/wishlist/domain/usecases/wishlist_usecase.dart';
import 'package:trade_021/features/wishlist/presentation/pages/home_screen.dart';
import 'package:trade_021/features/wishlist/presentation/states/bloc/events.dart';
import 'package:trade_021/features/wishlist/presentation/states/bloc/wishlist_bloc.dart';

void main() {
  final dataSource = WishlistLocalDataSource();
  final repo = WishlistRepositoryImpl(dataSource);

  runApp(
    BlocProvider(
      create: (_) => WishlistBloc(
        getWishlist: GetWishlist(repo),
        updateOrder: UpdateWishlistOrder(repo),
      )..add(LoadWishlist()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
