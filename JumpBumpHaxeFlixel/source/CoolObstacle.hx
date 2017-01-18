package;
import flixel.FlxSprite;
import flixel.FlxG;

/**
 * ...
 * @author joon
 */
class CoolObstacle extends FlxSprite
{
	public function new(X:Int, Y:Int,  W:Int, H:Int) 
	{
		super(X, Y);
		// create the graphics
		makeGraphic(W, H, 0xff00ffff);
		
		immovable = true;
		solid = true;
	}
	


}