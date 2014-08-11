package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.Lib;
import flash.utils.Timer;
import westworld.EntityManager;
import westworld.Miner;
import westworld.MinerWife;

/**
 * ...
 * @author Andre
 */

class Main extends Sprite 
{
	var inited:Bool;

	private var _miner:Miner;
	private var _wife:MinerWife;
	private var _timer:Timer;
	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;

		_miner = new Miner(EntityManager.ENT_MINER);
		_wife = new MinerWife(EntityManager.ENT_WIFE);
		
		EntityManager.instance.register( _miner );
		EntityManager.instance.register( _wife );
		
		
		_timer = new Timer( 500, 20 );
		_timer.addEventListener( TimerEvent.TIMER, onTimerStep );
		_timer.addEventListener( TimerEvent.TIMER_COMPLETE, onTimerComplete );
		_timer.start();
		
	}
	
	private function onTimerStep( evt:TimerEvent ):Void {
		_miner.update();
		_wife.update();
	}
	
	private function onTimerComplete( evt:TimerEvent ):Void {
		_timer.removeEventListener( TimerEvent.TIMER, onTimerStep );
		_timer.removeEventListener( TimerEvent.TIMER_COMPLETE, onTimerComplete );
		
		_timer.reset();
	}

	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
