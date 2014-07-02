//
//  FormFieldData.h
//  Form
//
//  Created by Alex Antonyuk on 7/2/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^FormFieldValueTransformer)(id data);
typedef BOOL(^FormFieldValidationRule)(id value);

@protocol FormFieldData <NSObject>

@property (nonatomic, copy, readonly) NSString *keyPath;
@property (nonatomic, strong, readonly) id fieldValue;

- (void)setValueTransformer:(FormFieldValueTransformer)valueTransformer;
- (void)setValidationRule:(FormFieldValidationRule)validationRule errorMessage:(NSString *)errorMessage;
- (BOOL)validate;

@end
