package westworld.minerstate;

import westworld.Miner;
import westworld.State;
import westworld.MessageDispatcher;
import westworld.EntityManager;
import westworld.MessageTypes;

/**
 * ...
 * @author Andre
 */
class EatStew extends State<Miner>{

    private static var canInstanciate:Bool;
    public static var instance(get_instance, null):EatStew;
    
    public function new() {
        if (false == canInstanciate) {
            throw "Invalid Singleton access. Use Assets.instance.";
        }
    }
    
    public static function get_instance():EatStew {
        if ( instance == null ) {
            canInstanciate = true;
            instance = new EatStew();
            canInstanciate = false;
        }
        
        return instance;
    }
    
    /* INTERFACE westworld.State */
    
    override public function enter(miner:Miner):Void {
        trace( miner.getName()  + " : " + "Smells Reaaal goood Elsa!");
    }
    
    override public function execute(miner:Miner):Void {
        trace( miner.getName()  + " : " + "Tastes real good too!");

        miner.getStateMachine().revertToPreviousState();
    }
    
    override public function exit(miner:Miner):Void {
        trace( miner.getName() + " : Thankya li'lle lady. Ah better get back to whatever ah wuz doin'");
    }
    
}