
class TennisAiPaths{
  static final server = '192.168.1.156:55511';
  static final rootUri = '/TennisAiServiceService/api';
  static final imagePath  = (String id) => 'http://$server/$rootUri/players/$id/getplayerimage';
  static final imageUploadPath  = (String id) => '$rootUri/players/$id/uploadsinglefile';
  static final Map<String, String> zumoHeader = {'zumo-api-version': '2.0.0'};
}