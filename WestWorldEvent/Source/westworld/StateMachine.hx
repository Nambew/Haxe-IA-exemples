package westworld;

/**
 * ...
 * @author Andre
 */
class StateMachine<T>{

	private var _owner:T;
	private var _currentState:State<T>;
	private var _previousState:State<T>;
	private var _globalState:State<T>;
	
	
	
	public function new( owner:T ) {
		_owner = owner;
	}
	
	public function setCurrentState( state:State<T> ):Void {
		_currentState = state;
	}
	
	public function setGlobalState( state:State<T> ):Void {
		_globalState = state;
	}
	
	public function setPreviousState( state:State<T> ):Void {
		_previousState = state;
	}
	
	public function update():Void {
		if ( _globalState != null ) {
			_globalState.execute( _owner );
		}
		
		if( _currentState != null ) {
			_currentState.execute( _owner );
		}
	}
	
	public function changeState( newState:State<T> ):Void {
		if ( newState == null ) {
			throw "trying to change to a null state";
		}
		
		_previousState = _currentState;
		
		_currentState.exit( _owner );
		
		_currentState = newState;
		
		_currentState.enter( _owner );
	}
	
	public function revertToPreviousState():Void {
		changeState( _previousState );
	}
	
	public function isInState( state:State<T> ):Bool {
		return Type.getClassName( Type.getClass( this ) ) == Type.getClassName( Type.getClass(state) );
	}
	
}