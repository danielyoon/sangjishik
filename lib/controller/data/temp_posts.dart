import 'dart:math';

List<Map<String, dynamic>> tempPosts = [
  {
    'image': 'https://e0.pxfuel.com/wallpapers/199/207/desktop-wallpaper-kim-chaewon-k-pop-asiachan-kpop-board.jpg',
    'title': 'I just want',
    'date': randomDateTime(DateTime(2022, 5, 1), DateTime(2023, 5, 31)),
    'tags': getRandomStrings(),
  },
  {
    'image': 'https://e1.pxfuel.com/desktop-wallpaper/523/90/desktop-wallpaper-kim-chaewon-kim-chae-won.jpg',
    'title': 'To finish',
    'date': randomDateTime(DateTime(2022, 5, 1), DateTime(2023, 5, 31)),
    'tags': getRandomStrings(),
  },
  {
    'image':
        'https://www.allkpop.com/upload/2022/10/content/250113/1666674834-d339a2a7-95e2-4b07-9a06-d56284a60a66.jpeg',
    'title': 'My blog',
    'date': randomDateTime(DateTime(2022, 5, 1), DateTime(2023, 5, 31)),
    'tags': getRandomStrings(),
  },
  {
    'image':
        'https://steamuserimages-a.akamaihd.net/ugc/5082907302202732549/334272A8E82F8D5A444553A4ED3ADFB07728D072/?imw=512&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false',
    'title': 'Hopefully by',
    'date': randomDateTime(DateTime(2022, 5, 1), DateTime(2023, 5, 31)),
    'tags': getRandomStrings(),
  },
  {
    'image': 'https://www.pinkvilla.com/images/2023-01/989010330_kim-chaewon_1280*720.jpg',
    'title': 'Sometime next',
    'date': randomDateTime(DateTime(2022, 5, 1), DateTime(2023, 5, 31)),
    'tags': getRandomStrings(),
  },
  {
    'image': 'https://img7.yna.co.kr/etc/inner/EN/2023/10/26/AEN20231026006400315_01_i_P4.jpg',
    'title': 'Week or 2',
    'date': randomDateTime(DateTime(2022, 5, 1), DateTime(2023, 5, 31)),
    'tags': getRandomStrings(),
  },
  {
    'image': 'https://karchives.com/wp-content/uploads/2021/09/izone_028.jpg',
    'title': 'But I really',
    'date': randomDateTime(DateTime(2022, 5, 1), DateTime(2023, 5, 31)),
    'tags': getRandomStrings(),
  },
  {
    'image': 'https://e0.pxfuel.com/wallpapers/145/408/desktop-wallpaper-chae-bangs-discovered-kim-chaewon.jpg',
    'title': 'Doubt I will',
    'date': randomDateTime(DateTime(2022, 5, 1), DateTime(2023, 5, 31)),
    'tags': getRandomStrings(),
  },
  {
    'image':
        'https://lh3.googleusercontent.com/PIU7LOUm1_mDLp82DJGp5QCK_9dOckLuU9MLBLduC9IyyqG3jD3ZO5Pmrm_TDKecRVHH4N3XS_cKagZ-DM1iXXq_4_XPTzwV8kwW6FYi7vsf340Q=w960-rj-nu-e365',
    'title': 'Be able to',
    'date': randomDateTime(DateTime(2022, 5, 1), DateTime(2023, 5, 31)),
    'tags': getRandomStrings(),
  },
  {
    'image':
        'https://lh3.googleusercontent.com/-Jjnr3GGaOLA/YRsjPl_WueI/AAAAAAABaSE/yNvlPjaiwLcB6kx0VBwbXxYCSoxVkZOtwCLcBGAsYHQ/s16000/image.png',
    'title': 'But',
    'date': randomDateTime(DateTime(2022, 5, 1), DateTime(2023, 5, 31)),
    'tags': getRandomStrings(),
  },
  {
    'image': 'https://i1.sndcdn.com/artworks-5QBGD7Lxb0TmJpIU-2ubKfQ-t500x500.jpg',
    'title': 'Who knows',
    'date': randomDateTime(DateTime(2022, 5, 1), DateTime(2023, 5, 31)),
    'tags': getRandomStrings(),
  },
  {
    'image': 'https://pbs.twimg.com/media/FlF7MnVXoAwN6p_?format=jpg&name=medium',
    'title': 'Cute photo',
    'date': randomDateTime(DateTime(2022, 5, 1), DateTime(2023, 5, 31)),
    'tags': getRandomStrings(),
  },
];

DateTime randomDateTime(DateTime startDate, DateTime endDate) {
  if (startDate.isAfter(endDate)) {
    throw ArgumentError('startDate must be before endDate');
  }

  final timeRange = endDate.difference(startDate).inSeconds;
  final random = Random();
  final randomSeconds = random.nextInt(timeRange);

  return startDate.add(Duration(seconds: randomSeconds));
}

List<String> getRandomStrings() {
  final List<String> categories = [
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

  final random = Random();
  final count = random.nextInt(categories.length) + 1;

  return List<String>.generate(count, (index) => categories[random.nextInt(categories.length)]);
}
