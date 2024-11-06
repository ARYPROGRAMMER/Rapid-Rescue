class CreateUserRequest{
  final String fullName;
  final String emailId;
  final String password;

  CreateUserRequest({required this.fullName, required this.emailId, required this.password});
}