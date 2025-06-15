import 'package:clevit_flutter_bloc/domain/usecases/load_and_save_liquor_data.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/liquor/liquor_event.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/liquor/liquor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiquorBloc extends Bloc<LiquorEvent, LiquorState> {
  final LoadAndSaveLiquorDataUseCase useCase;

  LiquorBloc(this.useCase) : super(LiquorInitial()) {
    on<LoadLiquorData>((event, emit) async {
      emit(LiquorLoading());
      try {
        await useCase.loadAndSave();
        final data = await useCase.getAll();
        emit(LiquorLoaded(data));
      } catch (e) {
        emit(LiquorError(e.toString()));
      }
    });
  }
}