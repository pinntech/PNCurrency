// PNCurrencyTextField.h
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

#import "PNCurrency.h"
#import <UIKit/UIKit.h>

/**
 *  A UITextField subclass that is great for use with US currency. Text is
 *  automatically formatted in the correct manner upon completion of editing,
 *  inferring digits and decimals if necessary. In addition the text field 
 *  inforces a decimal pad as well as only numeric digits as well as '.' 
 *  characters.
 */
@interface PNCurrencyTextField : UITextField <UITextFieldDelegate>

/**
 *  Active color specifies the color that is used when the currency text field
 *  is being edited, defaults to the UITextField text color
 */
@property (nonatomic, strong) UIColor* activeColor;

/**
 *  Inactive color specifies the color that is used when the currency text field
 *  is no longer being edited, defaults to the UITextField text color
 */
@property (nonatomic, strong) UIColor* inactiveColor;

/**
 *  The max amount that the text field will take, if the value entered by the
 *  user exceeds the max amount it will be rounded down to the maxAmount
 */
@property (nonatomic, assign) NSDecimal maxAmount;

/**
 *  Returns the amount that the text field is currently at, will return $0.00
 *  if no value is set.
 *
 *  @return The amount as a PNCurrency object
 */
- (PNCurrency*)amount;

@end
