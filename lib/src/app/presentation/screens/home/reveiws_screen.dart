import 'package:eshop/app_colors.dart';
import 'package:flutter/material.dart';

class ReviewModel {
  final String name;
  final String time;
  final String review;
  final double rating;
  final String avatarUrl;

  ReviewModel({
    required this.name,
    required this.time,
    required this.review,
    required this.rating,
    required this.avatarUrl,
  });
}

class ReviewsScreen extends StatelessWidget {
  ReviewsScreen({Key? key}) : super(key: key);

  final List<ReviewModel> reviews = [
    ReviewModel(
      name: 'Mateen',
      time: 'Today, 10:10 AM',
      review: 'I have bought over 10 products from this seller. Wow! What a service, I am impress with their service.',
      rating: 5.0,
      avatarUrl: 'assets/images/profile.png',
    ),
    ReviewModel(
      name: 'Mateen',
      time: 'Today, 10:10 AM',
      review: 'I have bought over 10 products from this seller. Wow! What a service, I am impress with their service.',
      rating: 5.0,
      avatarUrl: 'assets/images/profile.png',
    ),
    ReviewModel(
      name: 'Mateen',
      time: 'Today, 10:10 AM',
      review: 'I have bought over 10 products from this seller. Wow! What a service, I am impress with their service.',
      rating: 5.0,
      avatarUrl: 'assets/images/profile.png',
    ),
    ReviewModel(
      name: 'Mateen',
      time: 'Today, 10:10 AM',
      review: 'I have bought over 10 products from this seller. Wow! What a service, I am impress with their service.',
      rating: 5.0,
      avatarUrl: 'assets/images/profile.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.gray03),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Reviews',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: AppColors.gray01,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: AppColors.gray03),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return ReviewItem(review: reviews[index]);
        },
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final ReviewModel review;

  const ReviewItem({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                review.avatarUrl,
                width: 58,
                height: 58,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.gray01,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    review.time,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: AppColors.gray02,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    review.review,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.gray04,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: List.generate(
                5,
                    (index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;

  const StarRating({
    Key? key,
    required this.rating,
    this.size = 20,
    this.color = AppColors.alert,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating) {
          return Icon(Icons.star, size: size, color: color);
        } else if (index < rating + 0.5) {
          return Icon(Icons.star_half, size: size, color: color);
        } else {
          return Icon(Icons.star_border, size: size, color: color);
        }
      }),
    );
  }
}