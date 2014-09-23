package westworld;
import westworld.minerstate.GoHomeAndSleepTilRested;

/**
 * ...
 * @author Andre
 */
class Miner extends BaseGameEntity implements IBaseGameEntity
{
	//the amount of gold a miner must have before he feels comfortable
    public static inline var  COMFORT_LEVEL:Int = 5;
    //the amount of nuggets a miner can carry
    public static inline  var MAX_NUGGETS:Int = 3;
    //above this value a miner is thirsty
    public static inline  var THIRST_LEVEL:Int = 5;
    //above this value a miner is sleepy
    public static inline  var TIREDNESS_THRESHOLD:Int = 5;

	private var _currentLocation:LocationType;
	private var _goldCarried:Int;
	private var _moneyInBank:Int;
	private var _thirst:Int;
	private var _fatigue:Int;
	private var _stateMachine:StateMachine<Miner>;
	
	public function new( id:Int ) {
		super( id );
		
		_stateMachine = new StateMachine(this);
		_stateMachine.setCurrentState( GoHomeAndSleepTilRested.instance );
		_currentLocation = LocationType.shack;
		
		_goldCarried = 0;
        _moneyInBank = 0;
        _thirst = 0;
        _fatigue = 0;
	}
	
	public function getStateMachine():StateMachine<Miner> {
		return _stateMachine;
	}
	
	
	
	public function addToGoldCarried(val:Int):Void {
        _goldCarried += val;

        if (_goldCarried < 0) {
            _goldCarried = 0;
        }
    }
	
	public function addToWealth(val:Int):Void {
        _moneyInBank += val;

        if (_moneyInBank < 0) {
            _moneyInBank = 0;
        }
    }
	
	public function thirsty():Bool {
		
		return (_thirst >= THIRST_LEVEL );
    }
	
	public function fatigued():Bool {
		
		return (_fatigue > TIREDNESS_THRESHOLD);
    }
	
	public function getLocation():LocationType {
		return _currentLocation;
	}
	
	public function changeLocation( loc:LocationType ):Void {
		_currentLocation = loc;
	}
	
	public function goldCarried():Int {
        return _goldCarried;
    }

    public function setGoldCarried( val:Int ):Void {
        _goldCarried = val;
    }

    public function pocketsFull():Bool {
        return _goldCarried >= MAX_NUGGETS;
    }

    public function decreaseFatigue():Void {
        --_fatigue;
    }

    public function increaseFatigue():Void {
        ++_fatigue;
    }

    public function wealth():Int {
        return _moneyInBank;
    }

    public function setWealth( val:Int ):Void {
        _moneyInBank = val;
    }

    public function buyAndDrinkAWhiskey():Void {
        _thirst = 0;
        _moneyInBank -= 2;
    }
	
	override public function update():Void {
		_thirst++;
		
		_stateMachine.update();
	}

	override public function handleMessage(msg:Telegram):Bool {
		return false;
	}
	
}