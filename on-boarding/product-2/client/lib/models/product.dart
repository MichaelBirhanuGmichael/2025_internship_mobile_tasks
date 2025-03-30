class Product {
  String _name;
  String _description;
  double _price;

  // Constructor
  Product(this._name, this._description, this._price);

  // Getters
  String get name => _name;
  String get description => _description;
  double get price => _price;

  // Setters
  set name(String newName) => _name = newName;
  set description(String newDescription) => _description = newDescription;
  set price(double newPrice) => _price = newPrice;

  // Override toString for easy printing
  @override
  String toString() {
    return 'Product(name: $_name, description: $_description, price: \$$_price)';
  }
}
