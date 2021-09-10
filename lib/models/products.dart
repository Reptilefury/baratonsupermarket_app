import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String category;
  final String name;
  final String description;
  final String imgUrl;
  final double price;

  Product(
      {@required this.id,
      @required this.category,
      @required this.name,
      @required this.description,
      @required this.imgUrl,
      @required this.price});
}

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: '1',
      name: 'A4',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/baratonshop.appspot.com/o/A4books.png?alt=media&token=589965ad-900a-441c-bcd8-0c034a10a2ed',
      price: 10,
      category: 'Books',
      description:
          'Baraton\'s A4 Paper format: A4 Booklet Dimensions in milimeters: 210 x 297 mm Dimensions in Centimeters: 21 x 29.7 cm Dimensions in Inches: 8.27 x 11.69 pouces',
    ),
    Product(
      id: '2',
      name: 'Pen',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/baratonshop.appspot.com/o/bicproduct.jpeg?alt=media&token=4f61dde7-2315-4496-bfeb-fe5851fbf182',
      price: 10,
      category: 'BookShop',
      description:
          'Bic Biro Fine Point (Bic Orange) 20pcs Blue. This product has been designed and manufactured to give you complete satisfaction',
    ),
    Product(
      id: '3',
      name: 'Vaseline',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/baratonshop.appspot.com/o/Vasline.jpeg?alt=media&token=b20b7efc-7e9b-4d1f-8424-8691661cc26e',
      price: 50,
      category: 'Laundry Products',
      description:
          'Vaseline Blueseal has many uses, over 101, including personal care, baby care, and beauty. The unique formulation penetrates into surface skin layers and locks in moisture to create a protective barrier. By sealing in moisture, it assists the skin’s natural recovery, rejuvenating visibly dry skin and reducing the appearance of fine, dry lines. Vaseline Jelly creates a barrier that protects skin against environmental factors, with some of its most well-known uses being to restore skin suffering from windburn, minor cuts, scrapes, and burns. It has been used for over 140 years. A moisturiser should be gentle, safe and effective at moisturising and protecting your skin – Vaseline Men Cooling Petroleum Jelly combines all of these properties in one convenient, flip-cap jar.',
    ),
    Product(
      id: '4',
      name: 'Coca Cola',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/baratonshop.appspot.com/o/Zero.jpeg?alt=media&token=076d643d-f5f5-4443-abbe-1e9c42291541',
      price: 40,
      category: 'Drinks',
      description: 'The Coca Cola Pet 1.25L is Now On Jumia Kenya At Carrefour Shop online. You can now order For the Coca Cola Pet 1.25L on Jumia Kenya at the best price and Have It Delivered Right At Your Doorstep.About Carrefour Carrefour, one of the largest hypermarket chains in the world was introduced to the Middle East and North Africa (MENA) market in 1995 by Majid Al Futtaim, the leading shopping mall, retail and leisure pioneer across MENA.Carrefour has become the most dynamic, fast-moving and exciting hypermarket chain in the region and shared its growth with more than 38,000 employees from more than 70 nationalities in 15 countries, providing shoppers with variety and value-for-money. Carrefour ensures customer satisfaction and everyday convenience while offering unbeatable value for money with a vast array of more than 100,000 products, shoppers can purchase items for their every need, whether home electronics or fresh fruits from around the world, to locally produced items. Carrefour opened its first outlet in Kenya in 2016, and currently operates over 250 hypermarkets, supermarkets, and online stores in 15 countries across the region, with plans to extend into 38 countries in the Middle East, Central Asia, Africa and Russia.We always strive to provide the best quality and most diverse selection of household goods available in Kenya. Our value packs and combination discount offers means that we can offer these products at even lower costs, keeping your household essentials at unbeatable prices. Product Name: Coca Cola Pet 1.25L Brand Name: Coca Cola Product Type: Beverages Quality: Top Quality Affordable Price',
    ),
    Product(
      id: '5',
      name: 'Potato Chips',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/baratonshop.appspot.com/o/potatochips.png?alt=media&token=11c94a92-0f9b-4168-8314-10dc163b6109',
      price: 30,
      category: 'Snacks',
      description: 'For the crunchiest, tastiest, yummiest flavoured snacks, try our wide range of AMIGOS Snacks. From the moment they hit your tongue and “crunch” as you bite, they’re bursting full of delicous flavors! Quality you can trust, these AMIGOS snacks are ideal for the young and young at heart. Delight yourself in the rich taste of AMIGOS snacks whether you are at home, school, watching movies or out on the road.',
    ),
    Product(
      id: '6',
      name: 'Vegetables',
      imgUrl: 'https://firebasestorage.googleapis.com/v0/b/baratonshop.appspot.com/o/vegetables.jpeg?alt=media&token=4cc00c85-39d5-49a9-a3f5-a844bbcc67c7',
      price: 20,
      category: 'Grocery',
      description: 'fresh vegetables from UEAB farm come get some at an affordable price. We price per KG',
    ),
    Product(
      id: '7',
      name: 'Milk',
      imgUrl: 'https://firebasestorage.googleapis.com/v0/b/baratonshop.appspot.com/o/Brooksidemilkd.jpeg?alt=media&token=08d43f99-8648-441f-89ae-1393f42fc00e',
      price: 40,
      category: 'Dairy',
      description: 'The ultimate whole milk- uniquely pasteurized to keep the milk safe and maintain milk’s essential nutrients & goodness.  Available flavors: Dairy Best  Available sizes: 500ml  Nutritional Information	Approximate min value per 100g Energy	60 kCal Carbohydrates	4.2 g Protein	3.4 g Fat-max	3.3 g Potassium	122 mg Calcium	106 mg Vitamin A	97 iU Vitamin D	45 iU',
    ),
    Product(
      id: '8',
      name: 'Dettol Handwash',
      imgUrl: 'https://firebasestorage.googleapis.com/v0/b/baratonshop.appspot.com/o/Soap.jpeg?alt=media&token=8700fcdc-df27-488b-864e-da2ad3a052c9',
      price: 50,
      category: 'Detergents',
      description: 'Simple, fast and effective, Dettol Instant Hand Santiser protects against up to 100 illness-causing germs. With no need for soap or water, it’s a great hygiene solution for mums and families needing on the go protection, whilst leaving your hands feeling refreshed & non-sticky..Dettol Antibacterial Original Handwash provides trusted Dettol protection for a wide rangeof unseen germs. It cleanses and protects your skin for a healthy, clean and refreshing feeling everyday. Dettol Antibacterial Original Handwash is a gentle soap with a fresh fragrance, providing trusted Dettol protection. It cleans and protects your skin for a healthy, refreshing feeling everyday. Order for this Dettol Antibacterial Original Hand Wash online from Jumia Kenya and have it delivered to you.',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }
}

// import 'package:flutter/material.dart';
// class Products extends StatefulWidget {
//   const Products({Key key}) : super(key: key);
//
//   @override
//   _ProductsState createState() => _ProductsState();
// }
//
// class _ProductsState extends State<Products> {
//   var product_list = [
//     {
//       "id": '6',
//       "name": 'Acer Aspire',
//       "imgUrl": 'https://www.hilaptop.com/userdata/public/gfx/6060.jpg',
//       "price": 4,
//       "category": 'Laptops',
//       "description": '8 gb ram, mx 150.',
//
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
