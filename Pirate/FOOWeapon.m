//
//  FOOWeapon.m
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import "FOOWeapon.h"

@implementation FOOWeapon

-(FOOWeapon *)createWeapon:(NSString *)name
                withDamage:(int)damage {
  
  FOOWeapon* weapon = [FOOWeapon new];
  
  weapon.name   = name;
  weapon.damage = damage;
  
  return weapon;
}

@end
