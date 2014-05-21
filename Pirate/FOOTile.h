//
//  FOOTile.h
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FOOArmor.h"
#import "FOOWeapon.h"
#import "FOOContraband.h"
#import "FOOBoss.h"

@interface FOOTile : NSObject

@property (strong, nonatomic) NSString*      story;
@property (strong, nonatomic) UIImage*       bgImage;
@property (strong, nonatomic) NSString*      btnActionText;
@property (strong, nonatomic) FOOArmor*      armor;
@property (strong, nonatomic) FOOWeapon*     weapon;
@property (strong, nonatomic) FOOContraband* contraband;
@property (strong, nonatomic) FOOBoss*       boss;
@property (nonatomic)         BOOL           btnEnabled;
@property (strong, nonatomic) NSString*      helpMsg;

-(FOOTile *)createTileWithStory:(NSString *)story
                    withBGImage:(UIImage *) bgImage
              withBtnActionText:(NSString *)btnActionText
                      withArmor:(FOOArmor *)armor
                     withWeapon:(FOOWeapon *)weapon
                 withContraband:(FOOContraband *)contraband
                       withBoss:(FOOBoss *)boss
                       withHelp:(NSString *)helpMsg;


// Create an exists method - pass in armor, weapon, boss, contraband


@end
