package westworld.minerstate;

import westworld.LocationType;
import westworld.Miner;
import westworld.State;

/**
 * ...
 * @author Andre
 */
class EnterMineAndDigForNugget extends State<Miner>{

	private static var canInstanciate:Bool;
	public static var instance(get_instance, null):EnterMineAndDigForNugget;
	
	public function new() {
		if (false == canInstanciate) {
            throw "Invalid Singleton access. Use Assets.instance.";
        }
	}
	
	public static function get_instance():EnterMineAndDigForNugget {
		if ( instance == null ) {
			canInstanciate = true;
			instance = new EnterMineAndDigForNugget();
			canInstanciate = false;
		}
		
		return instance;
	}
	
	/* INTERFACE westworld.State */
	
	override public function enter(miner:Miner):Void {
		
		if ( miner.getLocation() != LocationType.goldmine ) {
			trace( miner.getName() + " Walkin' to the goldmine." );
			
			miner.changeLocation( LocationType.goldmine );
		}
	}
	
	override public function execute(miner:Miner):Void {
		miner.addToGoldCarried(1);
		
		miner.increaseFatigue();
		
		trace( miner.getName() + " Pickin' up a nugget." );
		
		if ( miner.pocketsFull() ) {
			miner.getStateMachine().changeState( VisitBankAndDepositGold.instance );
		}
		
		if ( miner.thirsty() ) {
			miner.getStateMachine().changeState( QuenchThirst.instance );
		}
	}
	
	override public function exit(miner:Miner):Void {
		trace( miner.getName() + " Ah'm leavin' the goldmine with mah pockets full o' sweet gold.");
	}
	
	
	
}