class SignupRequest {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  SignupRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });
}
