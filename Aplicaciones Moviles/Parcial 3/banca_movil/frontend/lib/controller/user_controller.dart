import '../model/user_model.dart';

class UserController {
  User getUserData() {
    return User(
      name: 'Josué Merino',
      username: 'ejmerino',
      profileImage: 'assets/user.jpg', // Puedes cambiar la ruta de la imagen
    );
  }
}
