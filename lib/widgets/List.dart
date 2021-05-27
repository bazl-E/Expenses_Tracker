import 'package:flutter/material.dart';
import '../model/transaction_model.dart';
import 'package:intl/intl.dart';

class LIstPage extends StatelessWidget {
  final Function deletetx;
  final List<TransactionModel> transctions;

  LIstPage(this.transctions, this.deletetx);

  double tras(index) {
    double bal = 0;

    for (var i = 0; i <= index; i++) {
      bal += transctions[i].amount;
    }

    return bal;
  }

  @override
  Widget build(BuildContext context) {
    return transctions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'NO TRANSACTIONS AVILABLE TO DISPLAY',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                      height: constraints.maxHeight * .4,
                      child: Image.asset('assets/images/songbird.ico')),
                  Text('''                    Add Transaction
  using CashIn/CashOut button below'''),
                  Text('')
                ],
              ),
            );
          })
        : LayoutBuilder(builder: (context, constrains) {
            return Container(
              child: ListView.builder(
                itemBuilder: (cntx, index) {
                  return Container(
                    height: constrains.maxHeight * .23,
                    child: GestureDetector(
                      onHorizontalDragEnd: (_) =>
                          deletetx(transctions[index].id),
                      child: Card(
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          width: double.infinity,
                          height: constrains.maxHeight * .15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Text(
                                      DateFormat.yMMMd()
                                          .format(transctions[index].date),
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: constrains.maxHeight * .03,
                                    ),
                                    Text(
                                      transctions[index].remark,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text(
                                        '${transctions[index].amount}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      width: 90,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            tras(index).toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      behavior: HitTestBehavior.opaque,
                    ),
                  );
                },
                itemCount: transctions.length,
              ),
            );
          });
  }
}
