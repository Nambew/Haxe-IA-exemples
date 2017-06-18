package westworld.wifestate;

import westworld.State;
import westworld.MessageDispatcher;
import westworld.EntityManager;
import westworld.MessageTypes;

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
		if( !wife.cooking()) {
			trace( wife.getName() + ": Puttin' the stew in the oven" );

			wife.setCooking( true );

            MessageDispatcher.instance.dispatchMessage( 1.5, wife.getId(), wife.getId(), MessageTypes.MsgStewReady );
		}
	}
	
	override public function execute(wife:MinerWife):Void {
		
	}
	
	override public function exit(wife:MinerWife):Void {
		
	}

	override public function onMessage( wife:MinerWife, msg:Telegram ):Bool {
		switch (msg.message) {

			case MsgStewReady:
				trace( "Message handle by " + wife.getName() );
				trace( wife.getName() + ": Stew ready! Let's eat");
				wife.setCooking( false );
				MessageDispatcher.instance.dispatchMessage( 0, wife.getId(), EntityManager.ENT_MINER, MessageTypes.MsgStewReady );
				wife.getStateMachine().changeState(DoHouseWork.instance);
				return true;

			default:
				return false;
		}
	}
}