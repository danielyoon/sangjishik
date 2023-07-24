import 'package:image_picker/image_picker.dart';
import 'package:sangjishik/business_logic/logic/app_model.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/create/tag_popup.dart';

class CreatePostsScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  CreatePostsScreen({super.key});

  @override
  State<CreatePostsScreen> createState() => _CreatePostsScreenState();
}

class _CreatePostsScreenState extends State<CreatePostsScreen>
    with GetItStateMixin {
  late TextEditingController _titleController;
  late TextEditingController _postController;
  late TextEditingController _tagController;

  final ImagePicker picker = ImagePicker();
  XFile? image;

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

  void _uploadImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<String> tags = watchX((AppModel m) => m.postTags);
    _tagController.text = tags.toString();

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
                child: tags.isEmpty
                    ? StyledTextField(
                        label: 'Tag',
                        style: $styles.text.body,
                        labelStyle: $styles.text.bodyBold,
                        text: '',
                        enabled: false,
                      )
                    : StyledTextField(
                        label: 'Tag',
                        controller: _tagController,
                        style: $styles.text.body,
                        labelStyle: $styles.text.bodyBold,
                        enabled: false),
              ),
              VSpace.med,
              image == null
                  ? GestureDetector(
                      onTap: () => _uploadImage(),
                      child: StyledTextField(
                        label: 'Image',
                        labelStyle: $styles.text.bodyBold,
                        style: $styles.text.body,
                        text: '',
                        enabled: false,
                        numLines: 3,
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: Image.network(image!.path),
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
