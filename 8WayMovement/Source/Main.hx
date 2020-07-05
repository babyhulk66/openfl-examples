package;

import lime.math.Vector2;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import openfl.Lib;

class Main extends Sprite {
        var player:Player;
        var playerSpeed = 250;
        var lastUpdate:Int;
        var keyPressed = new Map<Int, Bool>();

        public function new() {
                super();

                player = new Player();
                addChild(player);
                player.x = stage.stageWidth / 2;
                player.y = stage.stageHeight / 2;

                stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
                stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
                this.addEventListener(Event.ENTER_FRAME, update);

                lastUpdate = Lib.getTimer();
        }

        function update(event:Event) {
                var playerMovement = new Vector2();
                var now = Lib.getTimer();
                var deltaTime = (now - lastUpdate) / 1000.0;
                lastUpdate = now;

                if (keyPressed.get(Keyboard.UP))
                        --playerMovement.y;
                if (keyPressed.get(Keyboard.DOWN))
                        ++playerMovement.y;
                if (keyPressed.get(Keyboard.RIGHT))
                        ++playerMovement.x;
                if (keyPressed.get(Keyboard.LEFT))
                        --playerMovement.x;

                playerMovement.normalize(1);
                player.x += playerMovement.x * playerSpeed * deltaTime;
                player.y += playerMovement.y * playerSpeed * deltaTime;
        }
        
        function onKeyDown(event:KeyboardEvent) {
                keyPressed.set(event.keyCode, true);
        }

        function onKeyUp(event:KeyboardEvent) {
                keyPressed.remove(event.keyCode);
        }
}
