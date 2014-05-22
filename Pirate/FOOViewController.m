//
//  FOOViewController.m
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import "FOOViewController.h"
#import "FOOFactory.h"
#import "FOOTile.h"
#import "warning.h"

/////////////////////////////////////////////////////////////////////////////////
//                                                                             //
// Project: Pirate exercise.  Deviates from the specs in favor of adding       //
//   proof of concept functionality (and a bit of humor).  Game is not         //
//   bullet-proof and there are plenty of ways to improve it (if time and      //
//   interest ever permits, which is not very likely).  A previous version     //
//   was more built to spec (more or less) and has functionality that can be   //
//   added here (reset code, etc).                                             //
//                                                                             //
// To do:                                                                      //
//   Eliminate redundant code (bundle all the update[X] calls)                 //
//   Create a Person class for character and boss and extend the char class    //
//   Too many tileModel calls.  Make one instance avail and use throughout     //
//   Make an exists method for armor, weapon, contraband and boss              //
//   Make it possible to drop objects on tiles and allow for true transfers -  //
//     when an object is picked up, it doesn't exist on tile any longer.       //
//     This was prototyped but taken out for other reasons.                    //
//                                                                             //
/////////////////////////////////////////////////////////////////////////////////


@interface FOOViewController ()

@end

@implementation FOOViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  FOOFactory* factory   = [FOOFactory new];
  FOOFactory* character = [FOOFactory new];
  
  self.tiles     = [factory tiles];
  self.character = [factory character];
  self.currPoint = CGPointMake(0, 0);

  [self updateBGImage];
  [self updateTile];
  [self updateButtons];
  [self updateDamage];
  [self updateHealth];
  [self updateArmor];
  [self updateWeapon];
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (IBAction)btnDirN:(id)sender {

}

- (IBAction)btnDirS:(id)sender {

}

- (IBAction)btnDirE:(id)sender {

}

- (IBAction)btnDirW:(id)sender {

}


//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Get the values from the current tile to be used in updating the game board.  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////


-(NSString *)getBtnActionText {
  FOOTile *tileModel = [self getCurrTile];
  
  
  return tileModel.btnActionText;
}

-(FOOArmor *)getCurrArmor {
  FOOArmor *currArmor = [FOOArmor new];
  FOOTile  *currTile  = [FOOTile new];
  
  currTile  = [self getCurrTile];
  currArmor = currTile.armor;
  
  return currArmor;
}

-(FOOTile *)getCurrTile {
  FOOTile *currTile = [[self.tiles objectAtIndex:self.currPoint.x] objectAtIndex:self.currPoint.y];
  
  return currTile;
}

-(FOOWeapon *)getCurrWeapon {
  FOOWeapon *currWeapon = [FOOWeapon new];
  FOOTile   *currTile   = [FOOTile new];
  
  currTile   = [self getCurrTile];
  currWeapon = currTile.weapon;
  
  return currWeapon;
}

//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Update the values on the game board and the character's armor and weapon.    //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

-(void)updateHelpMsg {
  FOOTile *tileModel = [FOOTile new];
  
  tileModel = [self getCurrTile];
  
  if ([tileModel.btnActionText isEqual: @"Take a nap"]) {
    self.lblHelpMsg.text = @"You receive 1 health point.";
  }
  
  if ([tileModel.btnActionText isEqual: @"Take a drink"]) {
    self.lblHelpMsg.text = @"You receive 1 hit point.";
  }
  
  if ([tileModel.btnActionText isEqual: @"DMCA Violation"]) {
    self.lblHelpMsg.text = @"You receive 2 hit points.";
  }
}


-(void)updateTile {
  FOOTile *tileModel = [FOOTile new];
  
  tileModel = [self getCurrTile];
  
  self.lblStory.text   = tileModel.story;
  self.lblHelpMsg.text = tileModel.helpMsg;
}


-(void)updateDamage {
  self.lblDamage.text = [NSString stringWithFormat:@"%d", self.character.weapon.damage];
}


-(void)updateHealth {
  self.lblHealth.text = [NSString stringWithFormat:@"%d", self.character.health];
}


-(void)updateArmor {
  FOOTile  *tileModel = [FOOTile new];
  
  tileModel = [self getCurrTile];

  if (tileModel.armor.name != nil) {
    self.lblArmor.text = self.character.armor.name;
  }
}


-(void)updateWeapon {
  FOOTile *tileModel = [FOOTile new];
  
  tileModel = [self getCurrTile];
  
  if (tileModel.weapon.name != nil) {
    self.lblWeapon.text = tileModel.weapon.name;
 }
}


-(void) updateContraband {
  FOOTile *tileModel = [FOOTile new];
  
  tileModel = [self getCurrTile];
  
  if (tileModel.contraband != nil) {
    self.lblContraband.text = tileModel.contraband.name;
  }
}


-(void)updateBGImage {
  FOOTile *tileModel = [FOOTile new];
  
  tileModel = [self getCurrTile];
  
  self.imgBGImage.image = tileModel.bgImage;
}


-(void)btnEnable {
  FOOTile *tileModel = [FOOTile new];
  
  tileModel = [self getCurrTile];
  
  self.btnAction.enabled = ! [tileModel.btnActionText isEqual: @""];
}



-(void)updateButtons {
  
  //////////////////////////////////////////////////////////////
  //                                                          //
  // If there is no way to go a particular direction, disable //
  // the button for those directions.                         //
  //                                                          //
  //////////////////////////////////////////////////////////////
  
  self.btnDirN.enabled = ! [self tileExistsAtPoint:CGPointMake(self.currPoint.x, self.currPoint.y + 1)];
  self.btnDirS.enabled = ! [self tileExistsAtPoint:CGPointMake(self.currPoint.x, self.currPoint.y - 1)];
  self.btnDirE.enabled = ! [self tileExistsAtPoint:CGPointMake(self.currPoint.x + 1, self.currPoint.y)];
  self.btnDirW.enabled = ! [self tileExistsAtPoint:CGPointMake(self.currPoint.x - 1, self.currPoint.y)];
}


-(void)updateButtonActionText {
  NSString *btnActionTitle;
  
  FOOTile *tileModel = [FOOTile new];
  
  tileModel = [self getCurrTile];
  
  btnActionTitle = [self getBtnActionText];
  
  [self.btnAction setTitle:btnActionTitle forState:UIControlStateNormal];
  
  self.btnAction.hidden = [tileModel.btnActionText isEqual:@""];
  self.btnAction.hidden = [tileModel.btnActionText isEqual:@"DMCA Violation"];
}

-(BOOL)tileExistsAtPoint:(CGPoint)point {
  if (point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] &&
      point.y < [[self.tiles objectAtIndex:point.x] count]) {
    return FALSE;
  }
  else {
    return TRUE;
  }
}

///////////////////////////////////////////////////////////////////
//                                                               //
//           The btnDir[x]Pressed can be refactored              //
//                                                               //
///////////////////////////////////////////////////////////////////


-(void)setCurrPositionX:(int) x andY:(int)y {
  self.currPoint = CGPointMake(x, y);
}

- (IBAction)btnDirNPressed:(UIButton *)sender {
  self.currPoint = CGPointMake(self.currPoint.x, self.currPoint.y + 1);
  [self updateBGImage];
  [self updateButtons];
  [self updateTile];
  [self updateButtonActionText];
}

- (IBAction)btnDirSPressed:(UIButton *)sender {
  self.currPoint = CGPointMake(self.currPoint.x, self.currPoint.y - 1);
  [self updateBGImage];
  [self updateButtons];
  [self updateTile];
  [self updateButtonActionText];
}

- (IBAction)btnDirEPressed:(UIButton *)sender {
  self.currPoint = CGPointMake(self.currPoint.x + 1, self.currPoint.y);
  [self updateBGImage];
  [self updateButtons];
  [self updateTile];
  [self updateButtonActionText];
}

- (IBAction)btnDirWPressed:(UIButton *)sender {
  self.currPoint = CGPointMake(self.currPoint.x - 1, self.currPoint.y);
  [self updateBGImage];
  [self updateButtons];
  [self updateTile];
  [self updateButtonActionText];
}


- (IBAction)btnActionPressed:(UIButton *)sender {

  ////////////////////////////////////////////////////////////
  //                                                        //
  // If the user runs away, drop the character on a random  //
  // tile.  Update the game board accordingly.              //
  //                                                        //
  ////////////////////////////////////////////////////////////
  
  FOOTile *tile = [[self.tiles objectAtIndex:self.currPoint.x] objectAtIndex:self.currPoint.y];
  
  if ([self.btnAction.titleLabel.text isEqual: @"Run away"]) {
    int randX = -1, randY = -1;
    int currX, currY;
    
    currX = self.currPoint.x;
    currY = self.currPoint.y;
    randX = arc4random() % 4;
    randY = arc4random() % 3;
    
    while ((currX == randX) && (currY == randY)) {
      randX = arc4random() % 4;
      randY = arc4random() % 3;
    }
    
    self.currPoint = CGPointMake((float)randX, (float)randY);
 
    [self updateBGImage];
    [self updateButtons];
    [self updateTile];
    [self updateButtonActionText];
    return;
  }
  
  ////////////////////////////////////////////////////////////
  //                                                        //
  // Give 1 hit point per drink.                            //
  //                                                        //
  ////////////////////////////////////////////////////////////
  
  if ([self.btnAction.titleLabel.text isEqual: @"Take a drink"]) {
    self.character.health--;
  }
  
  
  ////////////////////////////////////////////////////////////
  //                                                        //
  // Give 1 health point per nap.                           //
  //                                                        //
  ////////////////////////////////////////////////////////////
  
  if ([self.btnAction.titleLabel.text isEqual: @"Take a nap"]) {
    self.character.health++;
  }
  
  
  ////////////////////////////////////////////////////////////
  //                                                        //
  // Give 2 hit points per DMCA violation.  Currenty not    //
  // functioning.  Auto activate the button when they step  //
  // onto this tile.                                        //
  //                                                        //
  ////////////////////////////////////////////////////////////
  
  if ([self.btnAction.titleLabel.text isEqual: @"DMCA Violation"]) {
    self.character.health -=2;
  }
  
  
  ////////////////////////////////////////////////////////////
  //                                                        //
  // If tile has a weapon, take it.                         //
  //                                                        //
  ////////////////////////////////////////////////////////////
  
  if (tile.weapon != nil) {
    self.character.weapon = tile.weapon;
  }
  
  
  ////////////////////////////////////////////////////////////
  //                                                        //
  // If tile has armor, take it.                            //
  //                                                        //
  ////////////////////////////////////////////////////////////
  
  if (tile.armor != nil) {
    self.character.armor = tile.armor;
  }
  
  
  ////////////////////////////////////////////////////////////
  //                                                        //
  // If tile has contraband, take it.                       //
  //                                                        //
  ////////////////////////////////////////////////////////////
  
  if (tile.contraband != nil) {
    self.character.contraband = tile.contraband;
  }
  
  
  ////////////////////////////////////////////////////////////
  //                                                        //
  // Compute damage to the boss.                            //
  //                                                        //
  ////////////////////////////////////////////////////////////

  if (tile.boss != nil) {
    int randHitPoints = 0;
    
    randHitPoints = arc4random() % self.character.weapon.damage;
    tile.boss.health = tile.boss.health - randHitPoints;
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.armor.health];
  }
  
  
  ////////////////////////////////////////////////////////////
  //                                                        //
  // Two men enter.  One man leaves.                        //
  //                                                        //
  ////////////////////////////////////////////////////////////
  
  if (self.character.health <= 0) {
    FOOTile *tileModel = [self getCurrTile];

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died please restart the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertView show];
    [self resetGame];
  }  else if (tile.boss != nil && tile.boss.health <= 0){
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory message" message:@"You have defeated the evil pirate boss!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertView show];
    [self resetGame];
  }
  
  [self updateDamage];
  [self updateHealth];
  [self updateArmor];
  [self updateWeapon];
  [self updateContraband];
  [self updateTile];
  [self updateHelpMsg];
}


-(void)updateCharacterStatsForArmor:(FOOArmor *)armor withWeapons:(FOOWeapon *)weapon withHealthEffect:(int)health {
  int randHealthPoints = 0;
  int randHitPoints    = 0;
  
  randHealthPoints = arc4random() % self.character.armor.health;
  randHitPoints    = arc4random() % self.character.weapon.damage;
  
  if (self.character.armor != nil) {
    self.character.health = self.character.health - randHealthPoints;
  }
  
  if (self.character.weapon != nil) {
    self.character.damage = self.character.damage - randHitPoints;
    [self updateDamage];
  }
}

-(void)resetGame {
  self.character = nil;
  self.boss      = nil;
  self.lblContraband.text = @"";
  [self viewDidLoad];
}

@end

