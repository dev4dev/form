//
//  MultiFormFieldData.h
//  Form
//
//  Created by Alex Antonyuk on 7/2/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormField.h"
#import "FormFieldData.h"

@class MultiFormFieldData;

typedef void(^MultipleFormFieldSetupBlock)(MultiFormFieldData *fieldData);

@interface MultiFormFieldData : NSObject
	<FormFieldData>

- (instancetype)initWithKeyPath:(NSString *)keyPath;
+ (instancetype)dataWithKeyPath:(NSString *)keyPath;

- (instancetype)initWithKeyPath:(NSString *)keyPath setupBlock:(MultipleFormFieldSetupBlock)setupBlock;
+ (instancetype)dataWithKeyPath:(NSString *)keyPath setupBlock:(MultipleFormFieldSetupBlock)setupBlock;

- (void)addFormField:(id<FormField>)formField;
- (void)removeFormField:(id<FormField>)formField;

@end
