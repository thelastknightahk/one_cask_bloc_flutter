import 'package:clevit_flutter_bloc/core/enum/bottom_nav_item.dart';
import 'package:equatable/equatable.dart';
 

abstract class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object?> get props => [];
}

class BottomNavChanged extends BottomNavEvent {
  final BottomNavItem selected;

  const BottomNavChanged(this.selected);

  @override
  List<Object?> get props => [selected];
}
