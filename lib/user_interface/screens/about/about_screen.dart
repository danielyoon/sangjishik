import 'package:sangjishik/core_packages.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;

    int age = calculateAge();
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
                '상지식',
                style: $styles.text.h2,
              ),
              Text('[sahng-ji-shik]', style: $styles.text.title1),
              VSpace.xs,
              Text('noun', style: $styles.text.caption),
              Text(
                  '1.  상 (Sang) means above, or up top. It can also mean an award.',
                  style: $styles.text.body),
              Text('2.  지식 (Ji Shik) means knowledge.',
                  style: $styles.text.body),
              Text('3.  상지식 (Sang Ji Shik) means, higher knowledge.',
                  style: $styles.text.body),
              VSpace.lg,
              Text(
                  "Hi! My name is Sang Ji (상지), or Daniel. I am currently $age year's old.\n\nEnjoy my weird thoughts.",
                  style: $styles.text.body),
              VSpace.xl,
            ],
          ),
        ),
      ),
    );
  }

  int calculateAge() {
    final birthday = DateTime(1992, 7, 24);
    final now = DateTime.now();
    int age = now.year - birthday.year;

    if (now.month < birthday.month ||
        (now.month == birthday.month && now.day < birthday.day)) {
      age--;
    }

    return age;
  }
}
