import 'package:clevit_flutter_bloc/core/enum/collection_detail_type.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/liquor.dart'; 

class CollectionDetailState extends Equatable {
  final Liquor? liquor;
  final bool isBottleOpened;
  final CollectionDetailTabType selectedTab;
  final bool isConnected;

  const CollectionDetailState({
    this.liquor,
    this.isBottleOpened = false,
    this.selectedTab = CollectionDetailTabType.details,
    this.isConnected = true,
  });

  CollectionDetailState copyWith({
    Liquor? liquor,
    bool? isBottleOpened,
    CollectionDetailTabType? selectedTab,
    bool? isConnected,
  }) {
    return CollectionDetailState(
      liquor: liquor ?? this.liquor,
      isBottleOpened: isBottleOpened ?? this.isBottleOpened,
      selectedTab: selectedTab ?? this.selectedTab,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object?> get props => [liquor, isBottleOpened, selectedTab, isConnected];
}
