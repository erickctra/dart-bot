import 'package:nyxx/nyxx.dart';
import 'package:nyxx_lavalink/nyxx_lavalink.dart';

import '../models/bot_tokens.dart';

Future<INyxxWebsocket> connect(BotTokens params) async {
  final bot = NyxxFactory.createNyxxWebsocket(
    params.secretToken,
    GatewayIntents.allUnprivileged,
  )
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(IgnoreExceptions())
    ..connect();

  return bot;
}

Future<ICluster> getCluster(INyxxWebsocket bot) async {
  final cluster = ICluster.createCluster(bot, Snowflake('936337377662758922'));
  await cluster.addNode(NodeOptions(
    host: 'lavalink-replit-1.erickctra.repl.co',
    port: 2333,
    password: 'youshallnotpass',
    ssl: true,
  ));
  return cluster;
}
