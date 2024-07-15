List<Map<String, String>> avatarlist = [
  {"AVATAR01": "assets/images/avatar1.png"},
  {"AVATAR02": "assets/images/avatar2.png"},
  {"AVATAR03": "assets/images/avatar3.png"},
  {"AVATAR04": "assets/images/avatar4.png"},
  {"AVATAR05": "assets/images/avatar5.png"},
  {"AVATAR06": "assets/images/avatar6.png"},
  {"AVATAR07": "assets/images/avatar7.png"},
  {"AVATAR08": "assets/images/avatar8.png"}
];

// user의 avatar 키에 해당하는 value를 찾는 함수
String getAvatarPath(String avatarKey) {
  for (var avatar in avatarlist) {
    if (avatar.containsKey(avatarKey)) {
      return avatar[avatarKey]!;
    }
  }
  // 기본 이미지 경로를 반환하거나 예외를 처리할 수 있습니다.
  return "assets/images/default_avatar.png";
}
