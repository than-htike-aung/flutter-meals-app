import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';
class CategoryMealsScreen extends StatelessWidget {
 // const CategoryMealsScreen({Key? key}) : super(key: key);
  /**  Simple method

  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen(this.categoryId, this.categoryTitle);
      **/

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {

    final routeArs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArs['title'];
    final categoryId = routeArs['id'];
    final cateogyMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){
          return MealItem(
              id: cateogyMeals[index].id,
              title: cateogyMeals[index].title,
              imageUrl: cateogyMeals[index].imageUrl,
              duration: cateogyMeals[index].duration,
              complexity: cateogyMeals[index].complexity,
              affordability: cateogyMeals[index].affordability);
      }, itemCount: cateogyMeals.length),
    );
  }
}
