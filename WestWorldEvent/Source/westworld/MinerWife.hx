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
	
	public function new(id:Int) {
		super(id);
		
		_stateMachine = new StateMachine(this);
		_stateMachine.setCurrentState( DoHouseWork.instance );
		_stateMachine.setGlobalState( WifesGlobalState.instance );
		_currentLocation = LocationType.shack;
	}
	
	
	public function getStateMachine():StateMachine<MinerWife> {
		return _stateMachine;
	}
	
	/* INTERFACE westworld.IBaseGameEntity */
	
	
	
	override public function update():Void {
		_stateMachine.update();
	}

	override public function handleMessage(msg:Telegram):Bool {
		return false;
	}
	
}