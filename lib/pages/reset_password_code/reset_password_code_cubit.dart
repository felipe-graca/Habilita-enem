import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_code_state.dart';

class ResetPasswordCodeCubit extends Cubit<ResetPasswordCodeState> {
  ResetPasswordCodeCubit() : super(ResetPasswordCodeState());
}
