import '../../application/services/hashing_service.dart';
import 'package:bcrypt/bcrypt.dart';

class HashingServiceImpl implements HashingService {
  HashingServiceImpl._();

  static HashingServiceImpl? _instance;

  static HashingServiceImpl get instance {
    _instance ??= HashingServiceImpl._();
    return _instance!;
  }
  
  @override
  bool compare(String plain, String hashed) {
    return BCrypt.checkpw(plain, hashed);
  }

  @override
  String hash(String plain) {
    return BCrypt.hashpw(plain, BCrypt.gensalt());
  } 
}