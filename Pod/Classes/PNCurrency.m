// PNCurrency.m
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

@implementation PNCurrency {
    NSNumberFormatter* currencyFormatter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeFormatter];
        self.centsAmount = 0;
    }
    return self;
}

- (instancetype)initWithCentsAmount:(NSUInteger)centsAmount
{
    self = [super init];
    if (self) {
        [self initializeFormatter];
        self.centsAmount = centsAmount;
    }
    return self;
}

- (instancetype)initWithDoubleAmount:(double)doubleAmount
{
    self = [super init];
    if (self) {
        [self initializeFormatter];
        NSString* stringAmount = [currencyFormatter stringFromNumber:[NSNumber numberWithDouble:doubleAmount]];
        NSNumber* numberAmount = [currencyFormatter numberFromString:stringAmount];
        self.centsAmount = (NSUInteger)([numberAmount doubleValue] * 100);
    }
    return self;
}

- (instancetype)initWithStringAmount:(NSString*)stringAmount
{
    self = [super init];
    if (self) {
        [self initializeFormatter];
        NSNumber* numberAmount = [currencyFormatter numberFromString:stringAmount];
        self.centsAmount = (NSUInteger)([numberAmount doubleValue] * 100);
    }
    return self;
}

- (double)doubleAmount
{
    NSNumber* numberAmount = [currencyFormatter numberFromString:[NSString stringWithFormat:@"%f", (self.centsAmount / 100.0f)]];
    return [numberAmount doubleValue];
}

- (NSString*)stringAmount
{
    double doubleAmount = self.centsAmount / 100.0f;
    return [NSString stringWithFormat:@"%.02f", doubleAmount];
}

- (void)setWithDoubleAmount:(double)amount
{
    NSString* stringAmount = [currencyFormatter stringFromNumber:[NSNumber numberWithDouble:amount]];
    NSNumber* numberAmount = [currencyFormatter numberFromString:stringAmount];
    self.centsAmount = (NSUInteger)([numberAmount doubleValue] * 100);
}

- (void)setWithStringAmount:(NSString*)amount
{
    NSNumber* numberAmount = [currencyFormatter numberFromString:amount];
    self.centsAmount = (NSUInteger)([numberAmount doubleValue] * 100);
}

- (NSString*)formattedAmount
{
    double doubleAmount = self.centsAmount / 100.0f;
    return [NSString stringWithFormat:@"$%.02f", doubleAmount];
}

- (NSString*)formattedAmountWithSpace
{
    double doubleAmount = self.centsAmount / 100.0f;
    return [NSString stringWithFormat:@"$ %.02f", doubleAmount];
}

#pragma mark - Private Methods
- (void)initializeFormatter
{
    currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [currencyFormatter setRoundingMode:NSNumberFormatterRoundUp];
    [currencyFormatter setMaximumFractionDigits:2];
}

@end
