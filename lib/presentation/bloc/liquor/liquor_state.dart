import 'package:clevit_flutter_bloc/domain/entities/liquor.dart';
import 'package:equatable/equatable.dart';
abstract class LiquorState extends Equatable {
  const LiquorState();

  @override
  List<Object?> get props => [];
}

class LiquorInitial extends LiquorState {}

class LiquorLoading extends LiquorState {}

class LiquorLoaded extends LiquorState {
  final List<Liquor> liquors;

  const LiquorLoaded(this.liquors);

  @override
  List<Object?> get props => [liquors];
}

class LiquorError extends LiquorState {
  final String message;

  const LiquorError(this.message);

  @override
  List<Object?> get props => [message];
}