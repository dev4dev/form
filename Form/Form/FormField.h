//
//  FormField.h
//  Form
//
//  Created by Alex Antonyuk on 7/2/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FormField <NSObject>

@property (nonatomic, strong, readonly) id fieldValue;

- (void)showValidationError:(NSString *)validationErrorMessage;

@end
