
import 'package:eshop/src/app/presentation/screens/home/cart.dart';
import 'package:eshop/src/app/presentation/screens/home/filter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../app_colors.dart';
import 'product_details.dart';


class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  final List<Product> products = [
    Product(name: 'Formal Shirt', price: 49, rating: 3.5, image: 'assets/images/sshirt.png'),
    Product(name: 'Thin Chair', price: 99, rating: 4.5,image: 'assets/images/chair.png'),
    Product(name: 'Speaker', price: 60,  rating: 2.5,image: 'assets/images/speaker.png'),
    Product(name: 'Tree Tob', price: 19, rating: 3.5, image: 'assets/images/tree.png'),
    Product(name: 'Arm Chair', price: 99, rating: 5.0, image: 'assets/images/cchair.png'),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
          title: const Text(
            'Popular',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: AppColors.gray01,
            ),
          ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: AppColors.gray03),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.gray03),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: FilterSortButton(
                            icon: Icons.sort,
                            text: 'Sort',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: FilterSortButton(
                            icon: Icons.filter_list,
                            text: 'Filter',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
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
    );
  }
}

class FilterSortButton extends StatefulWidget {
  final IconData icon;
  final String text;

  const FilterSortButton({super.key, required this.icon, required this.text});

  @override
  State<FilterSortButton> createState() => _FilterSortButtonState();
}

class _FilterSortButtonState extends State<FilterSortButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
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
          builder: (context) => const FiltersScreen(),
        ),
      );
    });
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _onTapCancel,
      child: Transform.scale(
        scale: 1 - _controller.value,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                Icon(
                  widget.icon,
                  color: Colors.black,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.text,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
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
