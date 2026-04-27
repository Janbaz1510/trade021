import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_021/features/wishlist/presentation/pages/sort_screen.dart';
import 'package:trade_021/features/wishlist/presentation/states/bloc/states.dart';
import 'package:trade_021/features/wishlist/presentation/states/bloc/wishlist_bloc.dart';
import 'package:trade_021/features/wishlist/presentation/widgets/common_row_widget.dart';
import 'package:trade_021/features/wishlist/presentation/widgets/home_topbar.dart';
import 'package:trade_021/features/wishlist/presentation/widgets/searchbar_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeTopbar(),
                SearchBarWidget(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: InkWell(
                    onTap: () {
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
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.sort, color: Colors.black),
                          SizedBox(width: 8),
                          Text(
                            "Sort By",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(height: 0.5, color: Colors.grey),
                ListView.separated(
                  itemCount: state.items.length,
                  shrinkWrap: true,
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
                    return Container(height: 0.5, color: Colors.grey);
                  },
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 65,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.bookmark_border, color: Colors.black),
                Icon(Icons.shopping_cart_outlined, color: Colors.grey),
                Icon(Icons.flash_on, color: Colors.grey),
                Icon(Icons.wallet_travel, color: Colors.grey),
                Icon(Icons.account_balance_wallet_outlined, color: Colors.grey),
                Icon(Icons.person, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
