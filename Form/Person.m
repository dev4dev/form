//
//  Person.m
//  Form
//
//  Created by Alex Antonyuk on 7/2/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)
description
{
	return [NSString stringWithFormat:@"%@, %@, %@, %@", self.firstName, self.lastName, self.fields, self.phones];
}

@end
