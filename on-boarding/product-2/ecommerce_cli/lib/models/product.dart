class Product {
  String _name;
  String _description;
  double _price;

  Product(this._name, this._description, this._price);

  // Getters
  String get name => _name;
  String get description => _description;
  double get price => _price;

  // Setters
  set name(String newName) => _name = newName;
  set description(String newDescription) => _description = newDescription;
  set price(double newPrice) => _price = newPrice;

  @override
  String toString() {
    return 'Product(name: $_name, description: $_description, price: \$$_price)';
  }

  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'description': _description,
      'price': _price,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['description'],
      json['price'].toDouble(),
    );
  }
}