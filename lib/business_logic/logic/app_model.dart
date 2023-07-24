import 'package:sangjishik/core_packages.dart';

class AppModel extends ChangeNotifier {
  final postTags = ValueNotifier<List<String>>([]);

  void updatePostTags(List<String> tags) {
    postTags.value = tags;
    notifyListeners();
  }
}
