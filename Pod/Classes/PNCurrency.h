// PNCurrency.h
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

#import <Foundation/Foundation.h>

/**
 *  Stores US currecy in a safe way that is easily converible to other types
 *  such as a string, double, integer amount in cents and so on. Internally the
 *  data is stored as an amount in cents raw but can be initialized in several
 *  ways for convenience.
 */
@interface PNCurrency : NSObject

/**
 *  The interanl storage for the object, provides a consistent safe way to hold
 *  the amount in and convert to other styles
 */
@property (nonatomic, assign) NSUInteger centsAmount;

/**
 *  Initializes a new PNCurrency object set to $0.00
 *
 *  @return A newly created PNCurrency object
 */
- (instancetype)init;

/**
 *  Initializes a new PNCurrency object by providing a cents amount
 *
 *  @param centsAmount An integer of the amount in cents
 *
 *  @return A newly created PNCurrency object
 */
- (instancetype)initWithCentsAmount:(NSUInteger)centsAmount;

/**
 *  Initializes a new PNCurrency object by providing a double of the amount
 *  all extra digits will round to the nearest cents value may be inferred
 *  if not provided.
 *
 *  @param doubleAmount The amount as a double
 *
 *  @return A newly created PNCurrency object
 */
- (instancetype)initWithDoubleAmount:(double)doubleAmount;

/**
 *  Initializes a new PNCurrency object by providing a double of the amount
 *  all extra digits will round to the nearest cents value may be inferred
 *  if not provided.
 *
 *  @param doubleAmount The amount as a string
 *
 *  @return A newly created PNCurrency object
 */
- (instancetype)initWithStringAmount:(NSString*)stringAmount;

/**
 *  The amount as a double, with finite precision to the cents position y.xx
 *
 *  @return The amount returned as a double
 */
- (double)doubleAmount;

/**
 *  The amount as a string with finit precision to the cents position y.xx
 *
 *  @return The amount returned as a string
 */
- (NSString*)stringAmount;

/**
 *  Sets a new value on an already instantiated PNCurrency object with a double
 *  amount all extra digits will round to the nearest cents value may be inferred
 *  if not provided.
 *
 *  @param amount The amount in cents
 */
- (void)setWithDoubleAmount:(double)amount;

/**
 *  Sets a new value on an already instantiated PNCurrency object with a double
 *  amount all extra digits will round to the nearest cents value may be inferred
 *  if not provided.
 *
 *  @param amount The amount in cents
 */
- (void)setWithStringAmount:(NSString*)amount;

/**
 *  The amount in pretty formatting with dollar sign, for example "$3.12"
 *
 *  @return The pretty formatted string
 */
- (NSString*)formattedAmount;

/**
 *  The amount in pretty formatting with dollar sign, with a space between
 *  the dollar sign and amount itself, for example "$ 3.12"
 *
 *  @return The pretty formatted string
 */
- (NSString*)formattedAmountWithSpace;

@end
