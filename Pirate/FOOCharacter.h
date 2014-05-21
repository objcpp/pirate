//
//  FOOCharacter.h
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FOOWeapon.h"
#import "FOOArmor.h"
#import "FOOContraband.h"


@interface FOOCharacter : NSObject

@property (strong, nonatomic) NSString*      name;
@property (strong, nonatomic) FOOWeapon*     weapon;
@property (strong, nonatomic) FOOArmor*      armor;
@property (strong, nonatomic) FOOContraband* contraband;
@property (nonatomic)         int            damage;
@property (nonatomic)         int            health;

-(FOOCharacter *) createCharacter:(NSString *)name
                       withWeapon:(FOOWeapon *)weapon
                        withArmor:(FOOArmor *)armor
                   withContraband:(FOOContraband *)contraband
                       withDamage:(int)damage
                       withHealth:(int)health;

@end
