import 'package:equatable/equatable.dart';

sealed class ChargingAnimationState extends Equatable {
  const ChargingAnimationState();

  @override
  List<Object> get props => [];
}

final class ChargingAnimationInitial extends ChargingAnimationState {}

final class ChargingAnimationLoading extends ChargingAnimationState {
  final bool needLoading;

  const ChargingAnimationLoading(this.needLoading);

  @override
  List<Object> get props => [needLoading];
}

final class TapOnItemAnimationPage extends ChargingAnimationState {
  final bool toggle;

  const TapOnItemAnimationPage(this.toggle);

  @override
  List<Object> get props => [toggle];
}

final class ChargingAnimationSuccess extends ChargingAnimationState {}

final class OpenAppFromShotcuts extends ChargingAnimationState {}

final class ChargingAnimationError extends ChargingAnimationState {
  final Object error;

  const ChargingAnimationError(this.error);

  @override
  List<Object> get props => [error];
}
