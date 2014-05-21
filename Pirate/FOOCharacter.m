//
//  FOOCharacter.m
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import "FOOCharacter.h"

@implementation FOOCharacter

-(FOOCharacter *) createCharacter:(NSString *)name
                       withWeapon:(FOOWeapon *)weapon
                        withArmor:(FOOArmor *)armor
                   withContraband:(FOOContraband *)contraband
                       withDamage:(int)damage
                       withHealth:(int)health{
  
  FOOCharacter* character = [FOOCharacter new];
  
  character.name       = name;
  character.weapon     = weapon;
  character.armor      = armor;
  character.contraband = contraband;
  character.damage     = damage;
  character.health     = health;
  
  return character;
}

@end
