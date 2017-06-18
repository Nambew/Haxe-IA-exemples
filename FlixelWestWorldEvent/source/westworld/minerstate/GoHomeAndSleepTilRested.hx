package westworld.minerstate;

import westworld.Miner;
import westworld.State;
import westworld.MessageDispatcher;
import westworld.EntityManager;
import westworld.MessageTypes;

/**
 * ...
 * @author Andre
 */
class GoHomeAndSleepTilRested extends State<Miner>{

	private static var canInstanciate:Bool;
	public static var instance(get_instance, null):GoHomeAndSleepTilRested;
	
	public function new() {
		if (false == canInstanciate) {
            throw "Invalid Singleton access. Use Assets.instance.";
        }
	}
	
	public static function get_instance():GoHomeAndSleepTilRested {
		if ( instance == null ) {
			canInstanciate = true;
			instance = new GoHomeAndSleepTilRested();
			canInstanciate = false;
		}
		
		return instance;
	}
	
	/* INTERFACE westworld.State */
	
	override public function enter(miner:Miner):Void {
		if( miner.getLocation() != LocationType.shack ) {
			trace( miner.getName() + " Walkin' home.");

            miner.changeLocation( LocationType.shack );

            MessageDispatcher.instance.dispatchMessage( 0, miner.getId(), EntityManager.ENT_WIFE , MessageTypes.MsgHiHoneyImHome );
        }
	}
	
	override public function execute(miner:Miner):Void {
		if ( miner.fatigued() ) {
			miner.decreaseFatigue();
			
			trace( miner.getName() + " ZZZzzz....");
		} else {
			trace( miner.getName() + "What a God darn fantastic nap! Time to find more gold." );
			
			miner.getStateMachine().changeState( EnterMineAndDigForNugget.instance );
		}
	}
	
	override public function exit(miner:Miner):Void {
		trace( miner.getName() + " Leavin' the house.");
	}

	override public function onMessage( miner:Miner, msg:Telegram ):Bool {

		trace( "Heu " + msg.message );
		switch (msg.message) {

			case MsgStewReady:
				trace( "Message handle by " + miner.getName() );
				trace( miner.getName() + ": Okay hun, ahm a-comin'!");
				miner.getStateMachine().changeState( EatStew.instance );
				
				return true;

			default:
				return false;
		}
	}
	
}