import 'package:eshop/src/app/presentation/screens/home/popular_screen.dart';
import 'package:flutter/material.dart';
import 'package:eshop/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  final List<Product> products = [
    Product(name: 'Face Mask', price: 15, rating: 3.5, image: 'assets/images/mask.png'),
    Product(name: 'Smart Bag', price: 250, rating: 4.5,image: 'assets/images/bag.png'),
    Product(name: 'Sunglasses', price: 80,  rating: 2.5,image: 'assets/images/sunglasses.png'),
    Product(name: 'Female Bag', price: 150, rating: 3.5, image: 'assets/images/womensbag.png'),
  ];

  final List<PopularProduct> popularproducts = [
    PopularProduct(imagePath: 'assets/images/chair.png', name: "Thin Chair" , price: 99),
    PopularProduct(imagePath: 'assets/images/sshirt.png', name: "Formal Shirt" , price: 49),
    PopularProduct(imagePath: 'assets/images/smartwatch.png', name: "Watch" , price: 200)
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Title
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Find your favourite Product",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      color: AppColors.gray01,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 20),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.gray07,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                              icon: Icon(Icons.search,color: AppColors.gray04),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),

                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.tune,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),

                // Categories Section
                Container(
                  height: screenHeight * 0.14,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      CategoryItem(categoryName: 'Cloths', imagePath: 'assets/images/dress.png',),
                      CategoryItem(categoryName: 'Furniture', imagePath: 'assets/images/sofa.png',),
                      CategoryItem(categoryName: 'Gadget', imagePath: 'assets/images/smartwatch.png',),
                      CategoryItem(categoryName: 'Cosmetic', imagePath: 'assets/images/shirt.png',),
                      CategoryItem(categoryName: 'Grocery', imagePath: 'assets/images/food.png',),
                    ],
                  ),
                ),

                // Products Section
                Container(
                  height: screenHeight * 0.26,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length + 1,
                    itemBuilder: (context, index) {
                      if (index == products.length) {
                        return _buildProductMoreItem('assets/images/watch.png');
                      } else {
                        // Otherwise, show the ProductCard for each product
                        final product = products[index];
                        return ProductCard(product: product);
                      }
                    },
                  ),
                ),


                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Popular",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: AppColors.gray01,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PopularScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: AppColors.gray04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // Popular Products Section
                Container(
                  height: screenHeight * 0.12,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularproducts.length,
                    itemBuilder: (context, index) {
                      final product = popularproducts[index];
                      return PopularProductCard(popularproduct: product,);
                    },
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),

        child: Container(
          height: screenHeight * 0.11,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIcon(Icons.grid_view, 0),
                _buildIcon(Icons.shopping_bag, 1),
                _buildIcon(Icons.notifications, 2),
                _buildIcon(Icons.person, 3),
              ],
            ),
          ),
        ),
      ),

    );
  }


  // Function for Navigation icon
  Widget _buildIcon(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              _onItemTapped(index);
            },
            splashColor: AppColors.greenColor.withOpacity(0.3),
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            child: Ink(
              decoration: BoxDecoration(
                color: isSelected ? AppColors.greenColor.withOpacity(0.1) : Colors.transparent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                child: Icon(
                  icon,
                  color: isSelected ? AppColors.greenColor : Colors.grey,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
      ],
    );
  }

  //Function for Last Product Listview Item
  Widget _buildProductMoreItem(String imagePath) {
    return Builder(
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final cardWidth = screenWidth * 0.4;

        return GestureDetector(
          onTap:() {

          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: cardWidth,
            child: Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.more_horiz,
                                  size: 40.0,
                                  color: Colors.white,
                                ),
                                Text(
                                  'More',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}


class CategoryItem extends StatefulWidget {
  final String categoryName;
  final String imagePath;

  const CategoryItem({Key? key, required this.categoryName, required this.imagePath}) : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.2;

    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        width: cardWidth,
        child: Flexible(
          child: Container(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.gray07,
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
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              widget.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),

                  // Category Name
                  Center(
                    child: Text(
                      widget.categoryName,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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

    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.4;


    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${widget.product.name} clicked")),
        );
      },
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.green.withOpacity(0.2),
      child: Container(
        margin: EdgeInsets.all(5),
        width: cardWidth,
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
                  ],
                ),
              ],
            ),
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

class PopularProductCard extends StatefulWidget {
  final PopularProduct popularproduct ;

  PopularProductCard({required this.popularproduct});

  @override
  _PopularProductCardState createState() => _PopularProductCardState();
}

class _PopularProductCardState extends State<PopularProductCard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.6;

    return Container(
      margin: EdgeInsets.all(5),
      width: cardWidth,
      child: InkWell(
        onTap: () {

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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.gray07,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            widget.popularproduct.imagePath,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.popularproduct.name,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            '\$' + widget.popularproduct.price.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                          Spacer(),
                          Container(
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
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopularProduct {
  final String imagePath;
  final String name;
  final int price;

  PopularProduct({required this.imagePath, required this.name, required this.price});
}

