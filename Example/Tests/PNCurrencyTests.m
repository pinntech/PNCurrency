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

@import XCTest;
#import <PNCurrency/PNCurrency.h>

/* Testing Constants */
NSUInteger const testCentsAmount = 123;
double const testDoubleAmount = 1.23;
NSString* const testStringAmount = @"1.23";

@interface PNCurrencyTests : XCTestCase

@end

@implementation PNCurrencyTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Inits
- (void)testInitShouldInitCorrectly
{
    PNCurrency* currency = [[PNCurrency alloc] init];
    XCTAssert(currency.centsAmount == 0);
}

- (void)testInitWithCentsAmountInitCorrectAmount
{
    PNCurrency* currency = [[PNCurrency alloc] initWithCentsAmount:testCentsAmount];
    XCTAssert(currency.centsAmount == testCentsAmount);
}

- (void)testInitWithDoubleAmountInitCorrectAmount
{
    PNCurrency* currency = [[PNCurrency alloc] initWithDoubleAmount:testDoubleAmount];
    XCTAssert(currency.centsAmount == testCentsAmount);
}

- (void)testInitWithStringAmountShouldInitCorrectAmount
{
    PNCurrency* currency = [[PNCurrency alloc] initWithStringAmount:testStringAmount];
    XCTAssert(currency.centsAmount == testCentsAmount);
}

#pragma mark - Getters
- (void)testDoubleAmountShouldReturnCorrectAmount
{
    PNCurrency* currency = [[PNCurrency alloc] initWithCentsAmount:testCentsAmount];
    XCTAssert([currency doubleAmount] == testDoubleAmount);
}

- (void)testStringAmountShouldReturnCorrectAmount
{
    PNCurrency* currency = [[PNCurrency alloc] initWithCentsAmount:testCentsAmount];
    XCTAssert([[currency stringAmount] isEqualToString:testStringAmount]);
}

#pragma mark - Setters
- (void)testSetWithDoubleAmountShouldSetCorrectAmount
{
    PNCurrency* currency = [[PNCurrency alloc] init];
    NSLog(@"%lu", currency.centsAmount);
    [currency setWithDoubleAmount:testDoubleAmount];
    XCTAssert(currency.centsAmount == testCentsAmount);
}

- (void)testSetWithStringAmountShouldSetCorrectAmount
{
    PNCurrency* currency = [[PNCurrency alloc] init];
    [currency setWithStringAmount:testStringAmount];
    XCTAssert(currency.centsAmount == testCentsAmount);
}

#pragma mark - Formatters
- (void)testFormattedStringShouldReturnCorrectString
{
    PNCurrency* currency = [[PNCurrency alloc] initWithCentsAmount:testCentsAmount];
    NSString* correctString = [NSString stringWithFormat:@"$%@", testStringAmount];
    XCTAssert([[currency formattedAmount] isEqualToString:correctString]);
}

- (void)testFormattedStringWithSpaceShouldReturnCorrectString
{
    PNCurrency* currency = [[PNCurrency alloc] initWithCentsAmount:testCentsAmount];
    NSString* correctString = [NSString stringWithFormat:@"$ %@", testStringAmount];
    XCTAssert([[currency formattedAmountWithSpace] isEqualToString:correctString]);
}

@end
