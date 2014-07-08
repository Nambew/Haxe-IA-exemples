package westworld;

/**
 * ...
 * @author Andre
 */
class EntityManager {
	
	public static var instance:EntityManager = new EntityManager();
	
	private var _entityMap:Map<Int, IBaseGameEntity>;

	public function new() {
		
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