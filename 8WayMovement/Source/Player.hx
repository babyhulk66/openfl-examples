package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;

class Player extends Sprite {
        public function new() {
                super();

                var bmpData = Assets.getBitmapData("assets/o.png");
                var bmp = new Bitmap(bmpData);
                addChild(bmp);
                //this.graphics.beginBitmapFill(bmpData);
                //this.graphics.drawRect(0, 0, 100, 100);
                //this.graphics.endFill();
        }
}
