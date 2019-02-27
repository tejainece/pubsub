import 'package:pubsub/pubsub.dart';

main() async {
  final pubsub = PubSub<String>();

  final sub1 = pubsub.subscribe('country')
    ..listen((String c) {
      print('Country is $c');
    });

  final sub2 = pubsub.subscribe('city')
    ..listen((String c) {
      print('City is $c');
    });

  final sub3 = pubsub.subscribe(['country', 'city'])
    ..listen((String c) {
      print('City or Country is $c');
    });

  pubsub.publish('country', 'Sweden');
  pubsub.publish(['country', 'city'], 'Mexico');

  await sub1.unsubscribe();

  pubsub.publish('country', 'Peru');
  pubsub.publish('city', 'Stockholm');

  await sub2.unsubscribe();
  await sub3.unsubscribe();
}
