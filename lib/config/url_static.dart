abstract class URLWEBAPI {
  static const host = "192.168.43.64";
  static const urlHost = "https://edamkar.wsjti.id";

  //http request
  static const protocolHttp = 'http://';
  static const portApi = ':8000';
  static const type = '/api';

  //websocket
  static const protocolWs = 'ws://';
  static const portWs = ':6001';
  static const appKey = 'EDKNGKServer';
  static const fullAppKey = '?appKey=$appKey';
  //url
  static const apiUrl = protocolHttp + host + portApi + type + '/';
  static const custm = '$urlHost$type/';
  static const wsUrl = protocolWs + host + portWs;
}
