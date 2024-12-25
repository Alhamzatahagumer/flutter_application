class Homemodel {
  late bool status;
  late homeDataModel data;

  Homemodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = homeDataModel.fromJson(json['data']);
  }
}

class homeDataModel {
  List<bannersModel> banners = [];
  List<productsModel> products = [];

  homeDataModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      json['banners'].forEach((element) {
        banners.add(bannersModel.fromJson(element));
      });
    }

    if (json['products'] != null) {
      json['products'].forEach((element) {
        products.add(productsModel.fromJson(element));
      });
    }
  }
}

class bannersModel {
  late int id;
  late String image;

  bannersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class productsModel {
  late int id;
  late dynamic price;
  late dynamic old_price;
  late dynamic discount;
  late String image;
  late String name;
  late bool in_favorites;
  late bool in_cart;

  productsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
}
