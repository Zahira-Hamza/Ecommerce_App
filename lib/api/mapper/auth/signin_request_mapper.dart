import '../../../domain/entities/request/auth/signin_request.dart';
import '../../models/request/auth/signin_request_dto.dart';

// extension SigninRequestMapper on SigninRequestDto {
//   SigninRequest toEntity() {
//     return SigninRequest(
//       email: email,
//       password: password,
//     );
//   }
// }

//* Request: Entity → DTO
extension SigninRequestAddMapper on SigninRequest {
  SigninRequestDto toDto() {
    return SigninRequestDto(
      email: email,
      password: password,
    );
  }
}
