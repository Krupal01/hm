import 'package:flutter/material.dart';
import 'package:hotel_management/widgets/custom_buttons.dart';
import 'package:hotel_management/widgets/styles.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Widget getDrawerTile(String name, IconData iconData) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: ListTile(
        leading: Icon(
          iconData,
          color: Colors.black,
        ),
        title: Text(
          name,
          style: blackTextStyles['18N'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColorLight,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            padding: EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColorLight,
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container()),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    clipBehavior: Clip.hardEdge,
                    child: Image(
                      image: AssetImage('assets/images/demo.jpg'),
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),
                  Text(
                    "name",
                    style: blackTextStyles['26B'],
                  ),
                  Text(
                    "1111111111",
                    style: blackTextStyles['20N'],
                  ),
                  Text(
                    "(role)",
                    style: blackTextStyles['14N'],
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: double.infinity,
                    height: 0.2,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          getDrawerTile("Total order", Icons.library_books),
          getDrawerTile("Your details", Icons.person),
          getDrawerTile("Forgot password", Icons.password),
          getDrawerTile("Add Food", Icons.fastfood_sharp),
          getDrawerTile("Add User", Icons.person_add),
          getDrawerTile("Add Table", Icons.table_restaurant_sharp),
          Expanded(child: Container()),
          Container(
            width: double.infinity,
            child: CustomTextButton(
              text: "Log out",
              onPress: () {},
            ),
          )
        ],
      ),
    );
  }
}
