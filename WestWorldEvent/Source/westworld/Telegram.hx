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
	public var message:Int;
	public var data:Dynamic;

	public function compare(other:Telegram):Int {
        return value - other.value;
    }

}