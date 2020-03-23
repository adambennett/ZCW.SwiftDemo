# Swift

## Overview
* Uses and History
	1. Developer
	2. Purpose

* Swift Features
	1. Closure Support
	2. Access control
	3. Optionals and chaining

<hr>
<hr>

## Section 1 - Uses and History

### Developer
* **Apple, Inc.**
	* Developed by Apple, Inc.
	* First released June 2nd, 2014
	* Latest version: 5.1.5
	* Apache License 2.0
	* swift.org
	
### Purpose
* **Purpose**
	* Swift is designed to work with Apple's 
	Cocoa and Cocoa Touch frameworks and the 
	large body of existing Objective-C code 
	written for Apple product
	* it uses the Objective-C runtime library 
	which allows C, Objective-C, C++ and Swift 
	code to run within one program
<hr>
<hr>

## Section 2 - Swift Features

### Closure Support
* **Closures**
	* Referred to as 'lambdas' in other languages
	```	
		// Example Closure for adding 2 numbers together
		{(arg1: Int, arg2: Int) -> Int in
			return arg1 + arg2
		}
	```
	
	* Has trailing closure syntax
	```
		// This function takes a closure or function that returns an int and then just evaluates the function.
		func a(closure a: () -> Int) -> Int {
			return a()
		}

		/// Without trailing closure syntax
		a(closure: {return 1})

		/// With trailing closure syntax
		a {return 1}
	```
### Access Control
* **Modifiers**
	* Swift supports five access control modifiers for symbols
		* `open` - only can be used on classes and methods, indicates that the class may be subclasses outside of the module
		* `public` - accessible from any module
		* `internal` - acccesible from only the containing module
		* `fileprivate` - accessible from only the same file
		* `private` - accessible only in the immediate scope

### Optionals, Chaining, Error Handling
* **Optionals**
	* Swift provides option types, which allow references to point to either a value or null
	* Syntactic sugar and Swift convention allows for the declaration of optionals by simply placing a `?` after the type name
		* `var optionalInteger: Int?`
	* Variables/constants that are marked optional either have a value of the underlying type, or are `nil`
	* Optional types <em>wrap</em> the base type, resulting in a different instance
		* `String` and `String?` are fundamentally different types
	* To access the value inside an optional, assuming it is not nil, it must be unwrapped with the `!` operator
		* `let myValue = someOptional!.someMethod()`
	* If you unwrap `someOptional` in this way and the value is nil, a null-pointer exception occurs
	* This can be annoying in practice, so Swift allows for optional chaining

* **Chaining**
	* Can be applied to the above scenario to prevent a null-pointer like so
		* `let myValue = someOptional?.someMethod()`
		* In this case, runtime would only call `someMethod` if `someOptional` is not nil 
	* Can also chain other methods together to produce more concise code
		```
			let aTenant = aBuilding.TenantList[5]
			let theirLease = aTenant.leaseDetails
			let leaseStart = theirLease?.startDate
		```
		
		Can be reduced to
		
		```
		let leaseStart = aBuilding.TenantList[5].leaseDetails?.startDate
		```

* **Error Handling**
	* Swift 2 introduced the keyword `guard` for cases in which code should stop executing if some condition is unmet
		```
			guard let leaseStart = aBuilding.TenantList[5]?.leaseDetails?.startDate else
			{
			    //handle the error case where anything in the chain is nil
			    //else scope must exit the current method or loop
			}
			//continue, knowing that leaseStart is not nil
		```
	* Some instances, this can allow you to bypass the need for optionals at all
		```
			func submit() {
			    guard let name = nameField.text else {
				show("No name to submit")
				return
			    }

			    guard let address = addressField.text else {
				show("No address to submit")
				return
			    }

			    guard let phone = phoneField.text else {
				show("No phone to submit")
				return
			    }

			    sendToServer(name, address: address, phone: phone)
			}

			func sendToServer(name: String, address: String, phone: String) {
			  ...
			}
		```
		
		In this instance you can imagine we are sending information back and forth from a server, and maybe we don't want our server code to have to deal with `nil` values, so we will unwrap the users input client-side using `guard` first.
