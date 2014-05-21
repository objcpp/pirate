//
//  FOOWeapon.h
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FOOWeapon : NSObject

@property (strong, nonatomic) NSString* name;
@property (nonatomic)         int       damage;

-(FOOWeapon *)createWeapon:(NSString *)name
                withDamage:(int)damage;

@end
