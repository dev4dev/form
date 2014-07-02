//
//  SingleFormFieldData.h
//  Form
//
//  Created by Alex Antonyuk on 7/2/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormFieldData.h"
#import "FormField.h"

@class SingleFormFieldData;

typedef void(^SingleFormFieldSetupBlock)(SingleFormFieldData *fieldData);

@interface SingleFormFieldData : NSObject
	<FormFieldData>

- (instancetype)initWithKeyPath:(NSString *)keyPath formField:(id<FormField>)formField;
+ (instancetype)dataWithKeyPath:(NSString *)keyPath formField:(id<FormField>)formField;

- (instancetype)initWithKeyPath:(NSString *)keyPath formField:(id<FormField>)formField setupBlock:(SingleFormFieldSetupBlock)setupBlock;
+ (instancetype)dataWithKeyPath:(NSString *)keyPath formField:(id<FormField>)formField setupBlock:(SingleFormFieldSetupBlock)setupBlock;

@end
