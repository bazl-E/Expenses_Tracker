import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FinalBalance extends StatelessWidget {
  final double finalbalance;
  FinalBalance(this.finalbalance);

  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade100,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMd().format(DateTime.now()),
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Final Balance',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              '$finalbalance',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
