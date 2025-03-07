import 'dart:io';

// Product class
class Product {
String name;
double price;

Product(this.name, this.price);
}

// ShoppingCart class
class ShoppingCart {
List<Product> cart = [];

void addProduct(Product product) {
cart.add(product);
print("${product.name} added to cart.");
}

void viewCart() {
if (cart.isEmpty) {
print("Your cart is empty.");
return;
}

    double total = 0;
    print("\nYour Cart:");
    for (var i = 0; i < cart.length; i++) {
      print("${i + 1}. ${cart[i].name} - \$${cart[i].price}");
      total += cart[i].price;
    }
    print("Total Cost: \$${total.toStringAsFixed(2)}\n");
}
}

void main() {
List<Product> products = [
Product("Laptop", 999.99),
Product("Phone", 599.99),
Product("Headphones", 199.99),
Product("Mouse", 49.99),
Product("Keyboard", 79.99),
];

ShoppingCart cart = ShoppingCart();

while (true) {
print("\nAvailable Products:");
for (var i = 0; i < products.length; i++) {
print("${i + 1}. ${products[i].name} - \$${products[i].price}");
}
print("\nOptions:");
print("1. Add product to cart");
print("2. View cart");
print("3. Exit");

    stdout.write("Enter your choice: ");
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        stdout.write("Enter product number to add to cart: ");
        String? prodInput = stdin.readLineSync();
        int? index = int.tryParse(prodInput ?? "");

        if (index != null && index > 0 && index <= products.length) {
          cart.addProduct(products[index - 1]);
        } else {
          print("Invalid product number!");
        }
        break;

      case '2':
        cart.viewCart();
        break;

      case '3':
        print("Thank you for shopping! Exiting...");
        exit(0);

      default:
        print("Invalid option! Please try again.");
    }
}
}