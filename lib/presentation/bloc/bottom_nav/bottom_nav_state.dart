import 'package:clevit_flutter_bloc/core/enum/bottom_nav_item.dart';
import 'package:equatable/equatable.dart';
 

class BottomNavState extends Equatable {
  final BottomNavItem selected;

  const BottomNavState(this.selected);

  @override
  List<Object?> get props => [selected];
}