class Book {
  final String imagePath;
  final String title;
  final String author;
  final String publisher;
  final String category;
  final String registrationDate;
  final String oneLineSummary;
  final String introduction;
  final String authorIntroduction;
  final int? totalViews;
  final int? completedViews;

  Book({
    required this.imagePath,
    required this.title,
    required this.author,
    required this.publisher,
    required this.category,
    required this.registrationDate,
    required this.oneLineSummary,
    required this.introduction,
    required this.authorIntroduction,
    this.totalViews,
    this.completedViews,
  });
}


class Review {
  final String userProfileImage;
  final String userName;
  final String date;
  final String reviewContent;

  Review({
    required this.userProfileImage,
    required this.userName,
    required this.date,
    required this.reviewContent,
  });
}

final Book bookDetail = Book(
  imagePath: 'assets/images/book13.png',
  title: '누굴 죽였을까',
  author: '정해연',
  publisher: '북다',
  category: '미스터리',
  registrationDate: '2024.02.28',
  oneLineSummary: '그 누구도 알 수 없고, 증명할 수도 없는 범죄\n그날 밤 세 소년은 대체 누굴 죽였을까',
  introduction: '''어느 여름밤, 단짝 친구 원택, 필진, 선혁은 자기 동네로 야영 온 타학교 학생을 겁주다가 그만 죽게 한다. 숨진 또래 아이에게 빼앗은 3만 원이 어떻게 된지도 모른 채 세 소년은 그 일을 비밀로 묻는다. 9년 후 원택의 부고를 받은 선혁은 고향으로 향한다. 졸업 후 평범하게 살아온 돌과 달리 사기 사건 가해자로 얼마 전 교도소에서 출소한 원택. 장례식장에서 만난 형사는 원택의 입속에서 '9년 전 너희 살인방이 한 짓을 이제야 갚을 때가 왔다'라고 적힌 쪽지가 발견되었다고 한다. 한밤중 산속에서 일어난 그 일을 셋만 알기에 필진과 선혁은 서로를 의심한다. 그리고 며칠 후 또 한 명이 숨진 채 발견되는데...''',
  authorIntroduction: '''저자(글) 정해연\n소심한 0형. 덩치 큰 겁쟁이. 호기심은 많지만 그 호기심이 식는 것도 빠르다. 사람의 저열한 속내나, 진실을 가장한 말 뒤에 도사리고 있는 악의에 대해 상상하는 것을 좋아한다.\n\n2012년 대한민국 스토리 공모대전에서 《백범첩》으로 우수상을 수상했으며, 2016년 YES24-문학 공모전 ‘사건과 진실’에서 《봉명아파트 꽃미남 수사일지》로 대상을, 2018년 CJ ENM과 카카오페이지가 공동으로 주최한 추미스 공모전에서 《내가 죽였다》로 금상을 수상했다.\n장편소설 《더블》, 《봉명아파트 꽃미남 수사일지》, 《유괴의 날》, 《구원의 날》, 《내가 죽였다》, 《홍학의 자리》 등을 출간했고, 《더블》, 《유괴의 날》, 《홍학의 자리》 등은 세계 각국에 번역 출간되었다. 《봉명아파트 꽃미남 수사일지》, 《더블》, 《선혁의 날》은 드라마로, 《구원의 날》은 영화로 제작될 예정이다. 2023년 《유괴의 날》이 ENA에서 드라마로 방영됐다.\n\n청소년 소설로는 《사실은 단 한 사람만 덕왔다》를 출간했고, 앤솔러지 《취미는 악록, 특기는 막말》, 《귀문고등학교 수사일지》 등에 참여했다.''',
  totalViews: 1500,
  completedViews: 1000,
);

const String libraryCount = '1.3만+';

final List<Review> reviews = [
  Review(
    userProfileImage: 'assets/images/user1.png',
    userName: '범인은너다',
    date: '2024.07.01',
    reviewContent: '처음 읽는 그 순간부터 범인 예측 가능. 아쉬움이 남는 책',
  ),
  Review(
    userProfileImage: 'assets/images/user2.png',
    userName: '슈슈슉샤샤샥',
    date: '2024.06.29',
    reviewContent: '정해연 작가님 좋다. 흥미로운 소재를 담백하고 술술 읽히게 써주셔서 늘 순식간에 완독!',
  ),
];
