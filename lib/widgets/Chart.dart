import 'package:flutter/material.dart';
import '../widgets/outbar.dart';
import 'package:intl/intl.dart';
import '../model/transaction_model.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<TransactionModel> recentTransaction;
  final List<TransactionModel> outTransaction;
  Chart(this.recentTransaction, this.outTransaction);
  List<Map<String, Object>> get lastwk {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(Duration(days: index));
        double totalamount = 0;
        for (var i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weekday.day &&
              recentTransaction[i].date.month == weekday.month &&
              recentTransaction[i].date.year == weekday.year) {
            totalamount += recentTransaction[i].amount;
          }
        }
        return {
          'date': DateFormat.E().format(weekday).substring(0, 2),
          'amount': totalamount
        };
      },
    ).reversed.toList();
  }

  List<Map<String, Object>> get outtra {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(Duration(days: index));
        double totalamount = 0;
        for (var i = 0; i < outTransaction.length; i++) {
          if (outTransaction[i].date.day == weekday.day &&
              outTransaction[i].date.month == weekday.month &&
              outTransaction[i].date.year == weekday.year) {
            totalamount += (outTransaction[i].amount * -1);
          }
        }
        return {
          'date': DateFormat.E().format(weekday).substring(0, 2),
          'amount': totalamount
        };
      },
    ).reversed.toList();
  }

  double get factor {
    return recentTransaction.fold(
      0.00,
      (previousValue, element) {
        return previousValue + element.amount;
      },
    );
  }

  double get outfc {
    return outTransaction.fold(
      0.00,
      (previousValue, element) {
        return previousValue + (element.amount * -1);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Last week progression',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 10),
          Text(
            'CashIn',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Theme.of(context).primaryColor),
          ),
          Card(
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: lastwk.map((ind) {
                    return Expanded(
                      child: Bar(
                        ind['amount'],
                        ind['date'],
                        (factor == 0.0
                            ? 0
                            : (ind['amount'] as double) / factor),
                      ),
                    );
                  }).toList()),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'CashOut',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),
          ),
          Card(
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: outtra.map((ind) {
                    return Expanded(
                      child: OutBar(
                        ind['amount'],
                        ind['date'],
                        (factor == 0.0 ? 0 : (ind['amount'] as double) / outfc),
                      ),
                    );
                  }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}
