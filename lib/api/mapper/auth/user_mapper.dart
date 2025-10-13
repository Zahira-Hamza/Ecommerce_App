import '../../../domain/entities/response/auth/user.dart';
import '../../models/response/auth/user_dto.dart';

//* Don't forget nested mappers!
extension UserMapper on UserDto {
  User toEntity() {
    return User(
      name: name,
      email: email,
      role: role,
    );
  }
}

// extension UserToDto on User {
//   UserDto toDto() {
//     return UserDto(
//       name: name,
//       email: email,
//       role: role,
//     );
//   }
// }
