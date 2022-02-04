import '../../models/models.dart';
import '../../utils/utils.dart' as utils;

void queue(CommandParams params) {
  final node = params.node;
  final currentGuildData = params.currentGuildData;
  final event = params.event;
  // Queue command
  if (utils.queueIsNotEmpty(node, currentGuildData)) {
    var qnt = node.players[currentGuildData.guildID]!.queue.length;
    EmbedMessage messageData =
        EmbedMessage(title: 'Queue', description: qnt.toString());
    utils.sendMessenge(messageData, event);
  } else {
    utils.emptyQueueMessage(event);
  }
}
