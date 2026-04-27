import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_021/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:trade_021/features/wishlist/presentation/states/bloc/events.dart';
import 'package:trade_021/features/wishlist/presentation/states/bloc/wishlist_bloc.dart';
import 'package:trade_021/features/wishlist/presentation/widgets/common_row_widget.dart';

class SortScreen extends StatefulWidget {
  @override
  State<SortScreen> createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  late List<WishlistItem> tempList;

  @override
  void initState() {
    super.initState();
    tempList = List.from(context.read<WishlistBloc>().state.items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reorder"),

        // actions: [
        //   TextButton(
        //     onPressed: () {
        //       context.read<WishlistBloc>().add(SaveReorderedWishlist(tempList));
        //       Navigator.pop(context);
        //     },
        //     child: Text("Save", style: TextStyle(color: Colors.blue)),
        //   ),
        // ],
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex--;

            final item = tempList.removeAt(oldIndex);
            tempList.insert(newIndex, item);
          });
        },
        children: [
          for (final item in tempList)
            Padding(
              key: ValueKey(item.id),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.reorder),
                  SizedBox(width: 12),
                  Expanded(
                    child: CommonRowWidget(
                      title: item.title,
                      subTitle: item.subTitle,
                      currentPrice: item.currentPrice,
                      currentValue: item.currentValue,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 85,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30, top: 12),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: () {
              context.read<WishlistBloc>().add(SaveReorderedWishlist(tempList));
              Navigator.pop(context);
            },
            child: Text(
              "Save Watchlist",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
