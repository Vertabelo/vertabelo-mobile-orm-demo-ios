//
// City.m
//
// Representing row from Table city.
//
// Generated by Mobi-ORM on Mon Nov 02 16:21:35 CET 2015
//

#import "City.h"

@implementation City

+ (City *)city {
    return [[City alloc] init];
}

- (id)initWithId:(NSNumber *)anId countryId:(NSNumber *)aCountryId name:(NSString *)aName {
    self = [super init];

    if (self) {
        self.columnId = anId;
        self.columnCountryId = aCountryId;
        self.columnName = aName;
    }
    return self;
}

- (BOOL)isEqualToCity:(City *)city {
    if (!city) {
        return NO;
    }

    BOOL result = YES;
    result = result && ((!self.columnId && !city.columnId) || [self.columnId isEqualToNumber:city.columnId]);
    result = result && ((!self.columnCountryId && !city.columnCountryId) || [self.columnCountryId isEqualToNumber:city.columnCountryId]);
    result = result && ((!self.columnName && !city.columnName) || [self.columnName isEqualToString:city.columnName]);

    return result;
}

#pragma mark - NSObject

// Non-argument initializer implementation using designated initializer.
- (id)init {
    return [self initWithId:nil countryId:nil name:nil];
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    } else if (![object isKindOfClass:[City class]]) {
        return NO;
    } else {
        return [self isEqualToCity:(City *)object];
    }
}

- (NSUInteger)hash {
    NSUInteger prime = 31;
    NSUInteger result = 1;

    result = prime * result + [self.columnId hash];
    result = prime * result + [self.columnCountryId hash];
    result = prime * result + [self.columnName hash];

    return result;
}

- (NSString *)description {
    NSMutableString *result = [[NSMutableString alloc] init];

    [result appendString:@"City:\n"];
    [result appendFormat:@"\t%@: %@\n", @"Id", self.columnId];
    [result appendFormat:@"\t%@: %@\n", @"Country id", self.columnCountryId];
    [result appendFormat:@"\t%@: %@\n", @"Name", self.columnName];

    return result;
}

@end

