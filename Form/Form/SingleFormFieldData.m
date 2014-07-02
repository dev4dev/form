//
//  SingleFormFieldData.m
//  Form
//
//  Created by Alex Antonyuk on 7/2/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "SingleFormFieldData.h"

@interface SingleFormFieldData ()

@property (nonatomic, copy) NSString *keyPath;
@property (nonatomic, strong) id<FormField> formField;
@property (nonatomic, copy) FormFieldValueTransformer valueTransformer;

@property (nonatomic, copy) FormFieldValidationRule validationRule;
@property (nonatomic, copy) NSString *validationErrorMessage;

@end

@implementation SingleFormFieldData

- (instancetype)
initWithKeyPath:(NSString *)keyPath formField:(id<FormField>)formField
{
	return [self initWithKeyPath:keyPath formField:formField setupBlock:nil];
}

+ (instancetype)
dataWithKeyPath:(NSString *)keyPath formField:(id<FormField>)formField
{
	return [self dataWithKeyPath:keyPath formField:formField setupBlock:nil];
}

- (instancetype)
initWithKeyPath:(NSString *)keyPath formField:(id<FormField>)formField setupBlock:(SingleFormFieldSetupBlock)setupBlock
{
	if (self = [super init]) {
		_keyPath = [keyPath copy];
		_formField = formField;
		if (setupBlock) {
			setupBlock(self);
		}
	}
	
	return self;
}

+ (instancetype)
dataWithKeyPath:(NSString *)keyPath formField:(id<FormField>)formField setupBlock:(SingleFormFieldSetupBlock)setupBlock
{
	return [[[self class] alloc] initWithKeyPath:keyPath formField:formField setupBlock:setupBlock];
}

- (id)
fieldValue
{
	if (self.valueTransformer) {
		return self.valueTransformer(self.formField.fieldValue);
	}
	
	return self.formField.fieldValue;
}

- (void)setValidationRule:(FormFieldValidationRule)validationRule errorMessage:(NSString *)errorMessage
{
	self.validationRule = validationRule;
	self.validationErrorMessage = errorMessage;
}

- (BOOL)
validate
{
	if (self.validationRule) {
		BOOL result = self.validationRule(self.formField.fieldValue);
		if (!result) {
			[self.formField showValidationError:self.validationErrorMessage];
		}
		return result;
	}
	
	return YES;
}

@end
