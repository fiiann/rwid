class PostViewModel {
  int? postId;

  PostViewModel({
    this.postId,
  });

  factory PostViewModel.fromJson(Map<String, dynamic> json) => PostViewModel(
        postId: json['post_id'],
      );

  Map<String, dynamic> toJson() => {
        'post_id': postId,
      };
}
