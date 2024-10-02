import 'package:eshop/app_colors.dart';
import 'package:flutter/material.dart';

class SearchBarWithDropdown extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final Function(String) onSearch;
  final Function(String) onCategorySelected;

  const SearchBarWithDropdown({
    Key? key,
    required this.items,
    required this.onSearch,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  _SearchBarWithDropdownState createState() => _SearchBarWithDropdownState();
}

class _SearchBarWithDropdownState extends State<SearchBarWithDropdown> {
  bool _showDropdown = false;
  String _searchQuery = '';
  String _selectedCategory = '';
  List<String> _categories = [];
  List<Map<String, dynamic>> _filteredItems = [];
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _categories = _extractCategories();
    if (_categories.isNotEmpty) {
      _selectedCategory = _categories[0];
    }
    _filterItems();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      setState(() {
        _showDropdown = false;
      });
    }
  }

  List<String> _extractCategories() {
    Set<String> categoriesSet = widget.items.map((item) => item['category'] as String).toSet();
    return categoriesSet.toList();
  }

  void _filterItems() {
    _filteredItems = widget.items.where((item) {
      return item['name'].toLowerCase().contains(_searchQuery.toLowerCase()) &&
          (_selectedCategory.isEmpty || item['category'] == _selectedCategory);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          _showDropdown = false;
        });
      },
      child: Column(
        children: [
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
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: AppColors.gray04),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                          _filterItems();
                          _showDropdown = true;
                        });
                        widget.onSearch(value);
                      },
                      onTap: () {
                        setState(() {
                          _showDropdown = true;
                        });
                      },
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
          if (_showDropdown)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 8,
                        children: _categories.map((category) {
                          return ChoiceChip(
                            label: Text(category),
                            selected: _selectedCategory == category,
                            onSelected: (selected) {
                              setState(() {
                                _selectedCategory = selected ? category : '';
                                _filterItems();
                              });
                              widget.onCategorySelected(_selectedCategory);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.transparent),
                            ),
                            backgroundColor: AppColors.gray06,
                            selectedColor: AppColors.greenColor,
                            labelStyle: TextStyle(
                              color: _selectedCategory == category ? Colors.white : Colors.black,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  ..._filteredItems.take(5).map((item) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Container(
                        height: 30,
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                          leading: Icon(Icons.close, size: 18, color: AppColors.gray04),
                          title: Text(
                            item['name'],
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: AppColors.gray04
                            ),
                          ),
                          onTap: () {
                            // Handle item selection
                            setState(() {
                              _showDropdown = false;
                            });
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}