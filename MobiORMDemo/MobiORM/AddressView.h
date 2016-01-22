//
// AddressView.h
//
// Representing row from View address_view.
//
// Generated by Mobi-ORM on Mon Nov 02 16:21:35 CET 2015
//

#import <Foundation/Foundation.h>
#import "MODate.h"

@interface AddressView : NSObject

// Property representing column address_id.
@property (nonatomic) NSNumber *columnAddressId;

// Property representing column address.
@property (nonatomic) NSString *columnAddress;

// Property representing column city_name.
@property (nonatomic) NSString *columnCityName;

// Property representing column country_name.
@property (nonatomic) NSString *columnCountryName;

// Object factory
+ (AddressView *)addressView;

// Designated initializer.
- (id)initWithAddressId:(NSNumber *)anAddressId address:(NSString *)anAddress cityName:(NSString *)aCityName countryName:(NSString *)aCountryName;

// Compares two instances of class AddressView.
- (BOOL)isEqualToAddressView:(AddressView *)addressView;

@end

