import 'package:nyxx/nyxx.dart';

import '../../models/models.dart';
import '../../utils/utils.dart' as utils;

void clear(CommandParams params) {
  final node = params.node;
  final currentGuildData = params.currentGuildData;
  final event = params.event;

  if (utils.queueIsNotEmpty(node, currentGuildData)) {
    EmbedMessage messageData = EmbedMessage(
      title: 'Fila esvaziada',
      color: DiscordColor.azure,
    );
    utils.sendMessenge(messageData, event);

    node.stop(currentGuildData.guildID);
  } else {
    utils.emptyQueueMessage(event);
  }
}
