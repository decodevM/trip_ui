class TripModel {
  int id;
  String image;
  String title;
  int rating;
  int? likes;
  String description;

  TripModel(
      {required this.id,
      required this.image,
      required this.title,
      required this.rating,
      required this.likes,
      required this.description});
}
