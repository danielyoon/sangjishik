import 'package:sangjishik/core_packages.dart';

void showTagDialog<T>(BuildContext context) async => showDialog(
      context: context,
      builder: (context) => TagPopup(),
    );

class TagPopup extends StatefulWidget {
  const TagPopup({super.key});

  @override
  State<TagPopup> createState() => _TagPopupState();
}

class _TagPopupState extends State<TagPopup> {
  List<String> items = [
    'Personal',
    'Bible',
    'KPOP',
    'Programming',
    'Fashion',
    'Tetris',
    'Books',
    'Food',
    'History',
    'Random',
    'Funny',
  ];
  final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Tags',
        style: $styles.text.h3,
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: items
              .map(
                (item) => CheckboxListTile(
                  value: _selectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) => _itemChange(item, isChecked!),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        StyledTextButton(
          text: 'Cancel',
          onPressed: _cancel,
        ),
        StyledTextButton(
          text: 'Submit',
          onPressed: _submit,
        ),
      ],
    );
  }
}
