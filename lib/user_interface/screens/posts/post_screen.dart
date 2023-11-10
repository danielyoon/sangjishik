import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/controller/models/post.dart';

class PostScreen extends StatelessWidget {
  final Post post;

  const PostScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;
    double height = context.heightPx;

    final FocusNode focusNode = FocusNode();

    final QuillController postController = QuillController(
        document: Document.fromJson(jsonDecode(post.post)), selection: TextSelection.collapsed(offset: 0));

    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all((Colors.transparent))),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: (width > 799) ? width / 1.8 : width / 1.2,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(kLarge),
                Text(post.title, style: kHeader),
                Gap(kMedium),
                Image.network(
                  post.image,
                  width: double.infinity,
                  height: height * .65,
                  fit: BoxFit.fill,
                ),
                Gap(kMedium),
                QuillProvider(
                  configurations: QuillConfigurations(
                    controller: postController,
                  ),
                  child: QuillEditor(
                    focusNode: focusNode,
                    scrollController: ScrollController(),
                    configurations: QuillEditorConfigurations(
                        readOnly: true, textSelectionThemeData: TextSelectionThemeData(cursorColor: Colors.black)),
                  ),
                ),
                Gap(kLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
