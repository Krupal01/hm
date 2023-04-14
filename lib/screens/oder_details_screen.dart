import 'package:flutter/material.dart';
import 'package:hotel_management/routes/routes_name.dart';
import 'package:hotel_management/widgets/custom_buttons.dart';
import 'package:hotel_management/widgets/custom_edit_text.dart';
import 'package:hotel_management/widgets/menu_item.dart';
import 'package:hotel_management/widgets/styles.dart';

import '../widgets/custom_app_bar.dart';

class OrderDetailsScreen extends StatefulWidget {
  final bool isDetails;
  final int? orderId;

  const OrderDetailsScreen({Key? key, required this.isDetails, this.orderId})
      : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late TextEditingController _nameController;
  late TextEditingController _mobileController;
  late bool _isUpdate;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "xyz");
    _mobileController = TextEditingController(text: "1234567890");
    _isUpdate = false;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  void _updateDetails() {
    // setState(() {
    //   // widget.name = _nameController.text;
    //   // widget.mobile = _mobileController.text;
    // });
    // Navigator.pop(context);
  }

  void _changeScreenState() {
    _isUpdate = !_isUpdate;
    setState(() {});
  }

  void _submitDetails() {
    // Submit details to backend or perform any other action here
    Navigator.pop(context);
  }

  Widget _buildOrderList() {
    //todo api call and get orders
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return MenuItem(
          index: index,
          onMenuSelect: (p0, p1) {},
        );
      },
    );
  }

  String? _validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username is required';
    } else {
      return null;
    }
  }

  String? _validateMobileNumber(String? mobileNumber) {
    if (mobileNumber == null || mobileNumber.isEmpty) {
      return 'Mobile number is required';
    } else if (mobileNumber.length != 10) {
      return 'Mobile number must be 10 digits';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(mobileNumber)) {
      return 'Mobile number must contain only digits';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.isDetails ? "Order Details" : "New Order",
        isDrawerIcon: false,
        actions: [
          !_isUpdate
              ? IconButton(
                  onPressed: () => _changeScreenState(),
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    _changeScreenState();
                    _updateDetails();
                  },
                  icon: Icon(
                    Icons.check_circle_outline_sharp,
                    color: Theme.of(context).primaryColor,
                  ),
                )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _isUpdate
                        ? CustomTextField(
                            textEditingController: _nameController,
                            hintText: "Client name",
                            labelText: "Client name",
                            validator: _validateUsername,
                          )
                        : Text(
                            _nameController.text,
                            style: primaryTextStyles['20B'],
                          ),
                    const SizedBox(height: 10.0),
                    _isUpdate
                        ? CustomTextField(
                            textEditingController: _mobileController,
                            hintText: "Client mobile number",
                            labelText: "Client mobile number",
                            validator: _validateMobileNumber,
                          )
                        : Text(
                            _mobileController.text,
                            style: primaryTextStyles['20B'],
                          ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        onPress: () =>
                            Navigator.of(context).pushNamed(MENU_SCREEN),
                        text: "+ add",
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    _buildOrderList(),
                    const SizedBox(height: 2.0),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Total Price",
                  style: blackTextStyles['16N'],
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  "\$120",
                  style: primaryTextStyles['26B'],
                ),
                Expanded(child: Container()),
                CustomButton(
                  text: 'Order',
                  onPress: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
