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
                      _buildCategoryItem("Cloths", 'assets/images/dress.png'),
                      _buildCategoryItem("Furniture", 'assets/images/sofa.png'),
                      _buildCategoryItem(
                          "Gadget", 'assets/images/smartwatch.png'),
                      _buildCategoryItem("Cosmetic", 'assets/images/shirt.png'),
                      _buildCategoryItem("Grocery", 'assets/images/food.png'),
                    ],
                  ),
                ),

                // Products Section
                Container(
                  height: screenHeight * 0.26,
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildProductItem(
                          "Face Mask", "\$15", 'assets/images/mask.png', 3.5),
                      _buildProductItem(
                          "Smart Bag", "\$250", 'assets/images/bag.png', 4),
                      _buildProductItem(
                          "Sunglasses", "\$80", 'assets/images/mask.png', 5),
                      _buildProductItem(
                          "Female Bag", "\$150", 'assets/images/womensbag.png',
                          4.5),
                      _buildProductMoreItem('assets/images/watch.png')
                    ],
                  ),
                ),

                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Popular",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Popular Products Section
                Container(
                  height: screenHeight * 0.12,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        _buildPopularProduct('assets/images/chair.png', "Thin Chair", "\$99"),
                        _buildPopularProduct('assets/images/shirts.png', "Formal Shirt", "\$49"),
                        _buildPopularProduct('assets/images/smartwatch.png', "Watch", "\$200"),
                      ],
                    ),
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

    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.greenColor.withOpacity(0.1) : Colors.transparent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? AppColors.greenColor : Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }


  //Function for Category Listview Item
  Widget _buildCategoryItem(String categoryName, String imagePath) {
    return Builder(
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final cardWidth = screenWidth * 0.2;

        return GestureDetector(
          onTap: () {

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
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),

                      // Category Name
                      Center(
                        child: Text(
                          categoryName,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w500
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
      },
    );
  }

  //Function for Product Listview Item
  Widget _buildProductItem(String name, String price, String imagePath, double rating) {
    return Builder(
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final cardWidth = screenWidth * 0.4;

        return Container(
          margin: EdgeInsets.all(5),
          width: cardWidth,
          child: Flexible(
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Icon(
                              Icons.favorite,
                              color: AppColors.gray04,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      name,
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
                          price,
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
                            SizedBox(width: 3),
                            Text(
                              rating.toString(),
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
      },
    );
  }

  //Function for Popular Product Listview Item
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


  Widget _buildPopularProduct(String imagePath, String productName, String price) {
    return Builder(
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final cardWidth = screenWidth * 0.6;

        return GestureDetector(
          onTap: (){

          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: cardWidth,
            child: Flexible(
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
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.contain,
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
                              productName,
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
                                  price,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                  ),
                                ),
                                Spacer(),

                                // Add to Cart Button
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


          ),
        );
      },
    );
  }





}