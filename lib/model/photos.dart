//This model is used to store the photos as an object
//As the resposne from json from pexel api is also a photo object
class Photos{
  String surl;
  String murl;
  int id;
  Photos({
    required this.id,
    required this.surl,
    required this.murl}
  );
}
