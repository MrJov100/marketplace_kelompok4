import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplace_kelompok4/pages/bottomnav.dart'; // Import BottomNav

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();

  final double productPrice = 300.0;

  void _processPayment() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Payment...')),
    );

    await Future.delayed(const Duration(seconds: 2));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Payment Successful')),
    );

    await Future.delayed(const Duration(seconds: 1));

    // Navigate to BottomNav with initialTabIndex set to 1
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BottomNav(initialTabIndex: 1), // Set to Order tab
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: const Color(0xFFfd6f3e),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCardInput(
                label: "Card Number",
                controller: _cardNumberController,
                hintText: '1234 5678 9012 3456',
                keyboardType: TextInputType.number,
                prefixIcon: Icons.credit_card,
                maxLength: 19,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(19),
                  CardNumberInputFormatter(), 
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildCardInput(
                      label: "MM/YY",
                      controller: _expiryDateController,
                      hintText: 'MM/YY',
                      keyboardType: TextInputType.datetime,
                      prefixIcon: Icons.calendar_today,
                      maxLength: 5,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                        ExpiryDateInputFormatter(), 
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildCardInput(
                      label: "CVC",
                      controller: _cvcController,
                      hintText: 'CVC',
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.security,
                      maxLength: 4,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildCardInput(
                label: "Country/Region",
                controller: _countryController,
                hintText: 'Country/Region',
                prefixIcon: Icons.flag,
              ),
              const SizedBox(height: 16),
              _buildCardInput(
                label: "ZIP Code",
                controller: _zipController,
                hintText: 'ZIP Code',
                keyboardType: TextInputType.number,
                prefixIcon: Icons.location_on,
                maxLength: 6,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  "Total: \$${productPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFfd6f3e),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _processPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 49, 212, 103),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  "Pay \$${productPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardInput({
    required String label,
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    IconData? prefixIcon,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
                hintText: hintText,
                counterText: '',
              ),
              maxLength: maxLength,
              inputFormatters: inputFormatters,
            ),
          ],
        ),
      ),
    );
  }
}


class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'\s+'), '');
    String newText = '';

    for (int i = 0; i < text.length; i++) {
      if (i % 4 == 0 && i != 0) newText += ' ';
      newText += text[i];
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}


class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'/'), '');
    if (text.length > 2) {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    }

    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
