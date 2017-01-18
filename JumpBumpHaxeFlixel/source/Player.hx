package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;


/**
 * ...
 * @author joon
 */
class Player extends FlxSprite
{
	public static inline var SPEED:Int = 200;
	public static inline var JUMPSPEED:Int = 200;
	public static inline var DRAGX:Int = 200;
	public static inline var DRAGY:Int = 200;
	public static inline var GRAVITY:Int = 500;
	
	private var _LeftKey:Int;
	private var _RightKey:Int;
	private var _UpKey:Int;
	
	public function new(X:Int, Y:Int, LeftKey:Int,RightKey:Int,UpKey:Int) 
	{
		super(X, Y);
		
		_LeftKey = LeftKey;
		_RightKey = RightKey;
		_UpKey = UpKey;
		
		//Set up the graphics
		loadGraphic("assets/player1.png", true, 16, 16);
		
		// Gravity!
		maxVelocity.set(SPEED, JUMPSPEED);
		drag.set(DRAGX, DRAGY);
		acceleration.y = GRAVITY;
	}
	
	public override function update(elapsed:Float):Void
	{
		acceleration.x = 0;
		
		if (FlxG.keys.anyPressed([_LeftKey]))
		{
			acceleration.x = -SPEED;
		}
		
		if (FlxG.keys.anyPressed([_RightKey]))
		{
			acceleration.x = SPEED;
		}
		
		if (FlxG.keys.anyJustPressed([_UpKey]) && isTouching(FlxObject.ANY))
		{
			velocity.y = -JUMPSPEED;
		}
		
		super.update(elapsed);
	}
}