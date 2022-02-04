import 'package:nyxx/nyxx.dart';
import 'package:nyxx_lavalink/nyxx_lavalink.dart';

import 'message_data.dart';

class CommandParams {
  final IMessageReceivedEvent event;
  final INyxxWebsocket bot;
  final INode node;
  final MessageData currentGuildData;

  CommandParams({
    required this.event,
    required this.bot,
    required this.node,
    required this.currentGuildData,
  });
}
