//
// Address.h
//
// Representing row from Table address.
//
// Generated by Mobi-ORM on Mon Nov 02 16:21:35 CET 2015
//

#import <Foundation/Foundation.h>
#import "MODate.h"

@interface Address : NSObject

// Property representing column id.
@property (nonatomic) NSNumber *columnId;

// Property representing column city_id.
@property (nonatomic) NSNumber *columnCityId;

// Property representing column address.
@property (nonatomic) NSString *columnAddress;

// Object factory
+ (Address *)address;

// Designated initializer.
- (id)initWithId:(NSNumber *)anId cityId:(NSNumber *)aCityId address:(NSString *)anAddress;

// Compares two instances of class Address.
- (BOOL)isEqualToAddress:(Address *)address;

@end

