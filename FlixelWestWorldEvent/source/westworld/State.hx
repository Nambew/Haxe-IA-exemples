package westworld;

/**
 * ...
 * @author Andre
 */
class State<T>
{

	public function enter( miner:T ):Void {
		
	}
	
	public function execute( miner:T ):Void {
		
	}
	
	public function exit( miner:T ):Void {
		
	}

	public function onMessage( entity:T, msg:Telegram ):Bool {
		return false;
	}


	
}