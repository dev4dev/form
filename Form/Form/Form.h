//
//  Form.h
//  Form
//
//  Created by Alex Antonyuk on 7/2/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormFieldData.h"
#import "FormField.h"

@interface Form : NSObject

- (void)addFormFieldData:(id<FormFieldData>)formFieldData;
- (id<FormFieldData>)formFieldDataForKeyPath:(NSString *)keyPath;

- (BOOL)validate;
- (void)fillDataIntoObject:(id)object;

@end
