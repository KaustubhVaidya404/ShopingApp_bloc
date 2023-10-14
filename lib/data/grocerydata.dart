class GroceryData{

  static List<Map<String, dynamic>> groceryProducts = [
    // {
    //   'id': '1',
    //   'name': 'Organic Apples',
    //   'description': 'Organic Apples freshly picked from farm',
    //   'price': 2.99,
    //   'imageUrl': 'data:image/jpeg;base64,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',
    // },
    {
      'id': '1',
      'name': 'Whole Wheat Bread',
      'description': 'Whole Wheat Bread, with 0 trans fat',
      'price': 3.49,
      'imageUrl': 'https://img.freepik.com/free-photo/top-view-fresh-dark-bread-dark-desk_179666-27221.jpg',
    },
    // {
    //   'id': '3',
    //   'name': 'Fresh Milk',
    //   'description': 'Fresh Milk, from Cow',
    //   'price': 1.99,
    //   'imageUrl': 'https://png.pngtree.com/png-vector/20210324/ourlarge/pngtree-fresh-milk-splash-cup-drink-png-image_3113488.jpg',
    // },
    {
      'id': '2',
      'name': 'Organic Spinach',
      'description': 'Organic Spinach, directly to your home',
      'price': 2.49,
      'imageUrl': 'https://storage.needpix.com/rsynced_images/spinach-tasty.jpg',
    },
    {
      'id': '3',
      'name': 'Tomatoes',
      'description': 'Tomatoes, vary expensive item you know',
      'price': 0.99,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUdW-Qa9fNbxIyjiURhW7wtatrjvkh5dliMwIVgCPC&s',
    },
    {
      'id': '4',
      'name': 'Ground Coffee',
      'description': 'Ground Coffee, suggested to be drink with milk donot drink it directly',
      'price': 5.99,
      'imageUrl': 'https://img.freepik.com/premium-photo/pile-ground-coffee-coffee-beans-isilated-white_434420-1027.jpg',
    },
  ];


}