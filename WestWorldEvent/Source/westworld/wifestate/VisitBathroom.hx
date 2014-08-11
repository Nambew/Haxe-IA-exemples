package westworld.wifestate;

import westworld.State;

/**
 * ...
 * @author Andre
 */
class VisitBathroom extends State<MinerWife>{

	private static var canInstanciate:Bool;
	public static var instance(get_instance, null):VisitBathroom;
	
	public function new() {
		if (false == canInstanciate) {
            throw "Invalid Singleton access. Use Assets.instance.";
        }
	}
	
	public static function get_instance():VisitBathroom {
		if ( instance == null ) {
			canInstanciate = true;
			instance = new VisitBathroom();
			canInstanciate = false;
		}
		
		return instance;
	}
	
	override public function enter(wife:MinerWife):Void {
		trace( wife.getName() + ": Walkin' to the can. Need to powda mah pretty li'lle nose");
	}
	
	override public function execute(wife:MinerWife):Void {
		trace( wife.getName() + ": Ahhhhhh! Sweet relief!" );
		wife.getStateMachine().revertToPreviousState();
	}
	
	override public function exit(wife:MinerWife):Void {
		trace( wife.getName() + " Leavin' the Jon.");
	}
	
}