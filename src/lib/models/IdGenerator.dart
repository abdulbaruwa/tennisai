
class IdGenerator {
  String newPlayerId(String authId){
    return 'Player_$authId';
  }
}