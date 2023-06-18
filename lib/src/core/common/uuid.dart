import 'package:uuid/uuid.dart';

const _u = Uuid();

String uuid() {
  return _u.v4();
}
