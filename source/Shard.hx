package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.effects.particles.FlxParticle;
import flixel.FlxG;

class Shard extends FlxParticle
{
	var parent:FlxTypedGroup<Shard>;

	public function new(parent:FlxTypedGroup<Shard>)
	{
		super();
		this.parent = parent;
		makeGraphic(FlxG.random.int(1, 5), FlxG.random.int(1, 5));
		antialiasing = true;
	}

	override function update(elapsed:Float)
	{
		if (touching == FLOOR)
		{
			if ((width + height > 6) && (Math.abs(velocity.y) > 150))
				FlxG.sound.play("assets/sounds/glass" + FlxG.random.int(1, 2) + "" + Main.SOUND_EXT + "", 0.5);

			velocity.x *= 0.65;
			velocityRange.start.x = velocity.x;
			velocityRange.end.x = velocity.x;

			// used in og canabalt source,
			// I'm too lazy to figure out the FlxG.random math equivalent!
			angularVelocity = Math.random() * 1140 - 720;
			angularVelocityRange.set(angularVelocity);
		}

		if (y > FlxG.height * 2)
			exists = false;

		super.update(elapsed);
	}
}