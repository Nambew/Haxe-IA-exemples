package westworld;

/**
 * ...
 * @author Andre
 */
class BaseGameEntity
{

	private var _id:Int;
	private static var _nextValidId:Int = 0;
	
	public function new( id:Int ) 
	{
		setId( id );
	}
	
	private function setId( val:Int ):Void {

		if( val > _nextValidId ) throw "<BaseGameEntity::SetID>: invalid ID";

        _id = val;

        _nextValidId = _id + 1;
	}
	
	public function getId():Int {
		return _id;
	}
	
	public function getName():String {
		switch (_id) {
            case 0:
                return "Miner Bob";
            case 1:
                return "Elsa";
            default:
                return "UNKNOWN!";
        }
	}
	
	public function update():Void {
		throw "<BaseGameEntity::update()> need to be override";
	}
	
	
	
}