class ShowCard {
  Data? data;
  String? message;
  int? status;

  ShowCard({this.data, this.message, this.status});

  ShowCard.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
}

class Data {
  int? id;
  User? user;
  double? total;           // عدلنا النوع لـ double
  List<CartItems>? cartItems;

  Data({this.id, this.user, this.total, this.cartItems});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;

    // تحويل الـ total لـ double
    final t = json['total'];
    if (t != null) {
      total = t is num ? t.toDouble() : double.tryParse(t.toString());
    }

    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
  }
}

class User {
  int? userId;
  String? userName;

  User({this.userId, this.userName});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
  }
}

class CartItems {
  int? itemId;
  int? itemProductId;
  String? itemProductName;
  String? itemProductImage;
  String? itemProductPrice;         // السعر الأصلي String زي ما هو
  int? itemProductDiscount;
  double? itemProductPriceAfterDiscount;
  int? itemProductStock;
  int? itemQuantity;
  double? itemTotal;

  CartItems({
    this.itemId,
    this.itemProductId,
    this.itemProductName,
    this.itemProductImage,
    this.itemProductPrice,
    this.itemProductDiscount,
    this.itemProductPriceAfterDiscount,
    this.itemProductStock,
    this.itemQuantity,
    this.itemTotal,
  });

  CartItems.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemProductId = json['item_product_id'];
    itemProductName = json['item_product_name'];
    itemProductImage = json['item_product_image'];
    itemProductPrice = json['item_product_price'];
    itemProductDiscount = json['item_product_discount'];

    // تحويل price_after_discount إلى double
    final pad = json['item_product_price_after_discount'];
    if (pad != null) {
      itemProductPriceAfterDiscount =
      pad is num ? pad.toDouble() : double.tryParse(pad.toString());
    }

    itemProductStock = json['item_product_stock'];
    itemQuantity = json['item_quantity'];

    // تحويل item_total إلى double
    final it = json['item_total'];
    if (it != null) {
      itemTotal = it is num ? it.toDouble() : double.tryParse(it.toString());
    }
  }
}
