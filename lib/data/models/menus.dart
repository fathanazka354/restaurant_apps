class Menus {
  List<Drinks> foods;
  List<Drinks> drinks;

  Menus({required this.drinks, required this.foods});

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
      foods: List<Drinks>.from(
          json["foods"].map((element) => Drinks.fromJson(element))),
      drinks: List<Drinks>.from(
          json["drinks"].map((element) => Drinks.fromJson(element))));

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((e) => e.toJson())),
        "drinks": List<dynamic>.from(drinks.map((e) => e.toJson()))
      };
}

class Drinks {
  String name;
  Drinks({required this.name});

  factory Drinks.fromJson(Map<String, dynamic> json) =>
      Drinks(name: json['name']);
  Map<String, dynamic> toJson() => {"name": name};
}
