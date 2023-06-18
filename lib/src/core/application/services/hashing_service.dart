abstract interface class HashingService { 
  bool compare(String plain, String hashed);
  String hash(String plain);
}