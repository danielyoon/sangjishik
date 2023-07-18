import 'package:sangjishik/core_packages.dart';

class CreatePostsScreen extends StatefulWidget {
  const CreatePostsScreen({super.key});

  @override
  State<CreatePostsScreen> createState() => _CreatePostsScreenState();
}

class _CreatePostsScreenState extends State<CreatePostsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;

    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: width / 1.5,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpace.xl,
              Text(
                'Create A Post',
                style: $styles.text.h2,
              ),
              VSpace.med,
              Text('Enter A Title'),
              VSpace.xl,
            ],
          ),
        ),
      ),
    );
  }
}
