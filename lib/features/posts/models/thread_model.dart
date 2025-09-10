class ThreadModel {
  final String id;
  final String sentence;
  final String creatorUid;
  final String imageUrl;
  final String creator;
  final List<String> repliers;
  final int likes;
  final int replies;
  final int createdAt;

  ThreadModel({
    required this.id,
    required this.sentence,
    required this.imageUrl,
    required this.creatorUid,
    required this.creator,
    required this.repliers,
    required this.likes,
    required this.replies,
    required this.createdAt,
  });

  ThreadModel.fromJson({
    required Map<String, dynamic> json,
    required String threadId,
  })  : id = threadId,
        sentence = json["sentence"],
        imageUrl = json["imageUrl"],
        creatorUid = json["creatorUid"],
        creator = json["creator"],
        repliers = List<String>.from(json["repliers"] ?? []),
        likes = json["likes"],
        replies = json["replies"],
        createdAt = json["createdAt"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "sentence": sentence,
      "imageUrl": imageUrl,
      "creatorUid": creatorUid,
      "creator": creator,
      "likes": likes,
      "repliers": repliers,
      "replies": replies,
      "createdAt": createdAt,
    };
  }
}
