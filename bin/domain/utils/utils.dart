import 'package:nyxx/nyxx.dart';
import 'package:nyxx_lavalink/nyxx_lavalink.dart';

import '../models/models.dart';

Future<MessageData> getCurrentGuildData(
    IMessageReceivedEvent event, INyxxWebsocket bot) async {
  final guildID = Snowflake(event.message.guild!.id);
  final guildData = await bot.fetchGuild(guildID);
  final nodeMember = await guildData.fetchMember(event.message.author.id);
  final currentVoiceChannel = nodeMember.voiceState?.channel;

  final MessageData currentGuildData = MessageData(
    guildID: guildID,
    currentVoiceChannel: currentVoiceChannel?.id,
  );
  return currentGuildData;
}

sendMessenge(EmbedMessage message, IMessageReceivedEvent event) {
  event.message.channel.sendMessage(MessageBuilder.embed(message.toNyxx()));
}

bool queueIsNotEmpty(INode node, MessageData guildData) {
  return node.players[guildData.guildID]!.queue.isNotEmpty;
}

emptyQueueMessage(IMessageReceivedEvent event) {
  EmbedMessage messageData = EmbedMessage(
    title: 'Não estou tocando nada agora :(',
    color: DiscordColor.azure,
  );
  sendMessenge(messageData, event);
}
