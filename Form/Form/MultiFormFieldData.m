//
//  MultiFormFieldData.m
//  Form
//
//  Created by Alex Antonyuk on 7/2/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "MultiFormFieldData.h"

@interface MultiFormFieldData ()

@property (nonatomic, copy) NSString *keyPath;
@property (nonatomic, strong) NSMutableArray *fields;
@property (nonatomic, copy) FormFieldValueTransformer valueTransformer;

@property (nonatomic, copy) FormFieldValidationRule validationRule;
@property (nonatomic, copy) NSString *validationErrorMessage;

@end

@implementation MultiFormFieldData

- (instancetype)
initWithKeyPath:(NSString *)keyPath
{
	return [self initWithKeyPath:keyPath setupBlock:nil];
}

+ (instancetype)
dataWithKeyPath:(NSString *)keyPath
{
	return [self dataWithKeyPath:keyPath setupBlock:nil];
}

- (instancetype)initWithKeyPath:(NSString *)keyPath setupBlock:(MultipleFormFieldSetupBlock)setupBlock
{
	if (self = [super init]) {
		_keyPath = [keyPath copy];
		_fields = [NSMutableArray array];
		if (setupBlock) {
			setupBlock(self);
		}
	}
	
	return self;
}

+ (instancetype)dataWithKeyPath:(NSString *)keyPath setupBlock:(MultipleFormFieldSetupBlock)setupBlock
{
	return [[[self class] alloc] initWithKeyPath:keyPath setupBlock:setupBlock];
}


- (void)
addFormField:(id<FormField>)formField
{
	[self.fields addObject:formField];
}

- (void)
removeFormField:(id<FormField>)formField
{
	[self.fields removeObject:formField];
}

- (NSArray *)
fieldValue
{
	NSArray *values = [self.fields valueForKeyPath:@"fieldValue"];
	
	if (self.valueTransformer) {
		NSMutableArray *result = [NSMutableArray arrayWithCapacity:values.count];
		
		for (id object in values) {
			[result addObject:self.valueTransformer(object) ?: [NSNull null]];
		}
		
		return result;
	}
	
	return values;
}

- (void)setValidationRule:(FormFieldValidationRule)validationRule errorMessage:(NSString *)errorMessage
{
	self.validationRule = validationRule;
	self.validationErrorMessage = errorMessage;
}

- (BOOL)validate
{
	__block BOOL isValid = YES;
	
	if (self.validationRule) {
		[self.fields enumerateObjectsUsingBlock:^(id<FormField> formField, NSUInteger idx, BOOL *stop) {
			BOOL result = self.validationRule(formField.fieldValue);
			if (!result) {
				[formField showValidationError:self.validationErrorMessage];
			}
			isValid = isValid && result;
		}];
	}
	
	return isValid;
}

@end
