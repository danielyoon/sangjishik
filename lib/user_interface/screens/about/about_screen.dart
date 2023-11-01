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
              Gap(kExtraLarge),
              Text(
                '상지식',
                style: kHeader,
              ),
              Text('[sahng-ji-shik]', style: kSubHeader),
              Gap(kExtraSmall),
              Text('noun', style: kCaption),
              Text('1.  상 (Sang) means above, or up top. It can also mean an award.', style: kBodyText),
              Text('2.  지식 (Ji Shik) means knowledge.', style: kBodyText),
              Text('3.  상지식 (Sang Ji Shik) means, higher knowledge.', style: kBodyText),
              Gap(kLarge),
              Text(
                  "Hi! My name is Sang Ji (상지), or Daniel. I am currently $age year's old.\n\nEnjoy my weird thoughts.",
                  style: kBodyText),
              Gap(kExtraLarge),
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

    if (now.month < birthday.month || (now.month == birthday.month && now.day < birthday.day)) {
      age--;
    }

    return age;
  }
}
