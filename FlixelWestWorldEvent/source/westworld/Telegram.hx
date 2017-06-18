package westworld;

import de.polygonal.ds.Comparable;
import de.polygonal.ds.Prioritizable;
/**
 * ...
 * @author Andre
 */
class Telegram 
	implements Comparable<Telegram> 
	implements Prioritizable
{
	public var priority:Float;
    public var position:Int;

	public var sender:Int;
	public var receiver:Int;
	public var message:MessageTypes;
	public var data:Dynamic;
	public var delay:Float;
	public var dispatchTime:Float;

	public function new(delay:Float, sender:Int, receiver:Int, msg:MessageTypes, data:Dynamic ) {
		this.delay = delay;
		this.sender = sender;
		this.receiver = receiver;
		this.message = msg;
		this.data = data;
	}

	public function compare(other:Telegram):Int {
        return Std.int( this.dispatchTime - other.dispatchTime );
    }

}