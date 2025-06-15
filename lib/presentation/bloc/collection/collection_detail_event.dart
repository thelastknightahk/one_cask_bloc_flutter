import 'package:clevit_flutter_bloc/core/enum/collection_detail_type.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/liquor.dart'; 

abstract class CollectionDetailEvent extends Equatable {
  const CollectionDetailEvent();

  @override
  List<Object?> get props => [];
}

class InitCollectionDetail extends CollectionDetailEvent {
  final Liquor liquor;

  const InitCollectionDetail(this.liquor);

  @override
  List<Object?> get props => [liquor];
}

class ToggleBottleOpenStatus extends CollectionDetailEvent {}

class ChangeDetailTab extends CollectionDetailEvent {
  final CollectionDetailTabType tab;

  const ChangeDetailTab(this.tab);

  @override
  List<Object?> get props => [tab];
}

class UpdateConnectionStatus extends CollectionDetailEvent {
  final bool isConnected;

  const UpdateConnectionStatus(this.isConnected);

  @override
  List<Object?> get props => [isConnected];
}
