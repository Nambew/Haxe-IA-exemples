package westworld.wifestate;

import westworld.State;

/**
 * ...
 * @author Andre
 */
class DoHouseWork extends State<MinerWife>{

	private static var canInstanciate:Bool;
	public static var instance(get_instance, null):DoHouseWork;
	
	public function new() {
		if (false == canInstanciate) {
            throw "Invalid Singleton access. Use Assets.instance.";
        }
	}
	
	public static function get_instance():DoHouseWork {
		if ( instance == null ) {
			canInstanciate = true;
			instance = new DoHouseWork();
			canInstanciate = false;
		}
		
		return instance;
	}
	
	override public function enter(wife:MinerWife):Void {
		
	}
	
	override public function execute(wife:MinerWife):Void {
		var r:Int = Math.round( Math.random() * 2 );
        switch (r) {
            case 0:
                trace( wife.getName() + ": Moppin' the floor");
            case 1:
                trace( wife.getName() + ": Washin' the dishes");
            case 2:
                trace( wife.getName() + ": Makin' the bed");
        }
	}
	
	override public function exit(wife:MinerWife):Void {
		
	}
	
}