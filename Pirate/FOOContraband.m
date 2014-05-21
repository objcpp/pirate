//
//  FOOContraband.m
//  Pirate
//
//  Created by foo on 05/12/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import "FOOContraband.h"

@implementation FOOContraband

-(FOOContraband*)createContrabandWithName:(NSString *)name {
  
  FOOContraband* contraband = [FOOContraband new];
  
  contraband.name = name;
  
  return contraband;
}

@end
