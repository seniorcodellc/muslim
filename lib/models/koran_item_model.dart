class ItemModel{
  String souraTitle;
  int souraNumber;
  String type;
  int ayatNumber;
  ItemModel({required this.souraTitle,required this.souraNumber,required this.type,required this.ayatNumber});
}
List<ItemModel> items=[
  ItemModel(souraTitle: 'الفاتحة', souraNumber: 1, type: "مكية", ayatNumber: 7),
  ItemModel(souraTitle: 'البقرة', souraNumber: 2, type: "مدنيه", ayatNumber: 286),
  ItemModel(souraTitle: 'آل عمران', souraNumber: 3, type: "مدنيه", ayatNumber: 200),
  ItemModel(souraTitle: 'النساء ', souraNumber: 4, type: "مدنيه", ayatNumber: 176),
  ItemModel(souraTitle: 'المائدة', souraNumber: 5, type: "مدنيه", ayatNumber: 120),
];