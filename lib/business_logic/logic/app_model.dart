import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/business_logic/models/post.dart';

class AppModel extends ChangeNotifier {
  final postTags = ValueNotifier<List<String>>([]);
  final listOfPosts = ValueNotifier<List<Post>>([]);

  void updatePostTags(List<String> tags) {
    postTags.value = tags;
    notifyListeners();
  }

  void updatePosts(List<Post> posts) {
    listOfPosts.value = posts;
    notifyListeners();
  }
}
