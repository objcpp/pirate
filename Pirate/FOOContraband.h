//
//  FOOContraband.h
//  Pirate
//
//  Created by foo on 05/12/14.
//  Copyright (c) 2014 Foo, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FOOContraband : NSObject

@property (strong, nonatomic) NSString* name;

-(FOOContraband*)createContrabandWithName:(NSString *)name;

@end
