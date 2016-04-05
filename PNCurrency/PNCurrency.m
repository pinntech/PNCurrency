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

@interface PNCurrency ()
@property (nonatomic, strong) NSNumberFormatter* currencyFormatter;
@property (nonatomic, strong) NSDecimalNumberHandler* decimalNumberHandler;
@end

@implementation PNCurrency

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeFormatter];
        self.amount = [[NSDecimalNumber alloc] initWithUnsignedInteger:0];
    }
    return self;
}

- (instancetype)initWithCentsAmount:(NSUInteger)centsAmount
{
    self = [super init];
    if (self) {
        [self initializeFormatter];
        self.amount = [[NSDecimalNumber alloc] initWithUnsignedInteger:centsAmount];
        self.amount = [self.amount decimalNumberByDividingBy:[[NSDecimalNumber alloc] initWithDouble:100.0]];
    }
    return self;
}

- (instancetype)initWithDoubleAmount:(double)doubleAmount
{
    self = [super init];
    if (self) {
        [self initializeFormatter];
        self.amount = [[NSDecimalNumber alloc] initWithDouble:doubleAmount];
    }
    return self;
}

- (instancetype)initWithStringAmount:(NSString*)stringAmount
{
    self = [super init];
    if (self) {
        [self initializeFormatter];
        NSString* safeStringAmount = [stringAmount stringByReplacingOccurrencesOfString:@"$" withString:@""];
        safeStringAmount = [safeStringAmount stringByReplacingOccurrencesOfString:@"," withString:@""];
        safeStringAmount = [safeStringAmount stringByReplacingOccurrencesOfString:@" " withString:@""];
        self.amount = [[NSDecimalNumber alloc] initWithString:safeStringAmount];
    }
    return self;
}

- (NSUInteger)centsAmount
{
    NSDecimalNumber* centsDecimalAmount = [self.amount decimalNumberByMultiplyingByPowerOf10:2
                                                                                withBehavior:self.decimalNumberHandler];
    return [centsDecimalAmount unsignedIntegerValue];
}

- (double)doubleAmount
{
    return [self.amount doubleValue];
}

- (NSString*)stringAmount
{
    NSString* stringAmount = [self.currencyFormatter stringFromNumber:self.amount];
    NSString* amountWithoutDollarSign = [stringAmount stringByReplacingOccurrencesOfString:@"$" withString:@""];
    return amountWithoutDollarSign;
}

- (NSString*)formattedAmount
{
    return [NSString stringWithFormat:@"$%@", [self stringAmount]];
}

- (NSString*)formattedAmountWithSpace
{
    return [NSString stringWithFormat:@"$ %@", [self stringAmount]];
}

#pragma mark - Private Methods
- (void)initializeFormatter
{
    self.currencyFormatter = [[NSNumberFormatter alloc] init];
    [self.currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [self.currencyFormatter setCurrencyCode:@"USD"];
    [self.currencyFormatter setRoundingMode:NSNumberFormatterRoundUp];
    [self.currencyFormatter setMaximumFractionDigits:2];
    self.decimalNumberHandler = [NSDecimalNumberHandler
        decimalNumberHandlerWithRoundingMode:NSRoundBankers
                                       scale:2
                            raiseOnExactness:YES
                             raiseOnOverflow:YES
                            raiseOnUnderflow:YES
                         raiseOnDivideByZero:YES];
}

@end
