import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditation_app/models/multi_tile_model.dart';

const List<String> musicType = [
  'My aids',
  'White Noise',
  'Music',
  'Playing Relief',
  'Soul Music'
];

const List<String> musicTypeTwo = [
  'Healing Music',
  'Sounds',
  'Sleeping Media',
  'Meditation Sounds',
  'Soothing Music'
];

List<MultiTileModel> multiTileData = const [
  MultiTileModel(icon: FontAwesomeIcons.cloudRain, title: 'Rain'),
  MultiTileModel(icon: FontAwesomeIcons.fire, title: 'Campfire'),
  MultiTileModel(icon: FontAwesomeIcons.clock, title: 'Clock'),
  MultiTileModel(icon: FontAwesomeIcons.solidKeyboard, title: 'Keyboard'),
  MultiTileModel(icon: FontAwesomeIcons.wind, title: 'Wind'),
  MultiTileModel(icon: FontAwesomeIcons.cloudBolt, title: 'Flash'),
  MultiTileModel(
      icon: FontAwesomeIcons.cloudShowersHeavy, title: 'Thunderstorm'),
  MultiTileModel(icon: FontAwesomeIcons.bridgeWater, title: 'Waves'),
  MultiTileModel(icon: FontAwesomeIcons.water, title: 'Water'),
];
