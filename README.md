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

Theres a few different ways to instantiate a new PNCurrency object

###### Init

The plain init will default the amount to zero. Just alloc init the object like so:

```objc
PNCurrency *currency = [[PNCurrency alloc] init];
```

###### Init With Cents Amount

To create the object when you have an amount in cents use this:

```objc
// Initialize currency to a dollar
PNCurrency *currency = [[PNCurrency alloc] initWithCentsAmount:100];
```

###### Init With Double Amount

You might have a raw double, in which case you'll want to use this:

```objc
// Initialize currency to a dollar
PNCurrency *currency = [[PNCurrency alloc] initWithDoubleAmount:1.00];
```

###### Init With String Amount

Finally if you have a string that represents the amount you can feed that in as well:

```objc
// Initialize currency to a dollar
PNCurrency *currency = [[PNCurrency alloc] initWithStringAmount:@"1.00"];
```

#### Setters

#### Getters

#### Formatters

### Docs
--------

You can check out the full reference documentation
[here](http://cocoadocs.org/docsets/PNCurrency/).

### Changelog
-------------

* *v1.0* Initial release **(4/1/15)**

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
