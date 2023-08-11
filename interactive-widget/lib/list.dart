import 'package:flutter/material.dart';

class DaftarKomposisi extends StatefulWidget {
  final String namaMinuman;
  final int harga;
  const DaftarKomposisi(
      {Key? key, required this.namaMinuman, required this.harga})
      : super(key: key);

  @override
  State<DaftarKomposisi> createState() => _DaftarKomposisiState();
}

class _DaftarKomposisiState extends State<DaftarKomposisi> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          setState(() {
            check = !check;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: const Color.fromARGB(255, 104, 98, 89), width: 1),
          ),
          height: 50,
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(check
                      ? Icons.check_box_outline_blank
                      : Icons.check_box_outlined)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.namaMinuman),
                  Text('Rp. ${widget.harga}')
                ],
              ),
              const Row(
                children: [Icon(Icons.arrow_right)],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Komposisi extends StatefulWidget {
  const Komposisi({super.key});

  @override
  State<Komposisi> createState() => _KomposisiState();
}

class _KomposisiState extends State<Komposisi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Komposisi'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 104, 98, 89),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const DaftarKomposisi(
              namaMinuman: 'Susu Kental Manis',
              harga: 2000,
            ),
            const SizedBox(height: 20),
            const DaftarKomposisi(
              namaMinuman: 'Krimer',
              harga: 1000,
            ),
            const SizedBox(height: 20),
            const DaftarKomposisi(
              namaMinuman: 'Extra Gula',
              harga: 500,
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 104, 98, 89)),
                      minimumSize: MaterialStateProperty.all(const Size(250, 50))),
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Pesanan Di Tambahkan'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                  child: const Text('Tambah Pesanan')),
            ))
          ],
        ),
      ),
    );
  }
}
