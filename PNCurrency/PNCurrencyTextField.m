// PNCurrencyTextField.m
// Copyright (c) 2016 Pinn Technologies, Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "PNCurrencyTextField.h"

@interface PNCurrencyTextField ()
@property (nonatomic, strong) NSNumberFormatter* currencyFormatter;
@property (nonatomic, strong) NSCharacterSet* illegalCharacterSet;
@property (nonatomic, weak) id<UITextFieldDelegate> textFieldDelegate;
@end

@implementation PNCurrencyTextField

- (instancetype)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    [super setDelegate:self];
    [self initializeFormatter];
    self.keyboardType = UIKeyboardTypeDecimalPad;
    NSCharacterSet* legalCharacters = [NSCharacterSet characterSetWithCharactersInString:@".1234567890"];
    self.illegalCharacterSet = [legalCharacters invertedSet];
}

- (PNCurrency*)amount
{
    PNCurrency* currency = [[PNCurrency alloc] initWithStringAmount:self.text];
    return currency;
}

#pragma mark - UITextField Delegate Methods
- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string
{
    // Delete chars should return YES and get out
    if ([string isEqualToString:@""]) {
        return YES;
    }

    // See if string has any illegal characters and filter out
    NSRange r = [string rangeOfCharacterFromSet:self.illegalCharacterSet];
    if (r.location != NSNotFound) {
        return NO;
    }

    // If decimal check to make sure if its decimal that we dont already have one
    if ([string isEqualToString:@"."]) {
        if ([textField.text containsString:@"."]) {
            return NO;
        }
    }

    // Check to make sure there is only two digits after the decimal
    NSArray* textComponents = [textField.text componentsSeparatedByString:@"."];
    // Means we have a price already at xn.x at least if its xn.xx dont dont append
    if (textComponents.count == 2) {
        NSString* lastComponent = textComponents[1];
        if (lastComponent.length == 2) {
            return NO;
        }
    }

    if ([self.textFieldDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        [self.textFieldDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }

    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField*)textField
{
    if (self.activeColor) {
        self.textColor = self.activeColor;
    }
    if ([self.textFieldDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [self.textFieldDelegate textFieldDidBeginEditing:self];
    }
}

- (void)textFieldDidEndEditing:(UITextField*)textField
{
    // If we have one path component infer the cents amount .00
    NSArray* textComponents = [textField.text componentsSeparatedByString:@"."];
    if (textComponents.count == 1) {
        // Unless the first text component is absolutely empty we can infer the .00
        NSString* firstComponent = textComponents[0];
        if (![firstComponent isEqualToString:@""]) {
            NSString* fixedAmount = [NSString stringWithFormat:@"%@.00", self.text];
            self.text = fixedAmount;
        }
    }
    else if (textComponents.count == 2) {
        NSString* secondComponent = textComponents[1];
        // If second component is empty string also infer the cents .
        if ([secondComponent isEqualToString:@""]) {
            NSString* fixedAmount = [NSString stringWithFormat:@"%@00", self.text];
            self.text = fixedAmount;
        }
        // If second component is just one number append and inferred 0
        if (secondComponent.length == 1) {
            NSString* fixedAmount = [NSString stringWithFormat:@"%@0", self.text];
            self.text = fixedAmount;
        }
    }

    // Final pass on the formatter
    NSNumber* numberValue = [self.currencyFormatter numberFromString:[NSString stringWithFormat:@"%@", self.text]];
    NSString* formattedString = [self.currencyFormatter stringFromNumber:numberValue];
    self.text = [formattedString stringByReplacingOccurrencesOfString:@"$" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, 1)];

    // Handle for max values

    if (self.inactiveColor) {
        self.textColor = self.inactiveColor;
    }

    if ([self.textFieldDelegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [self.textFieldDelegate textFieldDidEndEditing:self];
    }
}

#pragma mark - UITextFieldDelegate Forwarding
- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([self.textFieldDelegate respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if ([self.textFieldDelegate respondsToSelector:aSelector]) {
        return self.textFieldDelegate;
    }
    return [super forwardingTargetForSelector:aSelector];
}

#pragma mark - Private Methods
- (void)initializeFormatter
{
    self.currencyFormatter = [[NSNumberFormatter alloc] init];
    [self.currencyFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [self.currencyFormatter setRoundingMode:NSNumberFormatterRoundUp];
    [self.currencyFormatter setMaximumFractionDigits:2];
}

@end
