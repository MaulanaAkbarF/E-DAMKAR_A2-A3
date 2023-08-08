abstract class URLWEBAPI {
  static const host = "172.17.202.8";
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
  static const custm = protocolHttp + host + portApi;
  static const apiUrl ='$urlHost$type/'  ;
  static const wsUrl = protocolWs + host + portWs;
}
