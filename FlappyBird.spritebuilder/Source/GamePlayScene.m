#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

- (void)update:(CCTime)delta
{
    // put update code here
    //increment the time since last obstacle added
    timeSinceObstacle += delta; //delta ~ 1/60th second
    if(timeSinceObstacle >= 2.0f) //check to see if 2 sec has passed
    {
        [self addObstacle]; //add new obstacle
        timeSinceObstacle = 0.0f;
    }
        
}

// put new methods here
-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //this will get called every time the player touches the screen
    [character flap];
}
@end
