import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_021/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:trade_021/features/wishlist/presentation/states/bloc/events.dart';
import 'package:trade_021/features/wishlist/presentation/states/bloc/wishlist_bloc.dart';

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
        actions: [
          TextButton(
            onPressed: () {
              context.read<WishlistBloc>().add(SaveReorderedWishlist(tempList));
              Navigator.pop(context);
            },
            child: Text("Save", style: TextStyle(color: Colors.blue)),
          ),
        ],
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
            ListTile(
              key: ValueKey(item.id),
              title: Text(item.title),
              leading: Icon(Icons.drag_handle),
            ),
        ],
      ),
    );
  }
}
