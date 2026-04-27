import 'package:trade_021/features/wishlist/data/models/wishlist_model.dart';

class WishlistLocalDataSource {
  final List<WishlistItemModel> _items = [
    WishlistItemModel(
      id: "1",
      title: "RELIANCE",
      subTitle: "NSE | EQ",
      currentPrice: "1,374.10",
      currentValue: "-4.40 (-0.32%)",
    ),
    WishlistItemModel(
      id: "2",
      title: "HDFCBANK",
      subTitle: "NSE | EQ",
      currentPrice: "966.85",
      currentValue: "0.85 (0.09%)",
    ),
    WishlistItemModel(
      id: "3",
      title: "ASIANPAINT",
      subTitle: "NSE | EQ",
      currentPrice: "2,537.40",
      currentValue: "6.60 (0.26%)",
    ),
    WishlistItemModel(
      id: "4",
      title: "NIFTY IT",
      subTitle: "IDX",
      currentPrice: "35,187.30",
      currentValue: "876.86 (2.56%)",
    ),
    WishlistItemModel(
      id: "5",
      title: "RELIANCE SEP 1880 CE",
      subTitle: "NSE | Monthly",
      currentPrice: "0.00",
      currentValue: "0.00 (0.00%)",
    ),
    WishlistItemModel(
      id: "6",
      title: "RELIANCE SEP 1370 PE",
      subTitle: "NSE | Monthly",
      currentPrice: "19.20",
      currentValue: "1.00 (5.49%)",
    ),
    WishlistItemModel(
      id: "7",
      title: "MRF",
      subTitle: "NSE | EQ",
      currentPrice: "1,47,625.00",
      currentValue: "550.00 (0.37%)",
    ),
  ];
  List<WishlistItemModel> getItems() => _items;

  void updateOrder(List<WishlistItemModel> newItems) {
    _items
      ..clear()
      ..addAll(newItems);
  }
}
