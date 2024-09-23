import 'package:brewly/components/images_path.dart';

class CoffeeShopItems {
  final List<String> coffeeFlavors = [
    'All Coffee',
    'Espresso',
    'Cappuccino',
    'Latte',
    'Americano',
    'Mocha',
    'Macchiato',
    'Affogato',
    'Cortado',
    'Flat White',
    'Irish Coffee'
  ];
  List itemList = [
    {
      'name': 'Flat White',
      'description':
          'A balanced coffee drink made with equal parts espresso, steamed milk, and topped with a frothy milk foam. Great for coffee lovers who enjoy a creamy touch.',
      'img': [
        AppImagesPath().secondImage,
        AppImagesPath().firstImage,
      ],
      'nurtrionalFact':
          'Cappuccino provides around 80 calories with moderate caffeine content and is a good source of calcium when made with milk.',
      'starRating': 4.5,
      'review': [
        {
          'reviewername': 'Sophia',
          'review': 'Perfect balance of coffee and milk',
          'starRating': 4.5
        },
        {
          'reviewername': 'Mark',
          'review': 'Good, but a bit too milky for me',
          'starRating': 4
        },
      ],
      'price': 3.53,
      'tagline': 'Smooth & Creamy',
      'category': 'Espresso',
      'tags': ['Creamy', 'Smooth', 'Popular']
    },
    {
      'name': 'Caffe Mocha',
      'description':
          'A strong, rich coffee brewed by forcing hot water through finely-ground coffee beans. Perfect for coffee purists who love a bold flavor.',
      'img': [
        AppImagesPath().firstImage,
        AppImagesPath().firstImage,
      ],
      'nurtrionalFact':
          'Espresso contains around 63 mg of caffeine per shot, along with essential antioxidants. Low in calories if consumed without sugar or milk.',
      'starRating': 4.8,
      'review': [
        {
          'reviewername': 'John',
          'review': 'Strong and aromatic!',
          'starRating': 5
        },
        {
          'reviewername': 'Anna',
          'review': 'Too strong for my taste',
          'starRating': 3.5
        },
      ],
      'price': 4.53,
      'tagline': 'Pure Coffee Bliss',
      'category': 'Cappuccino',
      'tags': ['Deep Foam', 'Classic', 'Popular']
    },
    {
      'name': 'Latte',
      'description':
          'A smooth coffee made with espresso and steamed milk, topped with a thin layer of foam. Ideal for those who enjoy a subtle coffee flavor.',
      'img': [
        AppImagesPath().thirdImage,
        AppImagesPath().firstImage,
      ],
      'nurtrionalFact':
          'Latte contains around 150 calories with a moderate amount of caffeine. A rich source of calcium from the milk.',
      'starRating': 4.7,
      'review': [
        {
          'reviewername': 'Emma',
          'review': 'Love the silky texture!',
          'starRating': 5
        },
        {
          'reviewername': 'Liam',
          'review': 'A bit too sweet for me',
          'starRating': 4
        },
      ],
      'price': 5.2,
      'tagline': 'Velvety Delight',
      'category': 'espresso',
      'tags': ['Smooth', 'Popular', 'Mild']
    },
    {
      'name': 'Americano',
      'description':
          'A refreshing cold coffee made by diluting espresso with cold water. It’s a light, energizing option perfect for summer.',
      'img': [
        AppImagesPath().fourthImage,
        AppImagesPath().firstImage,
      ],
      'nurtrionalFact':
          'Iced Americano has zero calories if consumed without added sugar or cream. Provides a refreshing caffeine kick with no fat.',
      'starRating': 4.2,
      'review': [
        {
          'reviewername': 'David',
          'review': 'Refreshing and light!',
          'starRating': 4.5
        },
        {
          'reviewername': 'Lucas',
          'review': 'A bit too watery',
          'starRating': 3.5
        },
      ],
      'price': 4.2,
      'tagline': 'Cool & Refreshing',
      'category': 'Cappuccino',
      'tags': ['Iced', 'Low Calorie', 'Popular']
    },
    {
      'name': 'Mocha',
      'description':
          'A rich blend of espresso, steamed milk, and chocolate syrup. Perfect for those who love the fusion of coffee and chocolate.',
      'img': [
        AppImagesPath().fifthImage,
        AppImagesPath().firstImage,
      ],
      'nurtrionalFact':
          'Mocha contains about 250 calories due to the chocolate and milk content, offering a treat with both caffeine and sugar.',
      'starRating': 4.6,
      'review': [
        {
          'reviewername': 'Rachel',
          'review': 'Chocolatey goodness!',
          'starRating': 5
        },
        {'reviewername': 'Jake', 'review': 'A bit too sweet', 'starRating': 4},
      ],
      'price': 4,
      'tagline': 'Chocolate Indulgence',
      'category': 'Cappuccino',
      'tags': ['Rich', 'Sweet', 'Popular']
    },
  ];
}
