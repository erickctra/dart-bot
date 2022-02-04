import 'package:nyxx/nyxx.dart';

import '../../models/models.dart';
import '../../utils/utils.dart' as utils;

void pause(CommandParams params) {
  final node = params.node;
  final currentGuildData = params.currentGuildData;
  final event = params.event;

  if (utils.queueIsNotEmpty(node, currentGuildData)) {
    node.pause(currentGuildData.guildID);

    EmbedMessage messageData = EmbedMessage(
      title: 'Musica pausada',
      color: DiscordColor.azure,
    );
    utils.sendMessenge(messageData, event);
  } else {
    utils.emptyQueueMessage(event);
  }
}
