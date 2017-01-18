package;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;

/**
 * ...
 * @author joon
 */
class CoolPlayer extends FlxSprite
{
	private var _KeyLeft:Int;
	private var _KeyRight:Int;
	private var _KeyUp:Int;
	
	public static inline var SPEED:Int = 200;
	public static inline var JUMPSPEED:Int = 200;
	public static inline var DRAGX:Int = 200;
	public static inline var DRAGY:Int = 200;
	public static inline var GRAVITY:Int = 500;
	
	public function new(X:Int, Y:Int,  KeyLeft:Int, KeyRight:Int, KeyUp:Int) 
	{
		super(X, Y);
		// create the graphics
		makeGraphic(10, 10, 0xff00ff00);
		
		_KeyLeft = KeyLeft;
		_KeyRight = KeyRight;
		_KeyUp = KeyUp;
		
		maxVelocity.set(SPEED, JUMPSPEED);
		drag.set(DRAGX, DRAGY);
		acceleration.y = GRAVITY;
	}
	
	public override function update(elapsed:Float):Void
	{
		if (FlxG.keys.anyPressed([_KeyLeft]))
		{
			velocity.x = -SPEED;
		}
		if (FlxG.keys.anyPressed([_KeyRight]))
		{
			velocity.x = SPEED;
		}
		if (FlxG.keys.anyPressed([_KeyUp]) && isTouching(FlxObject.ANY))
		{
			velocity.y = -JUMPSPEED;
		}
		super.update(elapsed);
	}


}