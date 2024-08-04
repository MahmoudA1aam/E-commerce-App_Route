part of 'home_layer_cubit.dart';

@immutable
sealed class HomeLayerState {}

final class HomeLayerInitialState extends HomeLayerState {}
final class HomeLayerChangeIndexState extends HomeLayerState {}
