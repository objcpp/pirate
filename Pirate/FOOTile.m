//
//  FOOTile.m
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import "FOOTile.h"
#import "FOOContraband.h"

@implementation FOOTile

-(FOOTile *)createTileWithStory:(NSString *)story
                    withBGImage:(UIImage *) bgImage
              withBtnActionText:(NSString *)btnActionText
                      withArmor:(FOOArmor *)armor
                     withWeapon:(FOOWeapon *)weapon
                 withContraband:(FOOContraband *)contraband
                       withBoss:(FOOBoss *)boss
                       withHelp:(NSString *)helpMsg {

  FOOTile* tile = [FOOTile new];
  
  tile.story         = story;
  tile.bgImage       = bgImage;
  tile.btnActionText = btnActionText;
  tile.armor         = armor;
  tile.weapon        = weapon;
  tile.contraband    = contraband;
  tile.boss          = boss;
  tile.helpMsg       = helpMsg;
  
  return tile;
}

@end
