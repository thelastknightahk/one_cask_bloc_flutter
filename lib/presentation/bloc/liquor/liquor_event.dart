import 'package:equatable/equatable.dart';
abstract class LiquorEvent extends Equatable {
  const LiquorEvent();

  @override
  List<Object?> get props => [];
}

class LoadLiquorData extends LiquorEvent {}