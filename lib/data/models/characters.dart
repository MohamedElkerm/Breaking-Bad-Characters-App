class Character{
  late int charID;
  late String name;
  late String nickName;
  late String image;
  late List<dynamic>jobs;
  late String statusIfDeadOrAlive;
  late List<dynamic> apperanceOfSeassons;
  late String actorName;
  late String categoryOfTwoSeries;
  late List<dynamic>beterCallSaulApperance;

  Character.fromJson(Map<String , dynamic> json){
    charID = json['char_id'];
    name = json[name];
    nickName = json['Heisenberg'];
    image = json['img'];
    jobs = json['occupation'];
    statusIfDeadOrAlive = json['status'];
    apperanceOfSeassons = json['appearance'];
    actorName = json['portrayed'];
    categoryOfTwoSeries = json['category'];
    beterCallSaulApperance = json['better_call_saul_appearance'];
  }
}