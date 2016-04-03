![Alt text](https://raw.githubusercontent.com/pinnrepo/PNCurrency/master/logo.png?raw=true "PNCurrency")
--------------------------------------------------------------------------------------------------------

PNCurrency makes it easy to interchange different currency formats within your
applicaiton. If you've ever worked with currency in your app before then you
know how common of a task it is converting between cents, double, strings or
even some formatted variant of those. That's where PNCurrency comes in, it is
a simple interface for doing just that. Read on to check out the interface and
see how to get started.

### Table of Contents
---------------------

- [PNCurrency](#pncurrency)
    * [Install](#install)
    * [Features](#features)
    * [Usage](#usage)
    * [Docs](#docs)
    * [Changelog](#changelog)
    * [Roadmap](#roadmap)
    * [Contributing](#contributing)
    * [Authors](#authors)
    * [License](#license)

### Install
-----------

###### Cocoapods

PNCurrency is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod "PNCurrency"
```

Now you can add to your project with

```objc
#import <PNCurrency/PNCurrency.h>
```

###### Source

You can clone the repo with git:

```
git clone https://github.com/pinnrepo/PNCurrency.git
```

then simply add the files to your project, and use a local import header

```objc
#import "PNCurrency.h"
```

### Features
------------

Here's some good reasons to use PNCurrency in your next project instead of
writing your own:

* 100% documentation coverage
* Thoroughly unit tested
* Cocoapods integration, get started quick
* Simple interface that will drop petty lines from your source

### Usage
---------

Here's the quick jist of how to get started using PNCurrency

#### Initialization

Theres a few different ways to instantiate a new PNCurrency object, here they
are to show you how to best init the object for your usage.

###### init

The plain init will default the amount to zero. Just alloc init the object like so:

```objc
PNCurrency *currency = [[PNCurrency alloc] init];
```

###### initWithCentsAmount

To create the object when you have an amount in cents use this:

```objc
// Initialize currency to a dollar
PNCurrency *currency = [[PNCurrency alloc] initWithCentsAmount:100];
```

###### initWithDoubleAmount

You might have a raw double, in which case you'll want to use this:

```objc
// Initialize currency to a dollar
PNCurrency *currency = [[PNCurrency alloc] initWithDoubleAmount:1.00];
```

###### initWithStringAmount

Finally if you have a string that represents the amount you can feed that in as well:

```objc
// Initialize currency to a dollar
PNCurrency *currency = [[PNCurrency alloc] initWithStringAmount:@"1.00"];
```

#### Setters

Theres a good chance you're going to want to update the currency value to
something else in the objects lifetime, this can be done easily a few different
ways

###### centsAmount

You can modify the amount by changing the centsAmount property:

```objc
PNCurrency *currency = [[PNCurrency alloc] init];
currency.centsAmount = 10 // value is now $0.10
```

###### setWithDoubleAmount

Or change it with a new double value:

```objc
PNCurrency *currency = [[PNCurrency alloc] init];
[currency setWithDoubleAmount:1.11] // value is now $1.11
```

###### setWithStringAmount

Finally with a  new string value:

```objc
PNCurrency *currency = [[PNCurrency alloc] init];
[currency setWithStringAmount:@"2.00"] // value is now $2.00
```

#### Getters

Nothing fancy here but safe convenient autoconversions, when you need to 
actually return the value here's what to do

###### centsAmount

You can utilize the cents amount property to get the raw amount of cents as an
unsigned integer

```objc
PNCurrency *currency = [[PNCurrency alloc] initWithStringAmount:@"1.00"];
[currency centsAmounts] // Value is 100 (you can also use currency.centsAmount
```

###### doubleAmount

Returns the amount as a double value, may be truncated for trailing zeroes

```objc
PNCurrency *currency = [[PNCurrency alloc] initWithCentsAmount:100];
[currency doubleAmount] // Value is 1.00
```

###### stringAmount

Returns the amount as a string exactly as you would expect

```objc
PNCurrency *currency = [[PNCurrency alloc] initWithCentsAmount:100];
NSLog(@"%@", [currency stringAmount]) // prints "1.00"
```

#### Formatters

Often you'll want to print this stuff to the screen so chances are you will
want something like "$1.00" as opposed to a double or amount in cents. These
are the convenience formatters.

###### formattedAmount

Simply prints the value formatted with the dollar sign right in front

```objc
PNCurrency *currency = [[PNCurrency alloc] initWithCentsAmount:100];
NSLog(@"%@", [currency formattedAmount]) // prints "$1.00"
```

###### formattedAmountWithSpace

Prints the dollar sign in front of the amount but with a space between the $
and the amount itself

```objc
PNCurrency *currency = [[PNCurrency alloc] initWithCentsAmount:100];
NSLog(@"%@", [currency formattedAmountWithSpace]) // prints "$ 1.00"
```

### Docs
--------

You can check out the full reference documentation
[here](http://cocoadocs.org/docsets/PNCurrency/).

### Changelog
-------------

* **v1.0** - Initial release *(4/1/15)*

### Roadmap
-----------

Here's a list of features and improvements that are up and coming

* NSCoding and NSCopying compliant
* Setters for just dollars portion or cents portion

### Contributing
----------------

1. Fork it
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Run `flake8 . --exclude=.venv`
6. Submit a pull request

### Authors
-----------

- David Westerhoff (david@getpinn.co)
- Tim Co (tim@getpinn.co)

### License
-----------

The MIT License (MIT)

Copyright (c) 2016 Pinn Technologies, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
