import 'package:flutter/material.dart';

class KonversiUang extends StatefulWidget {
  const KonversiUang({Key? key}) : super(key: key);

  @override
  State<KonversiUang> createState() => _KonversiUangState();
}

class _KonversiUangState extends State<KonversiUang> {
  TextEditingController _amountController = TextEditingController();
  double result = 0.0;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Konversi Mata Uang'),
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah Mata Uang (IDR)',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double rupiah = double.tryParse(_amountController.text) ?? 0;
                double kursUSD = 0.000071;
                double usd = rupiah * kursUSD;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Konversi Rupiah ke USD'),
                      content: Text('$rupiah Rupiah = $usd USD'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                    },
                );
                },
              child: const Text('Konversi ke USD'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double rupiah = double.tryParse(_amountController.text) ?? 0;
                double kursSAR = 0.00027;
                double usd = rupiah * kursSAR;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Konversi Rupiah ke SAR'),
                      content: Text('$rupiah Rupiah = $usd SAR'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Konversi ke SAR'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double rupiah = double.tryParse(_amountController.text) ?? 0;
                double kursJPY = 8.77;
                double usd = rupiah * kursJPY;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Konversi Rupiah ke JPY'),
                      content: Text('$rupiah Rupiah = $usd JPY'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Konversi ke JPY'),
            ),
          ],
        ),
      ),
    );
  }
}

