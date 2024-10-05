import 'package:eshop/app_colors.dart';
import 'package:eshop/src/app/presentation/screens/home/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final double rating;
  final String imagePath;
  final List<Color> availableColors;
  bool isFavorite;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagePath,
    required this.availableColors,
    this.isFavorite = false,
  });
}

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;
  int selectedColorIndex = 0;

  final product = Product(
    name: 'Formal Shirt',
    description: 'fxdfbdhjsgfhjv hgfsdhv uhuihfuisgv hfishfisuf eugfisgfis gfiygseuyf sgefuygsef gfysugf efgsigf esgfisygf.',
    price: 49.00,
    rating: 4.5,
    imagePath: 'assets/images/dress.png',
    availableColors: [
      const Color(0xFFFFB6C1),
      const Color(0xFFF4A460),
      const Color(0xFF90EE90),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            product.name,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: AppColors.gray01,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
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
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.4,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.gray07,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: IconButton(
                            icon: Icon(
                              product.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: product.isFavorite
                                  ? Colors.red
                                  : AppColors.gray04,
                            ),
                            onPressed: () {
                              setState(() {
                                product.isFavorite = !product.isFavorite;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    // Product Details
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title and Quantity
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.gray01,
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (quantity > 1) {
                                        setState(() => quantity--);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: AppColors.gray05),
                                      child: const Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Icon(
                                          Icons.remove,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text('$quantity'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() => quantity++);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: AppColors.gray03),
                                      child: const Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Icon(
                                          Icons.add,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // Rating
                          Row(
                            children: [
                              const Icon(Icons.star,
                                 color: AppColors.alert, size: 20),
                              Text(
                                product.rating.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.gray03,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Color Options

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Colors Option
                              Row(
                                children: List.generate(
                                  product.availableColors.length,
                                      (index) => Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: ColorOption(
                                      color: product.availableColors[index],
                                      isSelected:
                                      selectedColorIndex == index,
                                      onTap: () {
                                        setState(() {
                                          selectedColorIndex = index;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              // Price
                              Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.greenColor,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Description
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: AppColors.gray01,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.description,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              color: AppColors.gray04,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Add to Cart Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to cart!'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class ColorOption extends StatefulWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorOption({
    Key? key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ColorOption> createState() => _ColorOptionState();
}

class _ColorOptionState extends State<ColorOption> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.85,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.isSelected ? Colors.blue : Colors.grey[300]!,
              width: widget.isSelected ? 2 : 1,
            ),
          ),
          child: Center(
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}