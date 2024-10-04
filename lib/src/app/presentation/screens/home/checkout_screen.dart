import 'package:eshop/src/app/presentation/screens/home/add_card.dart';
import 'package:flutter/material.dart';

import '../../../../../app_colors.dart';
import 'cart.dart';

// Data Models
class ShippingAddress {
  final String id;
  final String title;
  final String address;
  final String phone;
  final bool isDefault;

  ShippingAddress({
    required this.id,
    required this.title,
    required this.address,
    required this.phone,
    this.isDefault = false,
  });
}

class PaymentMethod {
  final String id;
  final String cardType;
  final String lastFourDigits;
  final bool isDefault;

  PaymentMethod({
    required this.id,
    required this.cardType,
    required this.lastFourDigits,
    this.isDefault = false,
  });
}

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // Dummy Data
  final List<ShippingAddress> addresses = [
    ShippingAddress(
      id: '1',
      title: 'Home',
      address: 'fergrgrtgrtgrgth',
      phone: '+12345679797878',
      isDefault: true,
    ),
    ShippingAddress(
      id: '2',
      title: 'Office',
      address: 'efegrgergdgfgdfgdgdgrtgrtgrgr',
      phone: '+12345679797878',
    ),
    ShippingAddress(
      id: '3',
      title: 'My House',
      address: 'fdgdhtyhtbdfghbdrhr',
      phone: '+12345679797878',
    ),
  ];

  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      id: '1',
      cardType: 'visa',
      lastFourDigits: '456',
      isDefault: true,
    ),
    PaymentMethod(
      id: '2',
      cardType: 'mastercard',
      lastFourDigits: '789',
    ),
    PaymentMethod(
      id: '3',
      cardType: 'visa',
      lastFourDigits: '101',
    ),
  ];

  String? selectedAddressId;
  String? selectedPaymentMethodId;

  @override
  void initState() {
    super.initState();
    // Set default selections
    selectedAddressId = addresses.firstWhere((addr) => addr.isDefault).id;
    selectedPaymentMethodId = paymentMethods.firstWhere((pay) => pay.isDefault).id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Checkout',
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
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_bag_outlined, color: AppColors.gray03),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shipping Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Shipping To',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: AppColors.gray01,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        '+  Add New',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.gray04,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Dynamic Address Cards
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final address = addresses[index];
                    return _buildAddressCard(
                      address: address,
                      isSelected: selectedAddressId == address.id,
                      onSelected: (value) {
                        setState(() => selectedAddressId = address.id);
                      },
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Payment Method Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: AppColors.gray01,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCreditCardScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        '+  Add New',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.gray04,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Dynamic Payment Cards
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: paymentMethods.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final paymentMethod = paymentMethods[index];
                    return _buildPaymentCard(
                      paymentMethod: paymentMethod,
                      isSelected: selectedPaymentMethodId == paymentMethod.id,
                      onSelected: (value) {
                        setState(() => selectedPaymentMethodId = paymentMethod.id);
                      },
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Payment Details
                const Text(
                  'Payment Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray01,
                  ),
                ),
                const SizedBox(height: 16),
                _buildPaymentDetail('Sub Total:', '\$35.00'),
                const SizedBox(height: 8),
                _buildPaymentDetail('Shipping Fee:', '\$20.00'),
                const Divider(height: 32),
                _buildPaymentDetail('Total Pay:', '\$55.00', isTotal: true),

                const SizedBox(height: 24),

                // Payment Button
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddressCard({
    required ShippingAddress address,
    required bool isSelected,
    required Function(bool?) onSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        children: [
          Radio(
            value: true,
            groupValue: isSelected,
            onChanged: onSelected,
            activeColor: AppColors.greenColor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray01,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  address.address,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    color: AppColors.gray04,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Mobile: ${address.phone}',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray02,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard({
    required PaymentMethod paymentMethod,
    required bool isSelected,
    required Function(bool?) onSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/${paymentMethod.cardType}.png',
            height: 30,
            width: 50,
          ),
          const SizedBox(width: 16),
          Text(
            '**** **** *${paymentMethod.lastFourDigits}',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: AppColors.gray02,
              ),
          ),

          Spacer(),

          Radio(
            value: true,
            groupValue: isSelected,
            onChanged: onSelected,
            activeColor: AppColors.greenColor,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentDetail(String label, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: isTotal ? 14 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: AppColors.gray03 ,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: isTotal ? 14 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: AppColors.gray01  ,
          ),
        ),
      ],
    );
  }
}