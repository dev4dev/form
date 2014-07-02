//
//  TextFormField.m
//  Form
//
//  Created by Alex Antonyuk on 7/2/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "TextFormField.h"

@interface TextFormField ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation TextFormField

- (instancetype)
initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
		[self setupView];
    }
    return self;
}

- (void)
setupView
{
	self.textField = [UITextField new];
	self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.textField.frame = self.bounds;
	[self addSubview:self.textField];
}

- (id)
fieldValue
{
	return self.textField.text;
}

- (void)showValidationError:(NSString *)validationErrorMessage
{
	NSLog(@"single error %@", validationErrorMessage);
}

@end
