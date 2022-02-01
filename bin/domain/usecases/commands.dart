import 'package:nyxx/nyxx.dart';

void commands(INyxxWebsocket bot) {
  print('Running Commander');
  bot.eventsWs.onMessageReceived.listen((event) async {
    if (event.message.content == "!ping") {
      event.message.channel.sendMessage(MessageBuilder.content("Pong!"));
    }
  });
}
