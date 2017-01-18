package; 

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Zaphod
 */
class PlayState extends FlxState
{
	private var _player1:Player;
	private var _player2:Player;
	private var _obstacles:FlxGroup;
	
	override public function create():Void 
	{
        _player1 = new Player(50, 50, LEFT, RIGHT, UP);
		add(_player1);
		
		_player2 = new Player(150, 50, A,D,W);
		add(_player2);
		
		_obstacles = new FlxGroup();
	
		makeObstacle(0, 200, 500, 15);
		makeObstacle(0, 0, 15, 500);
		makeObstacle(FlxG.width-15, 0, 15, 500);
		
		add(_obstacles);
	}
	
	private function makeObstacle(X:Int, Y:Int, W:Int, H:Int)
	{
			
		// make obstacle
		var obstacle:FlxSprite = new FlxSprite(X,Y);
		obstacle.makeGraphic(W, H, 0xffffff00);
		obstacle.solid = true;
		obstacle.immovable = true;
		_obstacles.add(obstacle);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		FlxG.collide(_player2, _player1);
		FlxG.collide(_player2, _obstacles);
		FlxG.collide(_player1, _obstacles);
		
		if (FlxG.keys.anyJustPressed([R]))
		{
			FlxG.switchState(new PlayState());
		}
	}
}