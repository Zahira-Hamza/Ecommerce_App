import 'package:e_commerce_app/api/mapper/auth/user_mapper.dart';

import '../../../domain/entities/response/auth/auth_response.dart';
import '../../models/response/auth/auth_response_dto.dart';

//* Response: DTO → Entity
extension AuthResponseMapper on AuthResponseDto {
  AuthResponse toEntity() {
    return AuthResponse(
      message: message,
      user: user.toEntity(),
      token: token,
    );
  }
}

// extension AuthResponseToDto on AuthResponse {
//   AuthResponseDto toDto() {
//     return AuthResponseDto(
//       message: message,
//       user: user.toDto(),
//       token: token,
//     );
//   }
// }
