import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template_rxdart/generated/assets.gen.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget({
    super.key,
    required this.index,
    required this.battery,
    required this.imageProvider,
    required this.onTapItem,
  });

  final int index;
  final int battery;
  final String imageProvider;
  final Function onTapItem;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isCheck = index % 2 == 0;
    return GestureDetector(
      onTap: () => onTapItem.call(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: width / 2 - 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(imageProvider),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 50,
              right: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.iconLaze.image(
                      height: 30,
                      width: 30,
                      color: isCheck ? Colors.white : Colors.black),
                  Text(
                    "$battery%",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: isCheck ? Colors.white : Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
