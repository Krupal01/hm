import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hotel_management/widgets/status_widget.dart';
import 'package:hotel_management/widgets/styles.dart';

class TableWidget extends StatefulWidget {
  const TableWidget(
      {Key? key, required this.onRightSwap, required this.onLeftSwap})
      : super(key: key);
  final VoidCallback onRightSwap;
  final Function(bool isClean) onLeftSwap;
  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  var isClean = false;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<int>(1),
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: const Icon(
          Icons.list_alt_sharp,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        color:
            isClean ? Colors.red : Colors.yellow, //check table is clean or not
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Icon(
          isClean
              ? Icons.cleaning_services_sharp
              : Icons.do_disturb_alt_rounded,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          //api call to set table clean
        } else {
          // navigate to order details screen
        }
      }, // change this int to table model
      confirmDismiss: (direction) async {
        // check condition to dismiss
        if (direction == DismissDirection.endToStart) {
          setState(() {
            isClean =
                !isClean; // call update status api to check clean table or not
          });
          widget.onLeftSwap(isClean);
          return !isClean;
        } else {
          widget.onRightSwap();
          return false;
        }
      },
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const FittedBox(
                    child: Text(
                      '12',
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Client1",
                        style: blackTextStyles['18B'],
                      ),
                      Text(
                        "1111111111",
                        style: primaryTextStyles['14N'],
                      ),
                      Text(
                        '12 items',
                        style: primaryTextStyles['12N'],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '10:30',
                            style: primaryTextStyles['14N'],
                          ),
                          StatusWidget()
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
