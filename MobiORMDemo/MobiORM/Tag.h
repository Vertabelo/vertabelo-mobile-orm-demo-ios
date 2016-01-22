//
// Tag.h
//
// Representing row from Table tag.
//
// Generated by Mobi-ORM on Mon Nov 02 16:21:35 CET 2015
//

#import <Foundation/Foundation.h>
#import "MODate.h"

@interface Tag : NSObject

// Property representing column name.
@property (nonatomic) NSString *columnName;

// Object factory
+ (Tag *)tag;

// Designated initializer.
- (id)initWithName:(NSString *)aName;

// Compares two instances of class Tag.
- (BOOL)isEqualToTag:(Tag *)tag;

@end

