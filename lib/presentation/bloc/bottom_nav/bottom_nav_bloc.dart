import 'package:clevit_flutter_bloc/core/enum/bottom_nav_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_nav_event.dart';
import 'bottom_nav_state.dart'; 

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const BottomNavState(BottomNavItem.collection)) {
    on<BottomNavChanged>((event, emit) {
      emit(BottomNavState(event.selected));
    });
  }
}
