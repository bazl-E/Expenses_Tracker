import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UnderTAb extends StatefulWidget {
  final Function onsave;
  UnderTAb(this.onsave);
  @override
  _UnderTAbState createState() => _UnderTAbState();
}

class _UnderTAbState extends State<UnderTAb> {
  void added() {
    final remark = textcontroller.text;
    final amount = double.parse(amountcontroller.text);
    if (remark.isEmpty || amount <= 0 || selecteddate == null) {
      return;
    }
    widget.onsave(
      remark,
      amount,
      selecteddate,
    );
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    ).then((pickeddate) {
      if (pickeddate == null) {
        return;
      }
      setState(() {
        selecteddate = pickeddate;
      });
    });
  }

  DateTime selecteddate;
  final textcontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 800,
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  onSubmitted: (_) => added(),
                  controller: textcontroller,
                  decoration: InputDecoration(
                    labelText: 'Remark',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: amountcontroller,
                  onSubmitted: (_) => added(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        selecteddate == null
                            ? 'Please Pick A Date'
                            : 'Picked Date : ${DateFormat.yMd().format(selecteddate)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                      onPressed: _datePicker,
                      child: Text(
                        'Pick Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: ElevatedButton.icon(
                  onPressed: () => added(),
                  icon: Icon(Icons.save_alt_outlined),
                  label: Text('Save '),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
