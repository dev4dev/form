//
//  Form.m
//  Form
//
//  Created by Alex Antonyuk on 7/2/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "Form.h"
#import "FormFieldData.h"
#import "FormField.h"

@interface Form ()

@property (nonatomic, strong) NSMutableArray *fields;
@property (nonatomic, strong) NSMutableDictionary *fieldsByKeyPath;

@end

@implementation Form

- (instancetype)
init
{
	if (self = [super init]) {
        _fields = [NSMutableArray array];
		_fieldsByKeyPath = [NSMutableDictionary dictionary];
	}
	
	return self;
}

- (void)addFormFieldData:(id<FormFieldData>)formFieldData
{
	[self.fields addObject:formFieldData];
	self.fieldsByKeyPath[formFieldData.keyPath] = formFieldData;
}

- (id<FormFieldData>)
formFieldDataForKeyPath:(NSString *)keyPath
{
	return self.fieldsByKeyPath[keyPath];
}

- (BOOL)validate
{
	__block BOOL isValid = YES;
	[self.fields enumerateObjectsUsingBlock:^(id<FormFieldData> formFieldData, NSUInteger idx, BOOL *stop) {
		isValid = [formFieldData validate] && isValid;
	}];
	return isValid;
}

- (void)fillDataIntoObject:(id)object
{
	[self.fields enumerateObjectsUsingBlock:^(id<FormFieldData> formFieldData, NSUInteger idx, BOOL *stop) {
		[object setValue:formFieldData.fieldValue forKeyPath:formFieldData.keyPath];
	}];
}

@end
