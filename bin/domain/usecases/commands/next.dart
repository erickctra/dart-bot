import 'package:nyxx/nyxx.dart';

import '../../models/models.dart';
import '../../utils/utils.dart' as utils;

void next(CommandParams params) {
  final node = params.node;
  final currentGuildData = params.currentGuildData;
  final event = params.event;

  node.skip(currentGuildData.guildID);
  if (utils.queueIsNotEmpty(node, currentGuildData)) {
    String? nextSong =
        node.players[currentGuildData.guildID]!.queue.first.track.info?.title;

    EmbedMessage messageData = EmbedMessage(
      title: 'Tocando agora',
      description: nextSong,
      color: DiscordColor.azure,
    );
    utils.sendMessenge(messageData, event);
  } else {
    utils.emptyQueueMessage(event);
  }
}
