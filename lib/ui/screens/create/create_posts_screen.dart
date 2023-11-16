import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sangjishik/controller/utils/loading_state_mixin.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/ui/screens/create/tag_popup.dart';
import 'package:sangjishik/controller/utils/debouncer.dart';

class CreatePostsScreen extends StatefulWidget {
  const CreatePostsScreen({super.key});

  @override
  State<CreatePostsScreen> createState() => _CreatePostsScreenState();
}

class _CreatePostsScreenState extends State<CreatePostsScreen> with LoadingStateMixin {
  late TextEditingController _titleController;
  late TextEditingController _tagController;
  late QuillController _postController;

  List<String> selectedTags = [];

  final FocusNode _focusNode = FocusNode();

  final ImagePicker picker = ImagePicker();
  XFile? image;

  Debouncer debouncer = Debouncer(delay: Duration(milliseconds: 300));

  String errorText = '';
  Widget errorIcon = Icon(Icons.error, color: Colors.redAccent);
  Color errorColor = Colors.redAccent;

  void setErrorProperties({String? text, Widget? icon, Color? color}) {
    setState(() {
      if (text != null) errorText = text;
      if (icon != null) errorIcon = icon;
      if (color != null) errorColor = color;
    });
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: '');
    _tagController = TextEditingController(text: '');
    _postController = QuillController.basic();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _tagController.dispose();
    _postController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void chooseImage() async {
    image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    setState(() {});
  }

  bool get enableSubmit {
    if (_titleController.text.isNotEmpty &&
        _tagController.text.isNotEmpty &&
        image != null &&
        !_postController.document.isEmpty()) return true;

    return false;
  }

  void submitBlogPost() async {
    if (enableSubmit == false) return;
    setErrorProperties(text: '');
    bool success;

    debouncer.run(() async {
      success = await load(() async => auth.createPost(
          _titleController.text, _tagController.text, image!, jsonEncode(_postController.document.toDelta().toJson())));

      if (success) {
        setErrorProperties(text: 'Success!', icon: Icon(Icons.check, color: Colors.green), color: Colors.green);
        _titleController.clear();
        _tagController.clear();
        _postController.clear();
        image = null;
        return;
      } else {
        setErrorProperties(
            text: 'Something must be wrong somewhere?',
            icon: Icon(Icons.error, color: Colors.redAccent),
            color: Colors.redAccent);
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;
    double height = context.heightPx;

    return Theme(
      data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all((Colors.transparent))),
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kLarge),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(kMedium),
              Text('Create a Post', style: kHeader),
              Gap(kSmall),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: QuillProvider(
                      configurations: QuillConfigurations(
                        controller: _postController,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: QuillToolbar(
                              configurations: QuillToolbarConfigurations(showAlignmentButtons: true),
                            ),
                          ),
                          Gap(kSmall),
                          Container(
                            width: double.infinity,
                            height: height / 1.5,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(kExtraExtraSmall),
                            ),
                            child: QuillEditor(
                              focusNode: _focusNode,
                              scrollController: ScrollController(),
                              configurations: QuillEditorConfigurations(
                                  placeholder: "Let's start writing!",
                                  padding: EdgeInsets.all(kSmall),
                                  textSelectionThemeData: TextSelectionThemeData(cursorColor: Colors.black)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  (width > 1200) ? Gap(kMedium) : Container(),
                  (width > 1200)
                      ? Expanded(
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _titleController,
                                label: 'Title',
                                autoFocus: true,
                                onChanged: (_) => setState(() {}),
                              ),
                              Gap(kSmall),
                              GestureDetector(
                                onTap: () async {
                                  selectedTags = (await showTagPopup(context))!;

                                  _tagController.text = selectedTags.join(', ');
                                  setState(() {});
                                },
                                child: CustomTextField(
                                  controller: _tagController,
                                  label: 'Tags',
                                  enabled: false,
                                ),
                              ),
                              Gap(kSmall),
                              GestureDetector(
                                onTap: () => chooseImage(),
                                child: (image == null)
                                    ? CustomTextField(
                                        label: 'Image',
                                        hintText: 'Click to upload an image',
                                        enabled: false,
                                      )
                                    : Image.network(image!.path),
                              ),
                              Gap(kLarge),
                              isLoading
                                  ? const CustomLoadingAnimation()
                                  : CustomPrimaryButton(
                                      text: 'SUBMIT',
                                      onPressed: enableSubmit ? submitBlogPost : null,
                                    ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
              (width < 1200)
                  ? Column(
                      children: [
                        Gap(kMedium),
                        CustomTextField(
                          controller: _titleController,
                          label: 'Title',
                          autoFocus: true,
                          onChanged: (_) => setState(() {}),
                        ),
                        Gap(kSmall),
                        GestureDetector(
                          onTap: () async {
                            selectedTags = (await showTagPopup(context))!;

                            _tagController.text = selectedTags.join(', ');
                            setState(() {});
                          },
                          child: CustomTextField(
                            controller: _tagController,
                            label: 'Tags',
                            enabled: false,
                          ),
                        ),
                        Gap(kSmall),
                        GestureDetector(
                          onTap: () => chooseImage(),
                          child: (image == null)
                              ? CustomTextField(
                                  label: 'Image',
                                  hintText: 'Click to upload an image',
                                  enabled: false,
                                )
                              : Image.network(image!.path),
                        ),
                        Gap(kMedium),
                        if (errorText.isNotEmpty) ...[
                          Container(
                            width: width,
                            padding: EdgeInsets.symmetric(horizontal: kExtraSmall, vertical: kExtraExtraSmall),
                            decoration: BoxDecoration(
                                border: Border.all(color: errorColor),
                                borderRadius: BorderRadius.circular(kExtraExtraSmall)),
                            child: Row(
                              children: [
                                errorIcon,
                                Gap(kExtraSmall),
                                Expanded(
                                  child: Text(errorText, style: kCaption),
                                )
                              ],
                            ),
                          ),
                          Gap(kSmall),
                        ],
                        isLoading
                            ? const CustomLoadingAnimation()
                            : CustomPrimaryButton(
                                text: 'SUBMIT',
                                onPressed: enableSubmit ? submitBlogPost : null,
                              ),
                        Gap(kLarge),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
