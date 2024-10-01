
import 'package:eshop/src/app/presentation/screens/home/FiltersScreen.dart';
import 'package:flutter/material.dart';

import '../../../../../app_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PopularScreen(),
    );
  }
}

class PopularScreen extends StatelessWidget {
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
        title: Text('Popular'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              icon: Icon(Icons.shopping_bag_outlined),
              onPressed: () {

              },
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
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
                          padding: const EdgeInsets.all(10.0),
                          child: FilterSortButton(
                            icon: Icons.sort,
                            text: 'Sort',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
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
          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 20.0),
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

class FilterSortButton extends StatelessWidget {
  final IconData icon;
  final String text;

  FilterSortButton({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  FiltersScreen(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.green.withOpacity(0.2),
      highlightColor: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class ProductCard extends StatefulWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${widget.product.name} clicked")),
        );
      },
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.green.withOpacity(0.2),
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: Offset(0, 2),
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
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.alert,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    widget.product.rating.toString(),
                    style: TextStyle(
                      fontSize: 9,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray03,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Text(
                widget.product.name,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray01,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '\$' + widget.product.price.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColors.greenColor,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Added to cart")),
                      );
                    },
                    borderRadius: BorderRadius.circular(50),
                    splashColor: Colors.green.withOpacity(0.2),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
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
