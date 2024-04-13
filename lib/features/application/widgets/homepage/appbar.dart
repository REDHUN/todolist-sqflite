import 'package:flutter/material.dart';
import 'package:todoapp/features/application/services/colors.dart';
import 'package:todoapp/features/application/widgets/homepage/home_textfiled.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key, required this.trashLength});
  final int trashLength;

  @override
  Widget build(BuildContext context) {
    Widget isTrashed = Container();
    if (trashLength > 0) {
      isTrashed = const Positioned(
          child: CircleAvatar(
        radius: 7,
        backgroundColor: Colors.red,
      ));
    }
    return Container(
      decoration: BoxDecoration(
          color: AppColor.appBarColor,
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(40))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.density_medium_outlined,
                          size: 30,
                          color: AppColor.appBarIconColor,
                        ),
                      ),
                      isTrashed
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'All List',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColor.appBarTextColor),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: AppColor.appBarIconColor,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.perm_identity_rounded),
                ),
              )
            ],
          ),
          const HomeTextFiled()
        ],
      ),
    );
  }
}
