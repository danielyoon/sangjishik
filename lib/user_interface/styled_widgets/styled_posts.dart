import 'package:sangjishik/core_packages.dart';

//FIXME: Can probably have set width/height since columns numbers are all that matters
class StyledPosts extends StatelessWidget {
  const StyledPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: [
        Image.network('https://picsum.photos/250?image=1'),
        Image.network('https://picsum.photos/250?image=2'),
        Image.network('https://picsum.photos/250?image=3'),
        Image.network('https://picsum.photos/250?image=4'),
      ],
    );
  }
}
