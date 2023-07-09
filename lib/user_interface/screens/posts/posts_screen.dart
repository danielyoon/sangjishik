import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/posts/date_scrollbar.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Widget> yuqi = [
    getPost(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Yuqi_at_the_Incheon_Airport_2023.jpg/250px-Yuqi_at_the_Incheon_Airport_2023.jpg',
        1),
    getPost(
        'https://img.i-scmp.com/cdn-cgi/image/fit=contain,width=1098,format=auto/sites/default/files/styles/1200x800/public/d8/images/methode/2020/02/13/215894ac-4c71-11ea-9b4e-9c10402c07b7_image_hires_020008.jpg?itok=OTlX269U&v=1581530417',
        2),
    getPost(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Yuqi_at_the_Incheon_Airport_2023.jpg/250px-Yuqi_at_the_Incheon_Airport_2023.jpg',
        1),
    getPost(
        'https://img.i-scmp.com/cdn-cgi/image/fit=contain,width=1098,format=auto/sites/default/files/styles/1200x800/public/d8/images/methode/2020/02/13/215894ac-4c71-11ea-9b4e-9c10402c07b7_image_hires_020008.jpg?itok=OTlX269U&v=1581530417',
        2),
    getPost(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Yuqi_at_the_Incheon_Airport_2023.jpg/250px-Yuqi_at_the_Incheon_Airport_2023.jpg',
        1),
    getPost(
        'https://img.i-scmp.com/cdn-cgi/image/fit=contain,width=1098,format=auto/sites/default/files/styles/1200x800/public/d8/images/methode/2020/02/13/215894ac-4c71-11ea-9b4e-9c10402c07b7_image_hires_020008.jpg?itok=OTlX269U&v=1581530417',
        2),
    getPost(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Yuqi_at_the_Incheon_Airport_2023.jpg/250px-Yuqi_at_the_Incheon_Airport_2023.jpg',
        1),
    getPost(
        'https://img.i-scmp.com/cdn-cgi/image/fit=contain,width=1098,format=auto/sites/default/files/styles/1200x800/public/d8/images/methode/2020/02/13/215894ac-4c71-11ea-9b4e-9c10402c07b7_image_hires_020008.jpg?itok=OTlX269U&v=1581530417',
        2),
    getPost(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Yuqi_at_the_Incheon_Airport_2023.jpg/250px-Yuqi_at_the_Incheon_Airport_2023.jpg',
        1),
    getPost(
        'https://img.i-scmp.com/cdn-cgi/image/fit=contain,width=1098,format=auto/sites/default/files/styles/1200x800/public/d8/images/methode/2020/02/13/215894ac-4c71-11ea-9b4e-9c10402c07b7_image_hires_020008.jpg?itok=OTlX269U&v=1581530417',
        2),
    getPost(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Yuqi_at_the_Incheon_Airport_2023.jpg/250px-Yuqi_at_the_Incheon_Airport_2023.jpg',
        1),
    getPost(
        'https://yt3.ggpht.com/kFE84SwRu9xrfKm733_z3i-pQgKYJaxPiYfS1KNOnDidRuPTEe84bSnDoEv1WTpL6iXVmFdiGvWibTQ=s640-nd-v1',
        10),
  ];

  @override
  Widget build(BuildContext context) {
    double height = context.heightPx;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: $styles.insets.lg),
        child: SizedBox(
          height: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 50,
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.3,
                        children: yuqi,
                      ),
                    ),
                    VSpace.xl,
                  ],
                ),
              ),
              HSpace.lg,
              DateScrollbar(),
            ],
          ),
        ),
      ),
    );
  }
}

Card getPost(String image, int number) {
  return Card(
    elevation: 5.0,
    child: Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 200, // Set the desired height of the image
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
          VSpace.sm,
          Text('TITLE $number', style: $styles.text.h3),
          VSpace.sm,
          Text('Some text describing the post and stuff...'),
        ],
      ),
    ),
  );
}
