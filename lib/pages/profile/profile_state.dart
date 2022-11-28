part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final TextValidator base64Image;
  final TextValidator name;
  final TextValidator email;
  final FormzStatus status;
  final String errorMessage;
  final bool wasSubmitted;

  const ProfileState({
    this.base64Image = const TextValidator.pure(),
    this.name = const TextValidator.pure(),
    this.email = const TextValidator.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage = '',
    this.wasSubmitted = false,
  });

  @override
  List<Object?> get props => [
        base64Image,
        name,
        email,
        status,
        errorMessage,
        wasSubmitted,
      ];

  ProfileState copyWith({
    final TextValidator? base64Image,
    final TextValidator? email,
    final TextValidator? name,
    final FormzStatus? status,
    final String? errorMessage,
    final bool? wasSubmitted,
  }) {
    return ProfileState(
      base64Image: base64Image ?? this.base64Image,
      name: name ?? this.name,
      email: email ?? this.email,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      wasSubmitted: wasSubmitted ?? this.wasSubmitted,
    );
  }
}
