//
//  MultiFormField.m
//  Form
//
//  Created by Alex Antonyuk on 7/3/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "MultiFormField.h"

@interface MultiFormField ()

@property (nonatomic, strong) UITextField *textField1;
@property (nonatomic, strong) UITextField *textField2;

@end

@implementation MultiFormField

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
	self.textField1 = [UITextField new];
	self.textField1.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.textField1.backgroundColor = [UIColor greenColor];
	self.textField1.frame = CGRectInset(self.bounds, CGRectGetWidth(self.bounds) / 4.0, 0.0);
	self.textField1.frame = ({
		CGRect frame = self.textField1.frame;
		frame.origin.x = 0.0;
		frame;
	});
	[self addSubview:self.textField1];
	
	self.textField2 = [UITextField new];
	self.textField2.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.textField2.backgroundColor = [UIColor redColor];
	self.textField2.frame = CGRectInset(self.bounds, CGRectGetWidth(self.bounds) / 4.0, 0.0);
	self.textField2.frame = ({
		CGRect frame = self.textField2.frame;
		frame.origin.x = CGRectGetWidth(self.bounds) / 2.0;
		frame;
	});
	[self addSubview:self.textField2];
}

- (id)
fieldValue
{
	return @[self.textField1.text, self.textField2.text];
}

- (void)showValidationError:(NSString *)validationErrorMessage
{
	NSLog(@"multi error %@", validationErrorMessage);
}

@end
