import 'package:nyxx/nyxx.dart';

import '../models/models.dart';
import '../utils/utils.dart' as utils;
import 'commands/help.dart';
import 'connect.dart';

import 'commands/commands.dart';

void commands(INyxxWebsocket bot) async {
  // Connect to lavalink api
  final cluster = await getCluster(bot);

  bot.eventsWs.onMessageReceived.listen((event) async {
    // get reference from voice channel where user is connected
    MessageData currentGuildData = await utils.getCurrentGuildData(event, bot);
    final node = cluster.getOrCreatePlayerNode(currentGuildData.guildID);
    CommandParams params = CommandParams(
      event: event,
      bot: bot,
      node: node,
      currentGuildData: currentGuildData,
    );

    if (event.message.content.contains('-p ')) {
      play(params);
    } else if (event.message.content.contains('-q')) {
      queue(params);
    } else if (event.message.content.contains('-n')) {
      next(params);
    } else if (event.message.content.contains('-pause')) {
      pause(params);
    } else if (event.message.content.contains('-resume')) {
      resume(params);
    } else if (event.message.content.contains('-clear')) {
      clear(params);
    } else if (event.message.content.contains('-help') ||
        event.message.content.contains('-h')) {
      help(params);
    }
  });
}
