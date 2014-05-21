//
//  FOOFactory.h
//  Pirate
//
//  Created by foo on 05/11/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import "FOOFactory.h"
#import "FOOTile.h"
#import "FOOCharacter.h"
#import "FOOBoss.h"
#import "FOOContraband.h"
#import "warning.h"

@interface FOOFactory : NSObject

-(NSArray *)tiles;
-(FOOCharacter *)character;

@end
