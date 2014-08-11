package westworld;

/**
 * ...
 * @author Andre
 */
class EntityManager {
	
	public inline static var ENT_MINER:Int = 0;
	public inline static var ENT_WIFE:Int = 1;

	public static var instance:EntityManager = new EntityManager();
	
	private var _entityMap:Map<Int, IBaseGameEntity>;

	public function new() {
		_entityMap = new Map<Int, IBaseGameEntity>();
	}
	
	public function register( e:IBaseGameEntity ):Void {
		_entityMap.set( e.getId(), e );
	}
	
	public function remove( e:IBaseGameEntity ):Void {
		_entityMap.remove( e.getId() );
	}
	
	public function getFromId( id:Int ):IBaseGameEntity {
		if ( !_entityMap.exists( id ) ) throw "The entity " + id + " isn't registered.";
		
		return _entityMap.get( id );
	}
	
}