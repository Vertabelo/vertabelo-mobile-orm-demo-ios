//
// PlaceTag.h
//
// Representing row from Table place_tag.
//
// Generated by Mobi-ORM on Mon Nov 02 16:21:35 CET 2015
//

#import <Foundation/Foundation.h>
#import "MODate.h"

@interface PlaceTag : NSObject

// Property representing column place_id.
@property (nonatomic) NSNumber *columnPlaceId;

// Property representing column tag_name.
@property (nonatomic) NSString *columnTagName;

// Object factory
+ (PlaceTag *)placeTag;

// Designated initializer.
- (id)initWithPlaceId:(NSNumber *)aPlaceId tagName:(NSString *)aTagName;

// Compares two instances of class PlaceTag.
- (BOOL)isEqualToPlaceTag:(PlaceTag *)placeTag;

@end

