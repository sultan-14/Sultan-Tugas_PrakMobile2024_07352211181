import 'dart:async';

enum Role { Admin, Customer }

class Product {
  final String productName;
  final double price;
  final bool inStock;

  Product({
    required this.productName,
    required this.price,
    required this.inStock,
  });
}

class User {
  String name;
  int age;
  Role? role;
  late Map<String, Product> productCatalog; // Menggunakan late

  User({
    required this.name,
    required this.age,
    this.role,
  });

  void viewProducts() {
    if (productCatalog.isEmpty) {
      print("Tidak ada produk tersedia.");
    } else {
      print("Daftar Produk:");
      for (var product in productCatalog.values) {
        print(
            "Nama: ${product.productName}, Harga: Rp${product.price}, Tersedia: ${product.inStock}");
      }
    }
  }
}

class AdminUser extends User {
  AdminUser(
      {required String name,
      required int age,
      required Map<String, Product> productCatalog})
      : super(name: name, age: age, role: Role.Admin) {
    this.productCatalog = productCatalog;
  }

  void addProduct(Product product, Set<String> productSet) {
    try {
      if (!product.inStock) {
        throw Exception(
            "Produk ${product.productName} tidak tersedia dalam stok!");
      }
      if (productSet.add(product.productName)) {
        productCatalog[product.productName] = product;
        print("Produk ${product.productName} berhasil ditambahkan.");
      } else {
        print("Produk ${product.productName} sudah ada di katalog.");
      }
    } catch (e) {
      print("Error saat menambahkan produk: ${e}");
    }
  }

  void removeProduct(String productName) {
    var product = productCatalog[productName];
    if (product != null) {
      productCatalog.remove(productName);
      print("Produk $productName berhasil dihapus.");
    } else {
      print("Produk $productName tidak ditemukan di katalog.");
    }
  }
}

class CustomerUser extends User {
  CustomerUser(
      {required String name,
      required int age,
      required Map<String, Product> productCatalog})
      : super(name: name, age: age, role: Role.Customer) {
    this.productCatalog = productCatalog;
  }
}

Future<void> fetchProductDetails(Product product) async {
  print("Mengambil detail untuk ${product.productName}...");
  await Future.delayed(Duration(seconds: 2));
  print(
      "Detail ${product.productName}: Harga: Rp${product.price}, Tersedia: ${product.inStock}");
}

void main() async {
  Map<String, Product> productCatalog = {};
  Set<String> productSet = {};

  var admin = AdminUser(name: "Alice", age: 30, productCatalog: productCatalog);
  var customer =
      CustomerUser(name: "Bob", age: 25, productCatalog: productCatalog);

  var product1 = Product(productName: "Laptop", price: 15000000, inStock: true);
  var product2 =
      Product(productName: "Smartphone", price: 8000000, inStock: false);
  var product3 =
      Product(productName: "Headphone", price: 2000000, inStock: true);

  admin.addProduct(product1, productSet);
  admin.addProduct(product2, productSet);
  admin.addProduct(product3, productSet);

  admin.removeProduct("Smartphone");

  print("\nProduk yang dapat dilihat oleh Customer:");
  customer.viewProducts();

  print("\nProduk yang dapat dilihat oleh Admin:");
  admin.viewProducts();

  await fetchProductDetails(product1);
}
