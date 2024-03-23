import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template_rxdart/core/shared/enum.dart';
import 'package:flutter_template_rxdart/generated/assets.gen.dart';
import 'package:flutter_template_rxdart/models/image_model/image_model.dart';
import 'package:flutter_template_rxdart/pages/charging_animation/widgets/video_play_page.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ItemAnimationPage extends StatefulWidget {
  const ItemAnimationPage(
      {super.key,
      required this.itemAnimation,
      required this.batteryPercent,
      this.addEffect,
      this.isOpenInShotCut,
      this.toggleOnScreen,
      this.tapOnScreen});

  final ImageModel itemAnimation;
  final int batteryPercent;
  final Function? addEffect;
  final bool? isOpenInShotCut;
  final bool? toggleOnScreen;
  final Function? tapOnScreen;

  @override
  State<ItemAnimationPage> createState() => _ItemAnimationPageState();
}

class _ItemAnimationPageState extends State<ItemAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            widget.tapOnScreen?.call();
            debugPrint("Tap on screen in side");
          },
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: VideoPlayerPage(link: widget.itemAnimation.video ?? "")),
        ),
        Positioned(
          top: 80,
          child: Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: (widget.isOpenInShotCut ?? true) ||
                      widget.toggleOnScreen == true,
                  child: GestureDetector(
                    // ignore: deprecated_member_use
                    onTap: () => context.router.pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(top: 10, left: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Assets.icons.iconBack.image(
                        height: 15,
                        width: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Text(
                        DateFormat('HH:mm').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 54,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                          color:
                              getColorByType(widget.itemAnimation.type ?? ""),
                        ),
                      ),
                      Text(
                        DateFormat('EEEE, d MMMM').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                          color:
                              getColorByType(widget.itemAnimation.type ?? ""),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 39,
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 36,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.icons.iconLaze.image(
                        height: 50,
                        width: 50,
                        color: getColorByType(widget.itemAnimation.type ?? ""),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${widget.batteryPercent}%",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color:
                              getColorByType(widget.itemAnimation.type ?? ""),
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: !(widget.isOpenInShotCut ?? false),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pink.shade600,
                          ),
                          child: Assets.icons.iconQuestion.image(
                              height: 30, width: 30, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => widget.addEffect?.call(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.pink.shade600,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.only(right: 16),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 24),
                              child: const Text(
                                "Add Effect",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
