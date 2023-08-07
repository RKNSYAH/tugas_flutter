import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.menu),
            ]),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('How do you like your coffe?'),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 104, 98, 89), width: 1),
                      ),
                      padding: EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'images/kopi.jpg',
                                width: 70,
                                height: 70,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [Text('Long Black'), Text('1000')],
                              )
                            ],
                          ),
                          Row(
                            children: [Icon(Icons.arrow_right)],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 104, 98, 89), width: 1),
                      ),
                      padding: EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'images/kopi.jpg',
                                width: 70,
                                height: 70,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [Text('Long Black'), Text('1000')],
                              )
                            ],
                          ),
                          Row(
                            children: [Icon(Icons.arrow_right)],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 104, 98, 89), width: 1),
                      ),
                      padding: EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'images/kopi.jpg',
                                width: 70,
                                height: 70,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [Text('Long Black'), Text('1000')],
                              )
                            ],
                          ),
                          Row(
                            children: [Icon(Icons.arrow_right)],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
