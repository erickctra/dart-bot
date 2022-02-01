import './domain/usecases/usecases.dart';
import './tokens.dart' as tokens;
import 'domain/usecases/commands.dart';

void main() async {
  final bot = await connect(tokens.get);

  commands(bot);
}
