package westworld.minerstate;

import westworld.Miner;
import westworld.State;

/**
 * ...
 * @author Andre
 */
class QuenchThirst extends State<Miner>{

	private static var canInstanciate:Bool;
	public static var instance(get_instance, null):QuenchThirst;
	
	public function new() {
		if (false == canInstanciate) {
            throw "Invalid Singleton access. Use Assets.instance.";
        }
	}
	
	public static function get_instance():QuenchThirst {
		if ( instance == null ) {
			canInstanciate = true;
			instance = new QuenchThirst();
			canInstanciate = false;
		}
		
		return instance;
	}
	
	/* INTERFACE westworld.State */
	
	override public function enter(miner:Miner):Void {
		if( miner.getLocation() != LocationType.saloon ) {
			trace( miner.getName() + " Boy, ah sure is thusty! Walking to the saloon.");

            miner.changeLocation( LocationType.saloon );
        }
	}
	
	override  function execute(miner:Miner):Void {
		if ( miner.thirsty() ) {
			miner.buyAndDrinkAWhiskey();
			
			trace( miner.getName() + " That's mighty fine sippin liquer.");
			
			miner.getStateMachine().changeState( EnterMineAndDigForNugget.instance );
		}
	}
	
	override public function exit(miner:Miner):Void {
		trace( miner.getName() + " Leaving the saloon, feelin' good.");
	}
	
}