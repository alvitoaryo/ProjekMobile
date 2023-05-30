import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class KonversiUang extends StatefulWidget {
  const KonversiUang({Key? key}) : super(key: key);

  @override
  State<KonversiUang> createState() => _KonversiUangState();
}

class _KonversiUangState extends State<KonversiUang> {
  TextEditingController _amountController = TextEditingController();
  String selectedCurrencyFrom = 'IDR';
  String selectedCurrencyTo = 'USD';
  Map<String, double> kurs = {
    'IDR': 1.0,
    'USD': 0.000069,
    'JPY': 0.0072,
    'SAR': 0.00027,
    'YEN': 139.0,
    'RIYAL': 3.75,
  };
  double result = 0.0;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void convertCurrency() {
    double amount = double.tryParse(_amountController.text) ?? 0;
    double kursFrom = kurs[selectedCurrencyFrom] ?? 0.0;
    double kursTo = kurs[selectedCurrencyTo] ?? 0.0;

    double convertedAmount = amount * kursTo / kursFrom;

    setState(() {
      result = convertedAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Konversi Mata Uang'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                DropdownButton<String>(
                  value: selectedCurrencyFrom,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedCurrencyFrom = newValue;
                      });
                    }
                  },
                  items: <String>['IDR', 'USD', 'JPY', 'SAR']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                DropdownButton<String>(
                  value: selectedCurrencyTo,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedCurrencyTo = newValue;
                      });
                    }
                  },
                  items: <String>['IDR', 'USD', 'JPY', 'SAR']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: convertCurrency,
                  child: const Text('Konversi'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                  )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Jumlah Mata Uang ($selectedCurrencyFrom)',
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Hasil Konversi: ${result.toStringAsFixed(2)} $selectedCurrencyTo',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
