import 'package:flutter/material.dart';
import 'package:hotel_management/widgets/custom_buttons.dart';
import 'package:hotel_management/widgets/styles.dart';
import 'package:input_quantity/input_quantity.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    Key? key,
    required this.index,
    this.isSelected,
    this.quantity,
    required this.onMenuSelect,
    this.isCategoryVisible,
  }) : super(key: key);
  final int index;
  final bool? isSelected, isCategoryVisible;
  final int? quantity;
  final Function(bool, num?) onMenuSelect;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  late bool _isSelected;
  @override
  void initState() {
    // TODO: implement initState
    _isSelected = widget.isSelected ?? false;
    super.initState();
  }

  void setSelected(bool value) {
    _isSelected = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: widget.isCategoryVisible ?? false,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 2,
            ),
            child: const Text(
              "Category",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/demo.jpg'),
                height: 110,
                width: 110,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Item",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Text(
                        "dsfdfsdjbfjbadbsfbjdbhfbhsbdhfb hjdsbsadfdsfzadsfahfvbhdbsgjbjzxcSAdfsfsadfdsafdfbg",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "\$25",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 40,
                            child: _isSelected == true
                                ? InputQty(
                                    boxDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    btnColor1: Colors.black,
                                    btnColor2: Colors.black,
                                    maxVal: double.maxFinite,
                                    minVal: 0,
                                    showMessageLimit: false,
                                    initVal: 1,
                                    borderShape: BorderShapeBtn.none,
                                    onQtyChanged: (val) {
                                      if (val == 0) {
                                        widget.onMenuSelect(false, val);
                                        setSelected(false);
                                      } else {
                                        widget.onMenuSelect(true, val);
                                      }
                                    },
                                  )
                                : CustomTextButton(
                                    onPress: () {
                                      setSelected(true);
                                    },
                                    text: 'Select',
                                  ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
