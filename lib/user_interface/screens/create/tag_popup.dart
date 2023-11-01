import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/controller/data/tags.dart';

Future<List<String>?> showTagPopup<T>(BuildContext context) async {
  return showDialog<List<String>>(context: context, barrierDismissible: false, builder: (context) => TagPopup());
}

class TagPopup extends StatefulWidget {
  const TagPopup({super.key});

  @override
  State<TagPopup> createState() => _TagPopupState();
}

class _TagPopupState extends State<TagPopup> {
  final List<String> _selectedTags = [];

  List<Widget> createTagRows() {
    List<Widget> tagRows = [];
    List<int> keys = tags.keys.toList();

    for (int i = 0; i < keys.length; i += 2) {
      List<Widget> rowChildren = [
        TagTile(
          title: tags[keys[i]]['tag'],
          onPressed: () {
            toggleTag(tags[keys[i]]['tag']);
          },
          color: tags[keys[i]]['color'],
          icon: tags[keys[i]]['icon'],
        ),
      ];

      if (i + 1 < keys.length) {
        rowChildren.add(Gap(kSmall));
        rowChildren.add(TagTile(
          title: tags[keys[i + 1]]['tag'],
          onPressed: () {
            toggleTag(tags[keys[i + 1]]['tag']);
          },
          color: tags[keys[i + 1]]['color'],
          icon: tags[keys[i + 1]]['icon'],
        ));
      } else {
        rowChildren.add(Gap(kSmall));
        rowChildren.add(TagTile(title: ''));
      }

      tagRows.add(Row(children: rowChildren));

      if (i + 2 < keys.length) {
        tagRows.add(Gap(kSmall));
      }
    }

    return tagRows;
  }

  void toggleTag(String tag) {
    if (_selectedTags.contains(tag)) {
      _selectedTags.remove(tag);
    } else {
      _selectedTags.add(tag);
    }
    setState(() {});
  }

  void closePopup() {
    appRouter.pop(_selectedTags);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: Padding(
        padding: EdgeInsets.only(top: kMedium),
        child: Center(
          child: Text('TAGS', style: kHeader),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: createTagRows(),
          ),
          Gap(kSmall),
          CustomPrimaryButton(text: 'POP!', onPressed: () => closePopup()),
        ],
      ),
    );
  }
}

class TagTile extends StatefulWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;

  const TagTile({super.key, required this.title, this.onPressed, this.color, this.icon});

  @override
  State<TagTile> createState() => _TagTileState();
}

class _TagTileState extends State<TagTile> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text(widget.title),
        leading: Icon(widget.icon, color: pressed ? Colors.white : Colors.black),
        titleTextStyle: kBodyText,
        selectedColor: Colors.white,
        selectedTileColor: widget.color,
        selected: pressed,
        enabled: (widget.title.isEmpty ? false : true),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kExtraSmall)),
        onTap: () {
          setState(() {
            pressed = !pressed;
          });
          widget.onPressed?.call();
        },
      ),
    );
  }
}
