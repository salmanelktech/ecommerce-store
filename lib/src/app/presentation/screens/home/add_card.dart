import 'package:eshop/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCreditCardScreen extends StatefulWidget {
  const AddCreditCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCreditCardScreen> createState() => _AddCreditCardScreenState();
}

class _AddCreditCardScreenState extends State<AddCreditCardScreen> {
  final _formKey = GlobalKey<FormState>();
  String selectedCardType = 'mastercard';

  final List<Map<String, dynamic>> cardTypes = [
    {
      'value': 'mastercard',
      'label': 'Mastercard',
      'icon': 'assets/images/mastercard.png',
    },
    {
      'value': 'visa',
      'label': 'Visa',
      'icon': 'assets/images/visa.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.gray03),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add Credit Card',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: AppColors.gray01,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      // Card Number Section
                      _buildLabel('Card Number'),
                      const SizedBox(height: 8),
                      _buildCardNumberField(),

                      const SizedBox(height: 24),

                      // Expiration Date
                      _buildLabel('Expiration Date'),
                      const SizedBox(height: 8),
                      _buildExpirationDateField(),

                      const SizedBox(height: 24),

                      // CVV
                      _buildLabel('CVV'),
                      const SizedBox(height: 8),
                      _buildCVVField(),

                      const SizedBox(height: 24),

                      // Card Holder
                      _buildLabel('Card Holder'),
                      const SizedBox(height: 8),
                      _buildCardHolderField(),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SafeArea(
                top: false,
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Add Card',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
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

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.gray01,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildCardNumberField() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.gray07,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter card number',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.gray03,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                _CardNumberFormatter(),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter card number';
                }
                return null;
              },
            ),
          ),
          PopupMenuButton<String>(
            color: Colors.white,
            position: PopupMenuPosition.under,
            offset: const Offset(0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            itemBuilder: (BuildContext context) {
              return cardTypes.map((type) {
                return PopupMenuItem<String>(
                  value: type['value'],
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Image.asset(
                        type['icon'],
                        width: 40,
                        height: 25,
                      ),
                    ),
                  ),
                );
              }).toList();
            },
            onSelected: (String value) {
              setState(() {
                selectedCardType = value;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Image.asset(
                    cardTypes.firstWhere((type) => type['value'] == selectedCardType)['icon'],
                    width: 40,
                    height: 25,
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildExpirationDateField() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.gray07,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'MM-YY',
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: AppColors.gray03,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(4),
            _ExpirationDateFormatter(),
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter expiration date';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildCVVField() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.gray07,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: '****',
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: AppColors.gray03,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          keyboardType: TextInputType.number,
          obscureText: true,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(4),
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter CVV';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildCardHolderField() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.gray07,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'Enter card holder name',
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: AppColors.gray03,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter card holder name';
            }
            return null;
          },
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
    }
  }
}

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String numbers = newValue.text.replaceAll(' ', '');
    String newString = '';

    for (int i = 0; i < numbers.length; i++) {
      if (i > 0 && i % 4 == 0) {
        newString += ' ';
      }
      newString += numbers[i];
    }

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}

class _ExpirationDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String numbers = newValue.text.replaceAll('-', '');
    String newString = '';

    for (int i = 0; i < numbers.length; i++) {
      if (i == 2) {
        newString += '-';
      }
      newString += numbers[i];
    }

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}