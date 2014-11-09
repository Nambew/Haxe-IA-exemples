package westworld.wifestate;

import westworld.State;

class CookFood extends State<MinerWife> {

	private static var canInstanciate:Bool;
	public static var instance(get_instance, null):CookFood;
	
	public function new() {
		if (false == canInstanciate) {
            throw "Invalid Singleton access. Use Assets.instance.";
        }
	}
	
	public static function get_instance():CookFood {
		if ( instance == null ) {
			canInstanciate = true;
			instance = new CookFood();
			canInstanciate = false;
		}
		
		return instance;
	}
	
	/* INTERFACE westworld.State */
	
	override public function enter(wife:MinerWife):Void {
		trace( wife.getName() + ": S");
	}
	
	override public function execute(wife:MinerWife):Void {
		trace( wife.getName() + ": Ahhhhhh! Sweet relief!" );
		wife.getStateMachine().revertToPreviousState();
	}
	
	override public function exit(wife:MinerWife):Void {
		trace( wife.getName() + " Leavin' the Jon.");
	}
}