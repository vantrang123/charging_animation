import 'package:flutter/material.dart';
import 'package:flutter_template_rxdart/core/utils/extensions/string_extensions.dart';
import 'package:flutter_template_rxdart/generated/assets.gen.dart';

mixin BasePageMixin {
  String? title;
  bool? useAppBarHome;
  Color? appBarColor;

  Widget buildBody(BuildContext context);

  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: title == null ? null : Text(title.content),
    );
  }

  PreferredSizeWidget? buildAppBarHome(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: appBarColor ?? Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => {},
            child: Assets.icons.iconMenu.image(
              height: 30,
              width: 30,
              color: Colors.white,
            ),
          ),
          const Expanded(
            child: Text(
              "Charging animation",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 8.0,
              ),
              child: Assets.icons.iconQuestion.image(
                height: 30,
                width: 30,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  Widget? buildBottomNavigationBar(BuildContext context) {
    return null;
  }

  Widget? buildBottomSheet(BuildContext context) {
    return null;
  }

  Widget? buildDrawer(BuildContext context) {
    return null;
  }

  Widget? buildEndDrawer(BuildContext context) {
    return null;
  }

  Widget? buildFloatActionButton(BuildContext context) {
    return null;
  }

  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: (useAppBarHome ?? false)
          ? buildAppBarHome(context)
          : buildAppBar(context),
      body: buildBody(context),
      bottomNavigationBar: buildBottomNavigationBar(context),
      bottomSheet: buildBottomSheet(context),
      drawer: buildDrawer(context),
      endDrawer: buildEndDrawer(context),
      floatingActionButton: buildFloatActionButton(context),
    );
  }

  bool get resizeToAvoidBottomInset => false;
}
