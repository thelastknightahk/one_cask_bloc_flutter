import 'package:flutter_bloc/flutter_bloc.dart';
import 'collection_detail_event.dart';
import 'collection_detail_state.dart'; 

class CollectionDetailBloc extends Bloc<CollectionDetailEvent, CollectionDetailState> {
  CollectionDetailBloc() : super(const CollectionDetailState()) {
    on<InitCollectionDetail>((event, emit) {
      emit(state.copyWith(
        liquor: event.liquor,
        isBottleOpened: event.liquor.isOpened,
      ));
    });

    on<ToggleBottleOpenStatus>((event, emit) {
      emit(state.copyWith(isBottleOpened: !state.isBottleOpened));
    });

    on<ChangeDetailTab>((event, emit) {
      emit(state.copyWith(selectedTab: event.tab));
    });

    on<UpdateConnectionStatus>((event, emit) {
      emit(state.copyWith(isConnected: event.isConnected));
    });
  }
}
