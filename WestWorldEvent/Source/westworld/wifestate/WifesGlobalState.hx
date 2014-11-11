package westworld.wifestate;

/**
 * ...
 * @author Andre
 */
class WifesGlobalState extends State<MinerWife>{

	private static var canInstanciate:Bool;
	public static var instance(get_instance, null):WifesGlobalState;
	
	public function new() {
		if (false == canInstanciate) {
            throw "Invalid Singleton access. Use Assets.instance.";
        }
	}
	
	public static function get_instance():WifesGlobalState {
		if ( instance == null ) {
			canInstanciate = true;
			instance = new WifesGlobalState();
			canInstanciate = false;
		}
		
		return instance;
	}
	
	override public function enter(wife:MinerWife):Void {
		
	}
	
	override public function execute(wife:MinerWife):Void {
		
		if (Math.random() < 0.1) {
			wife.getStateMachine().changeState(VisitBathroom.instance);
        }
	}
	
	override public function exit(wife:MinerWife):Void {
	}

	override public function onMessage( wife:MinerWife, msg:Telegram ):Bool {
		switch (msg.message) {

			case MsgHiHoneyImHome:
				trace( "Message handle by " + wife.getName() );
				trace( wife.getName() + ": Hi honey. Let me make you some of mah fine country stew.");
				wife.getStateMachine().changeState(CookFood.instance);
				return true;

			default:
				return false;
		}
	}
	
}