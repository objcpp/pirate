//
//  FOOArmor.h
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FOOArmor : NSObject

@property (strong, nonatomic) NSString* name;
@property (nonatomic)         int       health;

-(FOOArmor *)createArmor:(NSString *)name
              withHealth:(int)health;

@end
