package westworld;

/**
 * ...
 * @author Andre
 */
interface IBaseGameEntity
{

	function update():Void;
	function getId():Int;
	function handleMessage(msg:Telegram):Bool;
}