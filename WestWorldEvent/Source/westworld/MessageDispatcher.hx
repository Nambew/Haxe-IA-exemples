package westworld;

import de.polygonal.ds.PriorityQueue;

/**
 * ...
 * @author Andre
 */
class MessageDispatcher{

	public static var instance:MessageDispatcher = new MessageDispatcher();

	private var _queue:PriorityQueue<Telegram>;

	public function new() {
		_queue = new PriorityQueue<Telegram>();
	}

	private function dicharge( receiver:IBaseGameEntity, msg:Telegram ):Void {
		if (!receiver.handleMessage(msg)) {
            //telegram could not be handled
            trace("\nMessage not handled");
        }
	}

	public function dispatchMessage( delay:Float, sender:Int, receiver:Int, msg:MessageTypes, extraInfos:Dynamic = null ) {
		var receiverEntity:IBaseGameEntity = EntityManager.instance.getFromId( receiver );

		var telegram:Telegram = new Telegram( delay, sender, receiver, msg, extraInfos );

		if( delay <= 0 ) {
			dicharge( receiverEntity, telegram );
		} else {
			telegram.dispatchTime =  Date.now().getTime() + delay;

			_queue.enqueue( telegram );
		}
	}

	public function dispatchDelayedMessages() {
		var currentTime:Float = Date.now().getTime();

		while( _queue.peek().dispatchTime < currentTime && _queue.peek().dispatchTime > 0 ) {
			var telegram:Telegram = _queue.dequeue();
			var receiverEntity:IBaseGameEntity = EntityManager.instance.getFromId( telegram.receiver );

			dicharge( receiverEntity, telegram );
		}
	}
	
}