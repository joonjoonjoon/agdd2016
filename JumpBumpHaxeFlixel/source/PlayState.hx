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
	
	private var thickness:Int = 15;
	private var players:FlxGroup;
	private var obstacles:FlxGroup;
	
	override public function create():Void 
	{
		players = new FlxGroup();
		obstacles = new FlxGroup();
		
		
		// make player objects
		

		var coolplayer:CoolPlayer = new CoolPlayer(100, 100, A, D, W);
	    players.add(coolplayer);
		var coolplayer2:CoolPlayer = new CoolPlayer(150, 100, J, L, I);
		players.add(coolplayer2);
		
		// make obstacles
		
		var newObstacle:CoolObstacle = new CoolObstacle(0, 0, thickness, FlxG.height);
		obstacles.add(newObstacle);
		var newObstacle:CoolObstacle = new CoolObstacle(FlxG.width - thickness, 0, thickness, FlxG.height);
		obstacles.add(newObstacle);
		var newObstacle:CoolObstacle = new CoolObstacle(0, FlxG.height-thickness, FlxG.width, thickness);
		obstacles.add(newObstacle);
		
		add(players);
		add(obstacles);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		FlxG.collide(players, obstacles);
		FlxG.collide(players, players);
		
		if (FlxG.keys.anyJustPressed([R]))
		{
			FlxG.switchState(new PlayState());
		}
	}
	
	private function makeObstacle(X:Int, Y:Int, W:Int, H:Int)
	{
			
		// make obstacle
		var obstacle:FlxSprite = new FlxSprite(X,Y);
		obstacle.makeGraphic(W, H, 0xffffff00);
		obstacle.solid = true;
		obstacle.immovable = true;
		//_obstacles.add(obstacle);
		
	}
	
	
}