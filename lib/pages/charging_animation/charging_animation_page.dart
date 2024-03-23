import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_rxdart/generated/assets.gen.dart';
import 'package:flutter_template_rxdart/pages/base/base_page_mixin.dart';
import 'package:flutter_template_rxdart/pages/charging_animation/bloc/charging_animation_bloc.dart';
import 'package:flutter_template_rxdart/pages/charging_animation/bloc/charging_animation_state.dart';
import 'package:flutter_template_rxdart/pages/widgets/items/item_product.dart';
import 'package:flutter_template_rxdart/routes/router.gr.dart';

@RoutePage()
class ChargingAnimationPage extends StatefulWidget implements AutoRouteWrapper {
  const ChargingAnimationPage({super.key});

  @override
  State<ChargingAnimationPage> createState() => _ChargingAnimationPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ChargingAnimationBloc(),
      child: this,
    );
  }
}

class _ChargingAnimationPageState extends State<ChargingAnimationPage>
    with BasePageMixin {
  ChargingAnimationBloc get _bloc => context.read<ChargingAnimationBloc>();

  @override
  bool? get useAppBarHome => true;

  @override
  Color? get appBarColor => Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChargingAnimationBloc, ChargingAnimationState>(
        bloc: _bloc,
        listener: (context, state) {
          debugPrint("ChargingAnimation listen state");
          debugPrint('$state');
          if (state is OpenAppFromShotcuts) {
            debugPrint('$state');
            if (_bloc.saveItemAnimation.hasValue) {
              context.router.push(ItemAnimationRoute(
                  batteryPercent: _bloc.percentBattery.value,
                  itemAnimation: _bloc.saveItemAnimation.value,
                  isOpenInShotCut: true,
                  toggleOnScreen: _bloc.tapOnScreen.value,
                  tapOnScreen: () {
                    debugPrint("Tap on screen 1");
                    _bloc.tapOnScreen.add(!_bloc.tapOnScreen.value);
                  }));
            }
          } else if (state is TapOnItemAnimationPage) {
            state.toggle
                ? _bloc.tapOnScreen.add(true)
                : _bloc.tapOnScreen.add(false);
          }
        },
        builder: (context, state) => buildPage(context));
  }

  void handleSaveItemAnimation(BuildContext context, int indexItem) {
    _bloc.saveItemAnimation.add(_bloc.listModelAnimation.value[indexItem]);
    _showSuccessMessage();
    // ignore: deprecated_member_use
    context.router.pop();
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1000),
        backgroundColor: Colors.green.shade400,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Row(
          children: [
            Assets.icons.iconSuccess.image(height: 30, width: 30),
            const SizedBox(
              width: 20,
            ),
            const Text(
              "Success",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )
          ],
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          right: 20,
          left: 20,
        ),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) => Container(
              color: Colors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 300,
                  ),
                  itemCount: _bloc.listModelAnimation.value.length,
                  itemBuilder: ((context, index) {
                    return Transform.translate(
                      offset: Offset(0.0, index.isOdd ? 50 : 0.0),
                      child: ItemProductWidget(
                        onTapItem: () => context.router.push(
                          ItemAnimationRoute(
                              itemAnimation:
                                  _bloc.listModelAnimation.value[index],
                              batteryPercent: _bloc.percentBattery.value,
                              addEffect: () =>
                                  handleSaveItemAnimation(context, index)),
                        ),
                        index: index,
                        imageProvider:
                            _bloc.listModelAnimation.value[index].image ?? "",
                        battery: _bloc.percentBattery.value,
                      ),
                    );
                  })),
            ));
  }
}
