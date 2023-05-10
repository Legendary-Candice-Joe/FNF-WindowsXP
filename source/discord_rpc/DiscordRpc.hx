package discord_rpc;


typedef FakeInfo = {
	var clientID:String;
	var onReady:Dynamic;
	var onError:Dynamic;
	var onDisconnected:Dynamic;
	
	var details:String;
	var state:String;
	var largeImageKey:String;
	var smallImageKey:String;
	var largeImageText:String;
	var startTimestamp:Float;
	var endTimestamp:Float;
}

class DiscordRpc {
	public static function start(info:FakeInfo){
		trace('"Starting" discord with ${info}');
	}
	public static function process(){
		trace('Faking process');
	}
	public static function shutdown(){
		trace('Faking shutdown');
	}
	public static function presence(info:FakeInfo){
		// sink function.
	}
	
}
class DiscordClient {
	public function new(){
		trace('New discord RPC! Not really.');
	}
}