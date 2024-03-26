import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:poker_planning/core/constants/constants.dart';

import 'package:poker_planning/core/errors/failures.dart';
import 'package:poker_planning/features/EmailVerify/domain/entities/email_verify.dart';
import 'package:poker_planning/features/EmailVerify/domain/usecase/verify_existing_email.dart';

part 'email_verify_event.dart';
part 'email_verify_state.dart';

class EmailVerifyBloc extends Bloc<EmailVerifyEvent, EmailVerifyState> {
  final VerifyExistingEmail verifyExistingEmail;

  EmailVerifyBloc({
    required this.verifyExistingEmail,
  }) : super(const EmailVerifyInitialState()) {
    on<SendEmailEvent>((event, emit) async {
      emit(const EmailVerifyLoadingState());

      final failureOrAccepted =
          await verifyExistingEmail(EmailVerify(email: event.email));

      failureOrAccepted.fold((error) {
        emit(EmailVerifyErrorState(
          error: _mapFailureToMessage(error, "Code: "),
          email: state.email,
        ));
      }, (accepted) {
        emit(const EmailVerifyAcceptedState());
      });
    });
  }

  String _mapFailureToMessage(Failure failure, String from) {
    // Instead of a regular 'if (failure is ServerFailure)...'
    switch (failure.runtimeType) {
      case ServerFailure:
        return from + Constants.serverFailureMessage;
      default:
        return '$from Unexpected Error';
    }
  }
}
