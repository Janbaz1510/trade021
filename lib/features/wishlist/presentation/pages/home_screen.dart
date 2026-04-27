import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_021/features/wishlist/presentation/pages/sort_screen.dart';
import 'package:trade_021/features/wishlist/presentation/states/bloc/states.dart';
import 'package:trade_021/features/wishlist/presentation/states/bloc/wishlist_bloc.dart';
import 'package:trade_021/features/wishlist/presentation/widgets/common_row_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: context.read<WishlistBloc>(),
                    child: SortScreen(),
                  ),
                ),
              );
            },
            child: Text("Sort", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          return ListView.separated(
            itemCount: state.items.length,
            itemBuilder: (_, i) {
              var item = state.items[i];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: CommonRowWidget(
                  title: item.title,
                  subTitle: item.subTitle,
                  currentPrice: item.currentPrice,
                  currentValue: item.currentValue,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(height: 0.5, color: Colors.red);
            },
          );
        },
      ),
    );
  }
}
