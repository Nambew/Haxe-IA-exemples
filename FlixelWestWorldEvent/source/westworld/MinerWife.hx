package westworld;
import westworld.wifestate.DoHouseWork;
import westworld.wifestate.WifesGlobalState;

/**
 * ...
 * @author Andre
 */
class MinerWife extends BaseGameEntity implements IBaseGameEntity{

	private var _currentLocation:LocationType;
	private var _stateMachine:StateMachine<MinerWife>;
	private var _cooking:Bool;
	
	public function new(id:Int) {
		super(id);
		
		_stateMachine = new StateMachine(this);
		_stateMachine.setCurrentState( DoHouseWork.instance );
		_stateMachine.setGlobalState( WifesGlobalState.instance );
		_currentLocation = LocationType.shack;
		_cooking = false;
	}
	
	
	public function getStateMachine():StateMachine<MinerWife> {
		return _stateMachine;
	}

	public function cooking():Bool {
		return _cooking;
	}

	public function setCooking( v:Bool ) {
		_cooking = v;
	}
	
	/* INTERFACE westworld.IBaseGameEntity */
	
	
	
	override public function update():Void {
		_stateMachine.update();
	}

	override public function handleMessage(msg:Telegram):Bool {
		return _stateMachine.handleMessage( msg );
	}
	
}