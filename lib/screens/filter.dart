import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? selectedLocation;
  String? selectedPrice;

  void _resetFilters() {
    setState(() {
      selectedLocation = null;
      selectedPrice = null;
    });
  }

  void _applyFilters() {
    // Kirimkan data filter ke halaman sebelumnya
    Navigator.pop(context, {
      'location': selectedLocation,
      'price': selectedPrice,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Filter',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: _resetFilters,
            child: const Text(
              'Reset',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lokasi Properti',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: ['Jakarta', 'Bandung', 'Palembang', 'Bogor']
                  .map((location) => ChoiceChip(
                        label: Text(location),
                        selected: selectedLocation == location,
                        onSelected: (selected) {
                          setState(() {
                            selectedLocation = selected ? location : null;
                          });
                        },
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Harga',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: [
                'Diatas Rp 1 Milliar',
                'Dibawah 1 Milliar',
                '1 Milliar - 2 Milliar',
                '2 Milliar - 3 Milliar',
                '3 Milliar - 4 Milliar',
                'Diatas 4 Milliar',
              ]
                  .map((price) => ChoiceChip(
                        label: Text(price),
                        selected: selectedPrice == price,
                        onSelected: (selected) {
                          setState(() {
                            selectedPrice = selected ? price : null;
                          });
                        },
                      ))
                  .toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _applyFilters,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Simpan Filter',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
