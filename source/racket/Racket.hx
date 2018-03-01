/*
 * Copyright (c) 2018 Nicolas GILLE
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package racket;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxPoint;

class Racket extends FlxSprite 
{
    public static inline var WIDTH:Int = 12;
    public static inline var HEIGHT:Int = 100;
    public static inline var MOVEMENT_SPEED:Float = 300;

    private var canMove:Bool;
    private var directionToMove:MoveDirection;
    private var keys:Array<FlxKey>;

    @:isVar()
    public var score(default, default):Int;

    /**
     *  Constructor for a Racket.
     *  
     *  @param X - Initial X position of the Racket.
     *  @param Y - Initial Y position of the Racket.
     *  @param color - Color of the Racket.
     *  @param keys - Control associate to move the racket. 
     *  @param score - Current score of the racket.
     */
    public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor, keys:Array<FlxKey>, ?score:Int)
    {
        super(X, Y);
        makeGraphic(WIDTH, HEIGHT, color);
        this.keys = keys;
        this.score = score;
        drag.y = 1600;
    }

    /**
        This function is call after each frame.
        It used to represent the movement of the Racket on the PlayState screen.

        @param elapsed
    **/
    override public function update(elapsed:Float)
    {
        movement();
        super.update(elapsed);
    }

    /**
        This function control the movement of the Racket.
    **/
    private function movement()
    {
        var up:Bool = FlxG.keys.anyPressed([this.keys[0]]);
        var down:Bool = FlxG.keys.anyPressed([this.keys[1]]);
        var mA:Float = 0;

        if (up && down)
        {
            up = down = false;
        }

        if (up || down) 
        {
            if (up)
            {
                mA = -90;
            }
            else if (down)
            {
                mA = 90;
            }

            velocity.set(Racket.MOVEMENT_SPEED, 0);
            velocity.rotate(FlxPoint.weak(0, 0), mA);
        }
    }

    /**
     *  Get the score of the racket.
     */
    public function get_score()
    {
        return this.score;
    }

    /**
     *  Set the score of the racket.
     *  
     *  @param score - New score for the racket.
     */
    public function set_score(score:Int)
    {
        this.score = score;
    }
}