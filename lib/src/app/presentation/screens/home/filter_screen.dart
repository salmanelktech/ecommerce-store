import 'package:eshop/app_colors.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  String selectedCategory = 'Furniture';
  RangeValues _currentRangeValues = const RangeValues(10, 500);
  String sortBy = 'Lowest';
  int selectedRating = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text(
          'Filters',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: AppColors.gray01,
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              'Reset all',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                color: AppColors.greenColor,
              ),
              textAlign: TextAlign.justify,
            ),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.gray03),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Categories',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: AppColors.gray01,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        'Furniture', 'Electronics', 'Mobile', 'Cloth',
                        'Computer', 'Food', 'Drag', 'Gadget',
                        'Baby & Kids', 'Cosmatics', 'Gym & Sports'
                      ].map((category) => FilterChip(
                        label: Text(category),
                        selected: selectedCategory == category,
                        onSelected: (selected) {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                        backgroundColor: AppColors.white,
                        selectedColor: AppColors.greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.transparent),
                        ),
                      )).toList(),
                    ),
                    const SizedBox(height: 20),
                    const Text('Price',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: AppColors.gray01,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    RangeSlider(
                      values: _currentRangeValues,
                      min: 10,
                      max: 1000,
                      divisions: 99,
                      activeColor: AppColors.greenColor,
                      inactiveColor: AppColors.gray07,
                      labels: RangeLabels(
                        '\$${_currentRangeValues.start.round()}',
                        '\$${_currentRangeValues.end.round()}',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Sort By',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: AppColors.gray01,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      children: ['Lowest', 'Highest', 'Best', 'Newest'].map((sort) => ChoiceChip(
                        label: Text(sort),
                        selected: sortBy == sort,
                        onSelected: (selected) {
                          setState(() {
                            sortBy = sort;
                          });
                        },
                        backgroundColor: AppColors.white,
                        selectedColor: AppColors.greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.transparent),
                        ),
                      )).toList(),
                    ),
                    const SizedBox(height: 20),
                    const Text('Rating',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: AppColors.gray01,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: List.generate(5, (index) => 5 - index).map((rating) =>
                          Row(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(rating, (index) =>
                                const Icon(Icons.star, color: AppColors.alert, size: 20)
                                ),
                              ),
                              const Spacer(),
                              Radio<int>(
                                value: rating,
                                groupValue: selectedRating,
                                activeColor: AppColors.greenColor,
                                onChanged: (value) {
                                  setState(() {
                                    selectedRating = value!;
                                  });
                                },
                              ),
                            ],
                          )
                      ).toList(),
                    ),
                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                            'Apply Filter',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            )
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}