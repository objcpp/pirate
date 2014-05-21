//
//  FOOBoss.m
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import "FOOBoss.h"

@implementation FOOBoss

-(FOOBoss *)createBoss:(NSString *)name
            withHealth:(int)health {
  
  FOOBoss* boss = [FOOBoss new];
  
  boss.name   = name;
  boss.health = health;
  
  return boss;
}

@end
