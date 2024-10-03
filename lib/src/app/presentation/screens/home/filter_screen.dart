import 'package:eshop/app_colors.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  String selectedCategory = 'Furniture';
  RangeValues _currentRangeValues = RangeValues(10, 500);
  String sortBy = 'Lowest';
  int selectedRating = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text(
          'Filters',
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: AppColors.gray01,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: TextButton(
              child: Text(
                'Reset all',
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  color: AppColors.greenColor,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {


              },
            ),
          ),
        ],
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Categories', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: AppColors.gray01, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    'Furniture', 'Electronics', 'Mobile', 'Cloth',
                    'Computer', 'Food', 'Drag', 'Gadget',
                    'Baby & Kids', 'Cosmatics', 'Gym & Sports'
                  ].map((category) => FilterChip(
                    label: Text(category ),
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
                      side: BorderSide(color: Colors.transparent),
                    ),
                  )).toList(),
                ),
                SizedBox(height: 20),
                Text('Price', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: AppColors.gray01, fontWeight: FontWeight.bold)),
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
                SizedBox(height: 20),
                Text('Sort By', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: AppColors.gray01, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
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
                      side: BorderSide(color: Colors.transparent),
                    ),
                  )).toList(),
                ),
                SizedBox(height: 20),
                Text('Rating', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: AppColors.gray01, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Column(
                  children: List.generate(5, (index) => 5 - index).map((rating) =>
                      Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(rating, (index) =>
                                Icon(Icons.star, color: Colors.amber, size: 20)
                            ),
                          ),
                          Spacer(),
                          Radio<int>(
                            value: rating,
                            groupValue: selectedRating,
                            activeColor: Colors.green,
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
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('Apply Filter', style: TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenColor,
                      padding: EdgeInsets.symmetric(vertical: 18),
                    ),
                    onPressed: () {
        
        
                    },
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