import 'package:flutter/material.dart';

class DescriptionWidget extends StatefulWidget {
  final int index;

  const DescriptionWidget({Key? key, required this.index}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            _getDescription(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromRGBO(64, 64, 64, 1),
              fontFamily: 'Manrope',
              fontSize: 32,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _getDescriptionDetail(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromRGBO(117, 117, 117, 1),
              fontFamily: 'Manrope',
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  String _getDescription() {
    switch (widget.index) {
      case 0:
        return 'Biggest Sell at Your Fingerprint';
      case 1:
        return 'Pay Secure Payment Gateway';
      case 2:
        return 'Get Faster and Safe Delivery';
      default:
        return 'Error';
    }
  }

  String _getDescriptionDetail() {
    switch (widget.index) {
      case 0:
        return 'Find your best products from popular shop without any delay';
      case 1:
        return 'Find your best products from popular shop without any delay';
      case 2:
        return 'Find your best products from popular shop without any delay';
      default:
        return '';
    }
  }
}
