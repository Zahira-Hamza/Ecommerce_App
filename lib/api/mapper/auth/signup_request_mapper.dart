import '../../../domain/entities/request/auth/signup_request.dart';
import '../../models/request/auth/signup_request_dto.dart';

// extension SignupRequestMapper on SignupRequestDto {
//   SignupRequest toEntity() {
//     return SignupRequest(
//       name: name,
//       email: email,
//       password: password,
//       rePassword: rePassword,
//       phone: phone,
//     );
//   }
// }

//* Request: Entity → DTO
extension SignupRequestAddMapper on SignupRequest {
  SignupRequestDto toDto() {
    return SignupRequestDto(
      email: email,
      password: password,
      name: name, rePassword: rePassword, phone: phone,
      // Add any other fields that exist in SignupRequestDto
    );
  }
}
