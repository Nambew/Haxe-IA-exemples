package westworld.minerstate;

/**
 * ...
 * @author Andre
 */
class VisitBankAndDepositGold extends State<Miner>{

	private static var canInstanciate:Bool;
	public static var instance(get_instance, null):VisitBankAndDepositGold;
	
	public function new() {
		if (false == canInstanciate) {
            throw "Invalid Singleton access. Use Assets.instance.";
        }
	}
	
	public static function get_instance():VisitBankAndDepositGold {
		if ( instance == null ) {
			canInstanciate = true;
			instance = new VisitBankAndDepositGold();
			canInstanciate = false;
		}
		
		return instance;
	}
	
	override public function enter(miner:Miner):Void {
		
		if( miner.getLocation() != LocationType.bank ) {
			trace( miner.getName() + " Goin' to the bank. Yes siree");

            miner.changeLocation( LocationType.bank );
        }
	}
	
	override public function execute(miner:Miner):Void {
		miner.addToWealth( miner.goldCarried() );
		
		miner.setGoldCarried(0);
		
		trace( miner.getName() + " Depositing gold. Total savings now: " + miner.wealth() );
		
		if ( miner.wealth() >= Miner.COMFORT_LEVEL ) {
			trace( miner.getName() + " WooHoo! Rich enough for now. Back home to mah li'lle lady");
			
			miner.getStateMachine().changeState( GoHomeAndSleepTilRested.instance );
		} else {
			miner.getStateMachine().changeState( EnterMineAndDigForNugget.instance );
		}
	}
	
	override public function exit(miner:Miner):Void {
		trace( miner.getName() + " Leavin' the bank.");
	}
	
}