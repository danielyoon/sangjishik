import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/create/tag_popup.dart';

class CreatePostsScreen extends StatefulWidget {
  const CreatePostsScreen({super.key});

  @override
  State<CreatePostsScreen> createState() => _CreatePostsScreenState();
}

class _CreatePostsScreenState extends State<CreatePostsScreen> {
  late TextEditingController _titleController;
  late TextEditingController _postController;
  late TextEditingController _tagController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: '');
    _postController = TextEditingController(text: '');
    _tagController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _postController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;
    double height = context.widthPx;

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
              StyledTextField(
                label: 'Title',
                style: $styles.text.body,
                labelStyle: $styles.text.bodyBold,
                onChanged: (_) => setState(() {}),
                controller: _titleController,
                autoFocus: true,
              ),
              VSpace.med,
              StyledTextField(
                label: 'Post',
                style: $styles.text.body,
                labelStyle: $styles.text.bodyBold,
                onChanged: (_) => setState(() {}),
                controller: _postController,
                textInputType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                //TODO: Adjust numLines depending on height
                numLines: 18,
              ),
              VSpace.med,
              GestureDetector(
                onTap: () => showTagDialog(context),
                child: StyledTextField(
                  label: 'Tag',
                  style: $styles.text.body,
                  labelStyle: $styles.text.bodyBold,
                  text: _tagController.text,
                  enabled: false,
                ),
              ),
              VSpace.med,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text('TEST'),
                ],
              ),
              VSpace.xl,
            ],
          ),
        ),
      ),
    );
  }
}
