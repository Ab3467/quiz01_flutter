import 'dart:io';

class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class ShoppingCart {
  List<Product> cart = [];

  void addToCart(Product product) {
    cart.add(product);
    print("${product.name} added.");
  }

  void showCart() {
    double total = cart.fold(0, (sum, item) => sum + item.price);
    print("\nCart Items:");
    cart.forEach((p) => print("- ${p.name}: \$${p.price}"));
    print("Total: \$${total.toStringAsFixed(2)}\n");
  }
}

void main() {
  var products = [
    Product("Laptop", 999.99),
    Product("Phone", 599.99),
    Product("Headphones", 199.99),
  ];

  var cart = ShoppingCart();
  products.forEach(cart.addToCart);

  cart.showCart();
  print("Checkout complete.");
}
