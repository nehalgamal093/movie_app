import 'package:movies_app/resources/assets_manager.dart';

class ActorModel{
  String name;
  String character;
  String image;
  ActorModel({required this.name,required this.character,required this.image});
  
  static List<ActorModel> actors = [
    ActorModel(name: 'Name : Hayley Atwell', character: 'Character : Captain Carter', image: AssetsManager.actor4),
    ActorModel(name: 'Name : Elizabeth Olsen', character: 'Character : Wanda Maximoff / The Scarlet Witch', image: AssetsManager.actor3),
    ActorModel(name: 'Name : Rachel McAdams', character: 'Character : Dr. Christine Palmer', image: AssetsManager.actor2),
    ActorModel(name: 'Name : Charlize Theron', character: 'Character : Clea', image: AssetsManager.actor1),
  ];
}