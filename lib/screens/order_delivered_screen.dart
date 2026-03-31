import 'package:flutter/material.dart';
import '../theme_provider.dart';

class OrderDeliveresScreen extends StatelessWidget{
  const OrderDeliveresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = isDarkMode((context);
    final bgColor = dark ? AppColors.darkBackground : Colors.white;
    final titleColor = dark ? Colors.white : Colors.black;
    final subColor = dark ? Colors.grey[400]! : Colors.grey[600]!;
    final cardBG =dark ? Colors.grey[800]! : Colors.grey[200]!;
    final labelColor = dark ? Colors.grey[500]! : Colors.grey[600]!;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        centerTitles : true,
        title: Text(
          'My Profile',
          style: TextStyle(
            fontSize : 17,
            fontWeight : FontWeight.bold,
            color : titleColor,
          ), //TextStyle
        ), //Text
        leading : Padding (
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar (
              backgroundColor: dark ? AppColors.darkSurface 
              child: IconButton(
                icon:Icon(
                  Icon: Icon(
                    size:18,
                    color: dark ? Colors.white : Colors.black,

                  ),//Icon
                  onPressed: () => Navigator.pop(context),
                ),//IconButton
              ),//CircleAvatar
          ), //Padding

          actions:[
            Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: IconButton(
                icon : Icon(
                  Icons.close,
                  size:18,
                   color: dark ? colors.white : Colors.black,
                ),//Icon
                onPressed: () => Navigator.pop(context),
              ),//IconButton
             ),//CircleAvatar
          ),//Padding
        ],
      ),//AppBar
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                 // ── Success Icon ──
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green[500],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withValues(alpha: 0.3),
                          blurRadius: 20,
                          spreadRadius: 4,
                        ),//BoxShadow
                      ],
                    ),//BoxDecoration
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 38,
                    ),//Icon
                  ),//Container

                  const SizedBox(height: 20),

                  // ── Order Delivered Title ──
                  Text(
                    'Order Delivered !',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),//TextStyle
                  ),//Text
                  const SizedBox(height: 8),
                  Text(
                    'Sunil has Successfully delivered your tools',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: subColor),
                  ),//Text

                  const SizedBox(height: 20),

                  // Delivery Image Placeholder
                  Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: dark ? const Color(0xFF1E3350) : Colors.grey[200],
                    ),//BoxDecoration
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: dark
                                    ? [
                                        const Color(0xFF2A3F5A),
                                        const Color(0xFF1A2E4A),
                                      ]
                                    : [
                                        const Color(0xFF4A6B8A),
                                        const Color(0xFF3A5A7A),
                                      ],
                              ),//LinearGradient
                            ),//BoxDecoration
                          ),//Container
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.local_shipping,
                                  size: 48,
                                  color: Colors.white.withValues(alpha: 0.5),
                                ),//Icon
                                const SizedBox(height: 6),
                                Icon(
                                  Icons.handyman,
                                  size: 36,
                                  color: Colors.white.withValues(alpha: 0.4),
                                ),//Icon
                              ],
                            ),//Colomn
                          ),//Center
                        ],
                      ),//Stack
                    ),//ClipRRect
                  ),//container

                  const SizedBox(height: 24),

                  // Order Summary
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: borderColor),
                    ),//BoxDecoration
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Summary',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: titleColor,
                          ),//TextStyle
                        ),//Text
                        const SizedBox(height: 16),
                        _summaryRow(
                          'Subtotal',
                          'Rs. 5,000',
                          labelColor,
                          titleColor,
                        ),
                        const SizedBox(height: 10),
                        _summaryRow(
                          'Delivery Fee',
                          'Rs. 250',
                          labelColor,
                          titleColor,
                        ),
                        const SizedBox(height: 14),
                        Divider(color: borderColor),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: titleColor,
                              ),//TextStyle
                            ),//Text
                            Text(
                              'Rs. 5,250',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBlue,
                              ),//TextStyle
                            ),//Text
                          ],
                        ),//Row
                      ],
                    ),// Colomn
                  ),//Container

                  const SizedBox(height: 24),
                ],
              ),//
            ),//SingleChildScrollView
          ),//Expanded
 
          //Confirm and Close Button
          Padding(
             padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
             child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandYellow,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),//RoundedRectangleBorder
                ),
                child: const Text(
                  'Confirm & Close',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),//Text
              ),//ElevatedButton
            ),//SizedBox
          ),//Padding
        ],
      ),//Column
    );//Scaffold
  }

   Widget _summaryRow(
    String label,
    String value,
    Color labelColor,
    Color valueColor,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 13, color: labelColor)),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),//TextStyle
        ),//Text
      ],
    );//Row
  }
}