import 'package:sangjishik/core_packages.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //FIXME: Heavy formatting/padding required here!
    //TODO: Consider changin SingleChildScrollView and Column with ListView since it comes with its own padding
    return SingleChildScrollView(
      child: Column(
        children: const [
          Center(
            child: Text(
                'Hello! My name is Daniel Yoon, or Sang Ji in Korean. I am currently living in New York and working as a web developer. I love reading, researching niche hobbies, and coding! This blog was created from scratch using Google’s Flutter. The reason for this blog is for two reason: \n1. I want to impart what little knowledge I have to the world. Jishik in Korean means knowledge... So there’s that.. \n2. I keep to myself a lot, and rarely go out, so this is a way of letting people know that I am indeed alive! \n3. I want to keep a diary of my random thoughts so I can document the originality. \nSo if you are interested, come visit often! I will try to post twice a week with updates on my life and continue updating this website to make it look as beautiful or ugly as I want it to be.'),
          ),
        ],
      ),
    );
  }
}
