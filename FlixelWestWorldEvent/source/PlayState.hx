package;

import flixel.FlxState;
import westworld.Miner;
import westworld.MinerWife;
import westworld.EntityManager;
import westworld.MessageDispatcher;

class PlayState extends FlxState
{
	private var _miner:Miner;
	private var _wife:MinerWife;
	private var _sumTime:Float = 0;

	override public function create():Void
	{
		super.create();

		_miner = new Miner(EntityManager.ENT_MINER);
		_wife = new MinerWife(EntityManager.ENT_WIFE);
		
		EntityManager.instance.register( _miner );
		EntityManager.instance.register( _wife );
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		_sumTime += elapsed;

		if(_sumTime > 1) {
			_miner.update();
			_wife.update();

			MessageDispatcher.instance.dispatchDelayedMessages();

			_sumTime = 0;
		}
	}
}
