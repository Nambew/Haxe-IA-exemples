package westworld;

import de.polygonal.ds.Comparable;
/**
 * ...
 * @author Andre
 */
class Telegram implements Comparable<Telegram>
{
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