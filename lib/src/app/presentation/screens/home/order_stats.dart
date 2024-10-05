import 'package:flutter/material.dart';
import '../../../../../app_colors.dart';

class OrderStatus {
  final String status;
  final String description;
  final String date;
  final bool isCompleted;

  OrderStatus({
    required this.status,
    required this.description,
    required this.date,
    required this.isCompleted,
  });
}

class OrderTrackingScreen extends StatefulWidget {
  OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  final String orderId = "#1234-5678";

  final double amount = 100.00;

  final String eta = "30 Min";

  final List<OrderStatus> orderStatuses = [
    OrderStatus(
      status: "Ready to Pickup",
      description: "Order #12345678 From Esterdi",
      date: "4 Oct",
      isCompleted: true,
    ),
    OrderStatus(
      status: "Order Processed",
      description: "We are preparing your order",
      date: "5 Oct",
      isCompleted: true,
    ),
    OrderStatus(
      status: "Payment Confirmed",
      description: "Awaiting Confirmation",
      date: "6 Oct",
      isCompleted: true,
    ),
    OrderStatus(
      status: "Order Processed",
      description: "We are preparing your order",
      date: "6 Oct",
      isCompleted: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Order Stats',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: AppColors.gray01,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_bag_outlined, color: AppColors.gray03),
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Thu, 15 Aug",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          color: AppColors.gray01,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order ID : $orderId",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray01,
                        ),
                      ),
                      Text(
                        "Amount: \$${amount.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          color: AppColors.gray01,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ETA : $eta",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray01,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.4,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderStatuses.length,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: AppColors.greenColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                if (index != orderStatuses.length - 1)
                                  Container(
                                    width: 2,
                                    height: 50,
                                    color: AppColors.greenColor,
                                  ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    orderStatuses[index].status,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.gray01,
                                    ),
                                  ),
                                  Text(
                                    orderStatuses[index].description,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.gray04,
                                    ),
                                  ),
                                  SizedBox(height: 24),
                                ],
                              ),
                            ),
                            Text(
                              orderStatuses[index].date,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray01,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),


            Expanded(
              flex: 1,
              child: SizedBox(),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Notification Active',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
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
}