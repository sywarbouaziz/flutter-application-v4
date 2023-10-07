class Category {
  final String title;
  final List<String> selections;

  Category({required this.title, required this.selections});
}

class Product {
  final String name;
  final List<String> imageUrls;
  final double cost;
  final String? description;
  final Category category;
  final String productType;

  Product(
      {required this.name,
      required this.imageUrls,
      required this.cost,
      this.description,
      required this.category,
      required this.productType});
       Product copyWith({
    String? name,
    double? cost,
    String? description,
    Category? category,
    String? productType,
  }) {
    return Product(
      name: name ?? this.name,
      cost: cost ?? this.cost,
      description: description ?? this.description,
      category: category ?? this.category,
      productType: productType ?? this.productType,
       imageUrls: [],
    );
  }
}

Category mensCategory = Category(title: 'Men', selections: [
  'Shirts',
  'Jeans',
  'Shorts',
]);
Category womensCategory = Category(title: 'Women', selections: [
  'Shirts',
  'Jeans',
]);
Category petsCategory = Category(title: 'Pets', selections: [
  'Toys',
  'Treats',
]);
List<Product> products = [
  Product(
      name: '2-Pack Crewneck T-Shirts - Black',
      imageUrls: [
        'https://th.bing.com/th/id/R.35b91db87589f4c2640da04cd2156436?rik=0RP2LAjtrh4kHg&riu=http%3a%2f%2f47bf27f91a0b1190a802-5e12d9db40f00b709a94922ff2488490.r40.cf2.rackcdn.com%2fproduct-hugerect-81182-32661-1362643376-a905dab72b012c9acf198186e82776c4.jpg&ehk=TeYTUVJtDo7kml7HrYg56cDJT%2fFMzxBGq05iPEA8rbc%3d&risl=&pid=ImgRaw&r=0',
        'https://th.bing.com/th/id/R.35b91db87589f4c2640da04cd2156436?rik=0RP2LAjtrh4kHg&riu=http%3a%2f%2f47bf27f91a0b1190a802-5e12d9db40f00b709a94922ff2488490.r40.cf2.rackcdn.com%2fproduct-hugerect-81182-32661-1362643376-a905dab72b012c9acf198186e82776c4.jpg&ehk=TeYTUVJtDo7kml7HrYg56cDJT%2fFMzxBGq05iPEA8rbc%3d&risl=&pid=ImgRaw&r=0',
        'https://th.bing.com/th/id/R.35b91db87589f4c2640da04cd2156436?rik=0RP2LAjtrh4kHg&riu=http%3a%2f%2f47bf27f91a0b1190a802-5e12d9db40f00b709a94922ff2488490.r40.cf2.rackcdn.com%2fproduct-hugerect-81182-32661-1362643376-a905dab72b012c9acf198186e82776c4.jpg&ehk=TeYTUVJtDo7kml7HrYg56cDJT%2fFMzxBGq05iPEA8rbc%3d&risl=&pid=ImgRaw&r=0',
        'https://th.bing.com/th/id/R.35b91db87589f4c2640da04cd2156436?rik=0RP2LAjtrh4kHg&riu=http%3a%2f%2f47bf27f91a0b1190a802-5e12d9db40f00b709a94922ff2488490.r40.cf2.rackcdn.com%2fproduct-hugerect-81182-32661-1362643376-a905dab72b012c9acf198186e82776c4.jpg&ehk=TeYTUVJtDo7kml7HrYg56cDJT%2fFMzxBGq05iPEA8rbc%3d&risl=&pid=ImgRaw&r=0'
      ],
      cost: 12.99,
      category: mensCategory,
      productType: 'shirts',
      ),
  Product(
    name: 'Short Sleeve Henley - Blue',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/51BOanZMflL._AC_SX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/51BOanZMflL._AC_SX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/51BOanZMflL._AC_SX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/51BOanZMflL._AC_SX522_.jpg'
    ],
    cost: 17.99,
    category: mensCategory,
    productType: 'shirts',
    
  ),
  Product(
    name: 'Polo RL V-Neck',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/61m68nuygSL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/61URnzIoCPL._AC_UX522_.jpg',
    ],
    cost: 24.99,
    category: mensCategory,
    productType: 'shirts',

  ),
  Product(
    name: 'Athletic-Fit Stretch Jeans',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91SIuLNN%2BlL._AC_UY679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91Qpp%2BRPLtL._AC_UX522_.jpg',
    ],
    cost: 29.99,
    category: mensCategory,
    productType: 'jeans',

  ),
  Product(
    name: "Levi's Original Jeans",
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91L4zjZKF-L._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91Mf37jbSvL._AC_UX522_.jpg',
    ],
    cost: 39.99,
    category: mensCategory,
    productType: 'jeans',

  ),
  Product(
    name: '2-Pack Performance Shorts',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/A1lTY32j6gL._AC_UX679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/71JYOHJ%2BS-L._AC_UX522_.jpg',
    ],
    cost: 19.99,
    category: mensCategory,
    productType: 'shorts',

  ),
  
  

  
  Product(
    name: "Levi's Straight 505 Jeans",
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/51D4eXuwKaL._AC_UX679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/51sHwN6mDzL._AC_UX679_.jpg',
    ],
    cost: 34.99,
    category: womensCategory,
    productType: 'jeans',

  ),
  Product(
    name: "Levi's 715 Bootcut Jeans",
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/81QwSgeXHTL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81qmkt1Be0L._AC_UY679_.jpg',
    ],
    cost: 34.99,
    category: womensCategory,
    productType: 'jeans',

  ),
  Product(
    name: '3-Pack - Squeaky Plush Dog Toy',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/712YaF31-3L._AC_SL1000_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/71K1NzmHCfL._AC_SL1000_.jpg',
    ],
    cost: 9.99,
    category: petsCategory,
    productType: 'toys',
  ),
  Product(
    name: 'Wobble Wag Giggle Ball',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/81XyqDXVwCL._AC_SX355_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81Ye9KrP3pL._AC_SY355_.jpg',
    ],
    cost: 11.99,
    category: petsCategory,
    productType: 'toys',
  ),
  Product(
    name: 'Duck Hide Twists',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/51dS9c0xIdL._SX342_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81z4lvRtc5L._SL1500_.jpg',
    ],
    cost: 8.99,
    category: petsCategory,
    productType: 'treats',
  ),
  Product(
    name: "Zuke's Mini Training Treats",
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/81LV2CHtGKL._AC_SY355_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81K30Bs9C6L._AC_SY355_.jpg',
    ],
    cost: 10.99,
    category: petsCategory,
    productType: 'treats',
  ),
];
 
