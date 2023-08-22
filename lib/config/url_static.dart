abstract class URLWEBAPI {
  static const host = "188.10.10.254";
  static const hostWs = '116.193.190.50';
  static const urlHost = "https://edamkar.wsjti.id";

  //http request
  static const protocolHttp = 'http://';
  static const portApi = ':8000';
  static const type = '/api';

  //websocket
  static const protocolWs = 'ws://';
  static const portWs = ':3000';
  static const appKey = 'EDKNGKServer';
  static const fullAppKey = '?appKey=$appKey';
  
  //url
  // static const apiUrl = '$protocolHttp$host$portApi$type/';
  // static const urlHost = '$protocolHttp$host$portApi';
  static const apiUrl = '$urlHost$type/';

  static const wsUrl = protocolWs + host + portWs;
}
