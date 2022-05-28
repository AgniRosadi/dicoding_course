class RestaurantsModel {
  RestaurantsModel({
    required this.restaurants,
  });
  late final List<Restaurants> restaurants;

  RestaurantsModel.fromJson(Map<String, dynamic> json){
    restaurants = List.from(json['restaurants']).map((e)=>Restaurants.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['restaurants'] = restaurants.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Restaurants {
  Restaurants({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });
  late final String id;
  late final String name;
  late final String description;
  late final String pictureId;
  late final String city;
  late final double rating;
  late final Menus menus;

  Restaurants.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating'] ?? 0;
    menus = Menus.fromJson(json['menus']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['pictureId'] = pictureId;
    _data['city'] = city;
    _data['rating'] = rating;
    _data['menus'] = menus.toJson();
    return _data;
  }
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });
  late final List<Foods> foods;
  late final List<Drinks> drinks;

  Menus.fromJson(Map<String, dynamic> json){
    foods = List.from(json['foods']).map((e)=>Foods.fromJson(e)).toList();
    drinks = List.from(json['drinks']).map((e)=>Drinks.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['foods'] = foods.map((e)=>e.toJson()).toList();
    _data['drinks'] = drinks.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Foods {
  Foods({
    required this.name,
  });
  late final String name;

  Foods.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}

class Drinks {
  Drinks({
    required this.name,
  });
  late final String name;

  Drinks.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}