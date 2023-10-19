import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:image_picker/image_picker.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/create/tag_popup.dart';

class CreatePostsScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  CreatePostsScreen({super.key});

  @override
  State<CreatePostsScreen> createState() => _CreatePostsScreenState();
}

class _CreatePostsScreenState extends State<CreatePostsScreen> with GetItStateMixin {
  late TextEditingController _titleController;

  // late TextEditingController _postController;
  late TextEditingController _tagController;
  late quill.QuillController _postController;

  final ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: '');
    // _postController = TextEditingController(text: '');
    _postController = quill.QuillController.basic();
    _tagController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    // _postController.dispose();
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
    // List<String> tags = watchOnly((AppModel m) => m.tags);
    List<String> tags = [];
    _tagController.text = tags.toString();

    double width = context.widthPx;
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: width / 1.5,
        child: Theme(
          data: Theme.of(context).copyWith(
            scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all((Colors.transparent))),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VSpace.md,
                Text(
                  'Create A Post',
                ),
                VSpace.md,
                // StyledTextField(
                //   label: 'Title',
                //   onChanged: (_) => setState(() {}),
                //   controller: _titleController,
                // ),
                VSpace.md,
                quill.QuillToolbar.basic(controller: _postController),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: .6),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  height: 400,
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: quill.QuillEditor.basic(
                      controller: _postController,
                      readOnly: false,
                      autoFocus: false,
                    ),
                  ),
                ),
                VSpace.md,
                // GestureDetector(
                //   onTap: () => showTagDialog(context),
                //   child: tags.isEmpty
                //       ? StyledTextField(
                //           label: 'Tag',
                //           text: '',
                //           enabled: false,
                //         )
                //       : StyledTextField(
                //           label: 'Tag',
                //           controller: _tagController,
                //           enabled: false,
                //         ),
                // ),
                VSpace.md,
                // image == null
                //     ? GestureDetector(
                //         onTap: () => _uploadImage(),
                //         child: StyledTextField(
                //           label: 'Image',
                //           text: '',
                //           enabled: false,
                //           numLines: 3,
                //         ),
                //       )
                //     : SizedBox(
                //         width: double.infinity,
                //         child: Image.network(image!.path),
                //       ),
                VSpace.md,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: width / 4,
                        child: CustomPrimaryButton(text: 'Submit', onPressed: () => print('TEST')
                            // userService.createPost(
                            //     _titleController.text,
                            //     jsonEncode(_postController
                            //         .document
                            //         .toDelta()
                            //         .toJson()),
                            //     tags,
                            //     image!),
                            ),
                      ),
                    ),
                  ],
                ),
                VSpace.xl,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
