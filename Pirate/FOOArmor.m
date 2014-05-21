//
//  FOOArmor.m
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import "FOOArmor.h"

@implementation FOOArmor

-(FOOArmor *)createArmor:(NSString *)name
              withHealth:(int)health {
  
  FOOArmor* armor = [FOOArmor new];
  
  armor.name   = name;
  armor.health = health;
  
  return armor;
}

@end
