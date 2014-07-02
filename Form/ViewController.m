//
//  ViewController.m
//  Form
//
//  Created by Alex Antonyuk on 7/2/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "ViewController.h"
#import "Form.h"
#import "TextFormField.h"
#import "MultiFormField.h"
#import "Person.h"

#import "SingleFormFieldData.h"
#import "MultiFormFieldData.h"

@interface ViewController ()

@property (nonatomic, strong) Form *form;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	TextFormField *field1 = [[TextFormField alloc] initWithFrame:CGRectMake(0.0, 30.0, 320.0, 34.0)];
	field1.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
	[self.view addSubview:field1];
	
	TextFormField *field2 = [[TextFormField alloc] initWithFrame:CGRectMake(0.0, 70.0, 320.0, 34.0)];
	field2.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
	[self.view addSubview:field2];
	
	TextFormField *field3 = [[TextFormField alloc] initWithFrame:CGRectMake(0.0, 110.0, 320.0, 34.0)];
	field3.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
	[self.view addSubview:field3];
	
	TextFormField *field4 = [[TextFormField alloc] initWithFrame:CGRectMake(0.0, 150.0, 320.0, 34.0)];
	field4.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
	[self.view addSubview:field4];
	
	MultiFormField *phone = [[MultiFormField alloc] initWithFrame:CGRectMake(0.0, 190.0, 320.0, 34.0)];
	phone.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
	[self.view addSubview:phone];
	
	MultiFormField *phone2 = [[MultiFormField alloc] initWithFrame:CGRectMake(0.0, 230.0, 320.0, 34.0)];
	phone2.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
	[self.view addSubview:phone2];
	
	self.form = [Form new];
	[self.form addFormFieldData:[SingleFormFieldData dataWithKeyPath:@"firstName" formField:field1 setupBlock:^(SingleFormFieldData *fieldData) {
		[fieldData setValueTransformer:^id(NSString *data) {
			return [data capitalizedString];
		}];
		[fieldData setValidationRule:^BOOL(NSString *value) {
			return value.length > 0;
		} errorMessage:@"Input First Name!"];
	}]];
	[self.form addFormFieldData:[SingleFormFieldData dataWithKeyPath:@"lastName" formField:field2 setupBlock:^(SingleFormFieldData *fieldData) {
		[fieldData setValueTransformer:^id(NSString *data) {
			return [data capitalizedString];
		}];
	}]];
	
//	MultiFormFieldData *fieldsData = [MultiFormFieldData dataWithKeyPath:@"fields" setupBlock:^(MultiFormFieldData *fieldData) {
//		[fieldData addFormField:field3];
//		[fieldData addFormField:field4];
//	}];
	[self.form addFormFieldData:[MultiFormFieldData dataWithKeyPath:@"fields" setupBlock:^(MultiFormFieldData *fieldData) {
		[fieldData addFormField:field3];
		[fieldData addFormField:field4];
		[fieldData setValueTransformer:^id(NSString *data) {
			return @{@"title": [[data capitalizedString] stringByAppendingString:@"~~``"]};
		}];
	}]];
	
	[self.form addFormFieldData:[MultiFormFieldData dataWithKeyPath:@"phones" setupBlock:^(MultiFormFieldData *fieldData) {
		[fieldData addFormField:phone];
		[fieldData addFormField:phone2];
		[fieldData setValueTransformer:^id(NSArray *data) {
			return @{@"modifier": data[0], @"value": data[1]};
		}];
		[fieldData setValidationRule:^BOOL(NSArray *value) {
			return ((NSString *)value[1]).length > 0;
		} errorMessage:@"Input Phone NUmber"];
	}]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)
doit:(id)sender
{
	if ([self.form validate]) {
		Person *person = [Person new];
		[self.form fillDataIntoObject:person];
		NSLog(@"%@", person);
	}
}

@end
