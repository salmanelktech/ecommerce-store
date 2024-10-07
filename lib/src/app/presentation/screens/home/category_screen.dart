import 'package:eshop/app_colors.dart';
import 'package:eshop/src/app/presentation/screens/home/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Searchbar.dart';

final List<Map<String, dynamic>> dummyItems = [
  {'name': 'Plastic table', 'category': 'Table'},
  {'name': 'New office table', 'category': 'Table'},
  {'name': 'Leather sofa', 'category': 'Furniture'},
  {'name': 'Wooden chair', 'category': 'Furniture'},
  {'name': 'Wardrobe', 'category': 'Almari'},
  {'name': 'Closet', 'category': 'Almari'},
];


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});


  @override
  State<CategoryScreen> createState() => _CategoryScreenState();


}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  final List<Map<String, dynamic>> _allItems = dummyItems;

  @override
  void initState() {
    super.initState();
  }

  void _handleSearch(String query) {
    setState(() {
    });
  }

  void _handleCategorySelection(String category) {
    setState(() {
    });
  }

   int itemcount = 10;

   String category = "Gadzet";

  final List<Product> products = [
    Product(name: 'Formal Shirt', price: 49, rating: 3.5, image: 'assets/images/sshirt.png'),
    Product(name: 'Thin Chair', price: 99, rating: 4.5,image: 'assets/images/chair.png'),
    Product(name: 'Speaker', price: 60,  rating: 2.5,image: 'assets/images/speaker.png'),
    Product(name: 'Tree Tob', price: 19, rating: 3.5, image: 'assets/images/tree.png'),
    Product(name: 'Arm Chair', price: 99, rating: 5.0, image: 'assets/images/cchair.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                          ),
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      SearchBarWithDropdown(
                        items: _allItems,
                        onSearch: _handleSearch,
                        onCategorySelected: _handleCategorySelection,
                      ),

                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [

                                const Text(
                                  "Category: ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    color: AppColors.gray04,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(width: 10),

                                Text(
                                  category,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    color: AppColors.greenColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                              ],
                            ),

                            Row(
                              children: [
                                Text(
                                  "$itemcount items",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    color: AppColors.gray02,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(width: 10),

                                const Icon(
                                  Icons.dashboard,
                                  color: AppColors.gray01,
                                )
                              ],
                            )
                          ],
                        ),
                      ),




                    ],
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> with SingleTickerProviderStateMixin {
  bool isFavorite = false;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller,         curve: Curves.easeOutQuart,
          reverseCurve: Curves.easeInQuart),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    Future.delayed(const Duration(milliseconds: 100), () {
      _controller.reverse();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const ProductDetailsPage(),
        ),
      );
    });
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.gray07,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      widget.product.image,
                                      width: 110,
                                      height: 128,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(isFavorite
                                          ? "Added to Favorites"
                                          : "Removed from Favorites"),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(20),
                                splashColor: Colors.red.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: isFavorite
                                        ? Colors.red
                                        : AppColors.gray04,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.alert,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.product.rating.toString(),
                            style: const TextStyle(
                              fontSize: 9,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray03,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.gray01,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '\$${widget.product.price}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: AppColors.greenColor,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Added to cart")),
                              );
                            },
                            borderRadius: BorderRadius.circular(50),
                            splashColor: Colors.green.withOpacity(0.2),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );


  }
}

class Product {
  final String name;
  final int price;
  final double rating;
  final String image;

  Product({required this.name, required this.price, required this.rating, required this.image});
}
