import 'package:flutter/material.dart';
import './widgets/cashout.dart';
import './widgets/Chart.dart';
import './model/transaction_model.dart';
import './widgets/undertab.dart';
import './widgets/search_bar.dart';
import './widgets/entry_count.dart';
import './widgets/total_cash_cont.dart';
import './widgets/details_head.dart';
import './widgets/final_Balance.dart';
import './widgets/List.dart';

void main() {
  runApp(CashBook());
}

class CashBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            )),
        primaryColor: Colors.indigo.shade300,
      ),
      debugShowCheckedModeBanner: false,
      title: 'CashBook',
      home: MyHome(),
    );
  }
}

final List<TransactionModel> transctions = [];
List<TransactionModel> get lastTRa {
  return transctions.where((element) {
    return element.date.isAfter(
      DateTime.now().subtract(
        Duration(days: 7),
      ),
    );
  }).toList();
}

List<TransactionModel> get crd {
  return transctions.where((element) {
    return element.amount > 0;
  }).toList();
}

double get credit {
  return crd.fold(0.00, (previousValue, element) {
    return previousValue + element.amount;
  });
}

List<TransactionModel> get dbt {
  return transctions.where((element) {
    return element.amount < 0;
  }).toList();
}

double get debit {
  return dbt.fold(0.00, (previousValue, element) {
    return previousValue + element.amount;
  });
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  void onsave(
    String remarks,
    double amnt,
    DateTime date,
  ) {
    final newtra = TransactionModel(
        remark: remarks,
        amount: amnt,
        date: date,
        id: DateTime.now().toString());

    setState(() {
      transctions.add(newtra);
    });
    print(transctions.length);
    Navigator.of(context).pop();
  }

  void _onDelete(String id) {
    setState(() {
      transctions.removeWhere((element) => element.id == id);
    });
  }

  double get ttlsm {
    return transctions.fold(0.00, (previousValue, element) {
      return previousValue + element.amount;
    });
  }

  void showchart(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Chart(crd, dbt);
        });
  }

  void showBottoSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return UnderTAb(onsave);
        });
  }

  void cashoutSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Cashout(onsave);
        });
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Icon(
              Icons.bookmark,
            ),
            Container(
              margin: EdgeInsets.all(3),
              child: Text(
                'New Book',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.bar_chart), onPressed: () => showchart(context)),
        IconButton(icon: Icon(Icons.picture_as_pdf), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_vert_sharp), onPressed: () {}),
      ],
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    .06,
                child: SearchBar()),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    .04,
                child: EntryCount(transctions)),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    .15,
                child: TotslCash(credit, debit)),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    .06,
                child: DetailsHead()),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    .07,
                child: FinalBalance(ttlsm)),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    .46,
                child: LIstPage(transctions, _onDelete)),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appbar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  .13,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => showBottoSheet(context),
                    icon: Icon(Icons.add),
                    label: Container(
                        padding: EdgeInsets.all(15),
                        child: Text('    Cash In')),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => cashoutSheet(context),
                    icon: Icon(Icons.remove),
                    label: Container(
                      padding: EdgeInsets.all(15),
                      child: Text('  Cash Out'),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
