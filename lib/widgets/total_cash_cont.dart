import 'package:flutter/material.dart';

class TotslCash extends StatelessWidget {
  final double totalcashin;
  final double totalcashout;
  TotslCash(this.totalcashin, this.totalcashout);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 5,
                      bottom: 15,
                      right: 5,
                    ),
                    child: Icon(
                      Icons.add_circle_outline_sharp,
                      color: Colors.green,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          'Total Cash In',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 25,
                        padding: EdgeInsets.all(3),
                        child: Text(
                          '${totalcashin.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 35,
              ),
              padding: EdgeInsets.symmetric(vertical: 8),
              child: VerticalDivider(
                thickness: 3,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 35),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 5,
                      bottom: 15,
                      right: 5,
                    ),
                    child: Icon(
                      Icons.remove_circle_outline_rounded,
                      color: Colors.redAccent,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          'Total Cash Out',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          '${totalcashout.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
