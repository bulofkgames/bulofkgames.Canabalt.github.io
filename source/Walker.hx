package;

import flixel.effects.particles.FlxEmitter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

class Walker extends FlxSprite
{
	private var _firing:Bool;
	private var _walkTimer:Float;
	private var _idleTimer:Float;
	private var _smoke:FlxTypedGroup<FlxEmitter>;

	static private var _s:Int;

	public function new(Smoke:FlxTypedGroup<FlxEmitter>)
	{
		super(-500, FlxG.random.float(16, 20));
		loadGraphic("assets/images/walker.png", true, 96, 64);
		_smoke = Smoke;
		scrollFactor.x = 0.1;
		scrollFactor.y = 0.05;

		animation.add("idle", [0]);
		animation.add("walk", [0, 1, 2, 3, 4, 5], 8);
		animation.add("fire", [6, 7, 8, 9, 10, 11], 8, false);
		animation.play("idle");

		setFacingFlip(LEFT, false, false);
		setFacingFlip(RIGHT, true, false);
	}
// Fixes & HTML5 release — Leonardo Dias Gomes (YouTube: @BULOFK), 2025 — fix: guarded smoke-emitter

	// helper seguro para emitir fumaça (verifica nulos/índices)
	private function emitSmokeSafe():Void {
		if (_smoke == null) return;
		var members = _smoke.members;
		if (members == null || members.length == 0) return;

		// avança índice de forma segura
		_s++;
		if (_s >= members.length) _s = 0;

		var em = cast members[_s]; // normalmente um FlxEmitter
		if (em == null) return;

		// define posição e inicia com a frequency do emitter (se houver)
		em.x = x + ((facing == LEFT) ? 10 : (width - 22));
		em.y = y + height;

		// em.frequency deve existir em FlxEmitter; se não, start aceita 0
		var freq:Float = (Reflect.hasField(em, "frequency") ? em.frequency : 0);
		em.start(false, freq);
	}

	override function update(elapsed:Float)
	{
		if (_walkTimer > 0)
		{
			_walkTimer -= elapsed;
			if (_walkTimer <= 0)
			{
				animation.play("fire");
				_firing = true;
				velocity.x = 0;
				emitSmokeSafe();
			}
		}
		else if (_firing)
		{
			if (animation.finished)
			{
				_firing = false;
				_idleTimer = FlxG.random.float(1, 3);
				animation.play("idle");
			}
		}
		else if (_idleTimer > 0)
		{
			_idleTimer -= elapsed;
			if (_idleTimer <= 0)
			{
				if (FlxG.random.bool())
				{
					_walkTimer = FlxG.random.float(2, 6);
					animation.play("walk");
					velocity.x = (facing == LEFT) ? -40 : 40;
				}
				else
				{
					animation.play("fire");
					_firing = true;
					emitSmokeSafe();
				}
			}
		}

		if (getScreenPosition().x + width < 0)
		{
			_walkTimer = FlxG.random.float(0, 2);
			facing = FlxG.random.bool() ? LEFT : RIGHT;
			x += FlxG.width + width + FlxG.random.float(0, FlxG.width);
		}

		super.update(elapsed);
	}
}


