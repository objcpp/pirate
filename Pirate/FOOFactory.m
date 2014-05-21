//
//  FOOFactory.m
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import "FOOFactory.h"
#import "FOOCharacter.h"

@implementation FOOFactory

-(NSArray *)tiles {
  
  FOOTile* tile01 = [FOOTile new];
  FOOTile* tile02 = [FOOTile new];
  FOOTile* tile03 = [FOOTile new];
  FOOTile* tile04 = [FOOTile new];
  FOOTile* tile05 = [FOOTile new];
  FOOTile* tile06 = [FOOTile new];
  FOOTile* tile07 = [FOOTile new];
  FOOTile* tile08 = [FOOTile new];
  FOOTile* tile09 = [FOOTile new];
  FOOTile* tile10 = [FOOTile new];
  FOOTile* tile11 = [FOOTile new];
  FOOTile* tile12 = [FOOTile new];
  
  FOOCharacter*   currChar       = [FOOCharacter new];
  FOOWeapon*      currWeapon     = [FOOWeapon new];
  FOOArmor*       currArmor      = [FOOArmor new];
  FOOContraband*  currContraband = [FOOContraband new];
  FOOBoss*        currBoss       = [FOOBoss new];
  
  
  tile01.story = @"After 2 weeks adrift at sea, you wash up on the shore of Napster Island with only a backpack strapped over your shoulder.  You've barely esacped the RIAA and feel you've found safe haven.  You look around for signs of life.  Up ahead, is a glint of light coming out of the sand.  To the east, you see a campsite.";
  tile02.story = @"You dig the sand away from the the shiny object and examine it.  It's an iPod with thousands of bootlegged songs.";
  tile03.story = @"A hut.  You walk in and see a hammock.  A nap sounds great, considering the harrowing ordeal you've been through.";
  tile04.story = @"At the campsite you strike up a conversation with Harvey Specter - a high priced, New York City lawyer.";
  tile05.story = @"You walk into the internet cafe.  As a new visitor to the island, you take advantage of the complimentary service. You ponder whether you should download the entire series of Gilligan's Island.";
  tile06.story = @"Just before leaving the cafe, you see a scroll.  You look at it.  It's an injuction against the DMCA drafted by none other than the lawyer from the campsite.";
  tile07.story = @"A cantina.  You order a drink and slam it back.";
  tile08.story = @"You find yourself in court against the DMCA and an angry looking judge.";
  tile09.story = @"You pick up a signed copyright document givng permission from the owner.";
  tile10.story = @"You meet a brute who steals your backpack which contains your only possessions.  Your only hope is to flee.";   // To do: - character loses armor, weapons, etc.  Can find an another tile.
  tile11.story = @"You find a machete.";
  tile12.story = @"You are hit with a DMCA violation.";
  
  tile01.btnActionText = @"";
  tile02.btnActionText = @"Take music";
  tile03.btnActionText = @"Take a nap";
  tile04.btnActionText = @"Take lawyer";
  tile05.btnActionText = @"Download Gilligan's Island";  // Maryann++
  tile06.btnActionText = @"Take injunction";
  tile07.btnActionText = @"Take a drink";
  tile08.btnActionText = @"Fight";
  tile09.btnActionText = @"Take copyright";
  tile10.btnActionText = @"Run away";                    // put character at a random tile
  tile11.btnActionText = @"Take machete";
  tile12.btnActionText = @"DMCA Violation";
  
  tile01.bgImage = [UIImage imageNamed:@"PirateStart.jpg"];
  tile02.bgImage = [UIImage imageNamed:@"ipodsand01.jpg"];
  tile03.bgImage = [UIImage imageNamed:@"hut04.jpg"];
  tile04.bgImage = [UIImage imageNamed:@"harvey.jpg"];
  tile05.bgImage = [UIImage imageNamed:@"gilliganlogo.jpg"];
  tile06.bgImage = [UIImage imageNamed:@"injunction01.gif"];
  tile07.bgImage = [UIImage imageNamed:@"bar01.png"];
  tile08.bgImage = [UIImage imageNamed:@"judge02.jpg"];
  tile09.bgImage = [UIImage imageNamed:@"gpl02.jpg"];
  tile10.bgImage = [UIImage imageNamed:@"runaway02.jpg"];
  tile11.bgImage = [UIImage imageNamed:@"machete02.png"];
  tile12.bgImage = [UIImage imageNamed:@"dmca01.jpg"];
  
  
  ///////////////////////////////////////////////////////////////////
  //                                                               //
  // Only create the boss, armors, weapons and contrabands for the //
  // tiles that need them. The tiles not specficially defined will //
  // be nil at creation time.                                      //
  //                                                               //
  ///////////////////////////////////////////////////////////////////
  
  tile08.boss       = [currBoss createBoss:@"DCMA" withHealth:80];
  
  tile01.armor      = [currArmor createArmor:@"Anonymity" withHealth:100];
  tile04.armor      = [currArmor createArmor:@"Harvey Specter" withHealth:65];
  tile09.armor      = [currArmor createArmor:@"Copyright" withHealth:50];

  tile01.weapon     = [currWeapon createWeapon:@"Fists" withDamage:25];
  tile06.weapon     = [currWeapon createWeapon:@"Injunction" withDamage:43];
  tile11.weapon     = [currWeapon createWeapon:@"Machete" withDamage:60];
  
  tile02.contraband = [currContraband createContrabandWithName:@"iPod"];
  tile05.contraband = [currContraband createContrabandWithName:@"TV Series"];
  
  
  ///////////////////////////////////////////////////////////////////
  //                                                               //
  // Create the column arrays consisting of the tiles and add them //
  // to a single array that is returned to the caller.             //
  //                                                               //
  ///////////////////////////////////////////////////////////////////
  
  NSMutableArray *col00 = [[NSMutableArray alloc] initWithObjects:tile01, tile02, tile03, nil];
  NSMutableArray *col01 = [[NSMutableArray alloc] initWithObjects:tile04, tile05, tile06, nil];
  NSMutableArray *col02 = [[NSMutableArray alloc] initWithObjects:tile07, tile08, tile09, nil];
  NSMutableArray *col03 = [[NSMutableArray alloc] initWithObjects:tile10, tile11, tile12, nil];
  
  NSArray *tiles = [[NSArray alloc] initWithObjects:col00, col01, col02, col03, nil];

  return tiles;
}


///////////////////////////////////////////////////////////////////
//                                                               //
// Method to create a character.  Method returns the character   //
// with a default weapon and armor, but contraband will be nil   //
//                                                               //
///////////////////////////////////////////////////////////////////

-(FOOCharacter *)character {
  FOOCharacter* character = [FOOCharacter new];
  FOOWeapon*    weapon    = [FOOWeapon new];
  FOOArmor*     armor     = [FOOArmor new];
  
  weapon = [weapon createWeapon:@"Fist" withDamage:25];
  armor  = [armor createArmor:@"Anonymity" withHealth:35];
  
  character = [character createCharacter:@"Pirate Pete"
                              withWeapon:weapon
                               withArmor:armor
                          withContraband:nil
                              withDamage:0
                              withHealth:100];
  
  return character;
}

@end
