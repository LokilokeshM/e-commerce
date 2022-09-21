class PopularRecipiesEntity {
  final String image;
  final String title;
  PopularRecipiesEntity({required this.image, required this.title});
}

class SuggestedMealPlanEntity {
  final String days;
  final String image;
  final String description;
  SuggestedMealPlanEntity(
      {required this.days, required this.image, required this.description});
}

class SuggestedContentEntity {
  final String image;
  final String title;
  String? subTitle;
  String? description;
  SuggestedContentEntity(
      {required this.image,
      required this.title,
      this.subTitle,
      this.description});
}

List<PopularRecipiesEntity> popularRecipiesList = [
  PopularRecipiesEntity(image: "assets/image/Mask Group 7.png", title: "Taba"),
  PopularRecipiesEntity(
      image: "assets/image/Mask Group 9@2x.png", title: "Pancit"),
  PopularRecipiesEntity(image: "assets/image/Mask Group 9.png", title: "Bulao"),
  PopularRecipiesEntity(image: "assets/image/Mask Group 7.png", title: "Tabo"),
];
List<SuggestedMealPlanEntity> suggestedMealPlanList = [
  SuggestedMealPlanEntity(
      days: "Monday",
      image: "assets/image/Mask Group 173.png",
      description: "Bangus"),
  SuggestedMealPlanEntity(
      days: "TuesDay",
      image: "assets/image/Rounded Dish.png",
      description: "Stir"),
  SuggestedMealPlanEntity(
      days: "Wednesday",
      image: "assets/image/Mask Group 173.png",
      description: "Bangus"),
  SuggestedMealPlanEntity(
      days: "Thursday",
      image: "assets/image/Rounded Dish.png",
      description: "Stir"),
  SuggestedMealPlanEntity(
      days: "Friday", image: "assets/image/Rounded Dish.png", description: "E"),
  SuggestedMealPlanEntity(
      days: "Saturday",
      image: "assets/image/Mask Group 173.png",
      description: "Hellow"),
  SuggestedMealPlanEntity(
      days: "Sunday",
      image: "assets/image/Rounded Dish.png",
      description: "Example"),
];
List<SuggestedContentEntity> suggestedContentEntityList = [
  SuggestedContentEntity(
      image: "assets/image/Mask Group 173.png",
      title: "How to Make",
      subTitle: "Lesson 1"),
  SuggestedContentEntity(
      image: "assets/image/Rounded Dish.png",
      title: "Forest feast",
      subTitle: "123 Pages",
      description: "Article"),
  SuggestedContentEntity(
      image: "assets/image/Mask Group 173.png",
      title: "How to make",
      subTitle: "Lesson 1"),
  SuggestedContentEntity(
      image: "assets/image/Rounded Dish.png",
      title: "Forest feast",
      subTitle: "Lesson 1")
];
