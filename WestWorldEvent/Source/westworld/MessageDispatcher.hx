package westworld;

import de.polygonal.ds.PriorityQueue;

/**
 * ...
 * @author Andre
 */
class MessageDispatcher{

	private var _queue:PriorityQueue<Telegram>;

	public function new() {
		_queue = new PriorityQueue<Telegram>();
	}
	
}