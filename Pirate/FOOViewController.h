//
//  FOOViewController.h
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FOOFactory.h"

@interface FOOViewController : UIViewController

#pragma mark Tile
@property (nonatomic)         CGPoint currPoint;
@property (strong, nonatomic) NSArray* tiles;

#pragma mark Character
@property (strong, nonatomic) FOOCharacter *character;

#pragma mark Boss
@property (strong, nonatomic) FOOBoss      *boss;


////////////////////////////////////////////////////////
//                                                    //
// Labels containing the current character statistics //
//                                                    //
////////////////////////////////////////////////////////

#pragma mark Character Statistics
@property (strong, nonatomic) IBOutlet UILabel* lblHealth;
@property (strong, nonatomic) IBOutlet UILabel* lblDamage;
@property (strong, nonatomic) IBOutlet UILabel* lblWeapon;
@property (strong, nonatomic) IBOutlet UILabel* lblArmor;
@property (strong, nonatomic) IBOutlet UILabel*lblContraband;
@property (strong, nonatomic) IBOutlet UILabel *lblHelpMsg;


////////////////////////////////////////////////////////
//                                                    //
// Displays the current story related to current tile //
//                                                    //
////////////////////////////////////////////////////////

#pragma mark Story
@property (strong, nonatomic) IBOutlet UILabel* lblStory;


////////////////////////////////////////////////////////
//                                                    //
// Displays an image related to the current story     //
//                                                    //
////////////////////////////////////////////////////////

#pragma mark Background Image
@property (strong, nonatomic) IBOutlet UIImageView* imgBGImage;


////////////////////////////////////////////////////////
//                                                    //
// Buttons used for moving character to new tile      //
//                                                    //
////////////////////////////////////////////////////////

#pragma mark Direction Buttons Outlets
@property (strong, nonatomic) IBOutlet UIButton *btnDirN;
@property (strong, nonatomic) IBOutlet UIButton *btnDirS;
@property (strong, nonatomic) IBOutlet UIButton *btnDirE;
@property (strong, nonatomic) IBOutlet UIButton *btnDirW;

#pragma mark Direction Buttons IBAction
- (IBAction)btnDirNPressed:(id)sender;
- (IBAction)btnDirSPressed:(id)sender;
- (IBAction)btnDirEPressed:(id)sender;
- (IBAction)btnDirWPressed:(id)sender;


////////////////////////////////////////////////////////
//                                                    //
// Button used to perform action such as picking up   //
// objects, fighting, etc.  May be disabled if no     //
// action is available for that tile.  Button title   //
// will be dynamically set for available action.      //
//                                                    //
////////////////////////////////////////////////////////

#pragma mark Action Button
@property (strong, nonatomic) IBOutlet UIButton *btnAction;
- (IBAction)btnActionPressed:(id)sender;


@end
