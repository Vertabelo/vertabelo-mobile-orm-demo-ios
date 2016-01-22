//
// Address.m
//
// Representing row from Table address.
//
// Generated by Mobi-ORM on Mon Nov 02 16:21:35 CET 2015
//

#import "Address.h"

@implementation Address

+ (Address *)address {
    return [[Address alloc] init];
}

- (id)initWithId:(NSNumber *)anId cityId:(NSNumber *)aCityId address:(NSString *)anAddress {
    self = [super init];

    if (self) {
        self.columnId = anId;
        self.columnCityId = aCityId;
        self.columnAddress = anAddress;
    }
    return self;
}

- (BOOL)isEqualToAddress:(Address *)address {
    if (!address) {
        return NO;
    }

    BOOL result = YES;
    result = result && ((!self.columnId && !address.columnId) || [self.columnId isEqualToNumber:address.columnId]);
    result = result && ((!self.columnCityId && !address.columnCityId) || [self.columnCityId isEqualToNumber:address.columnCityId]);
    result = result && ((!self.columnAddress && !address.columnAddress) || [self.columnAddress isEqualToString:address.columnAddress]);

    return result;
}

#pragma mark - NSObject

// Non-argument initializer implementation using designated initializer.
- (id)init {
    return [self initWithId:nil cityId:nil address:nil];
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    } else if (![object isKindOfClass:[Address class]]) {
        return NO;
    } else {
        return [self isEqualToAddress:(Address *)object];
    }
}

- (NSUInteger)hash {
    NSUInteger prime = 31;
    NSUInteger result = 1;

    result = prime * result + [self.columnId hash];
    result = prime * result + [self.columnCityId hash];
    result = prime * result + [self.columnAddress hash];

    return result;
}

- (NSString *)description {
    NSMutableString *result = [[NSMutableString alloc] init];

    [result appendString:@"Address:\n"];
    [result appendFormat:@"\t%@: %@\n", @"Id", self.columnId];
    [result appendFormat:@"\t%@: %@\n", @"City id", self.columnCityId];
    [result appendFormat:@"\t%@: %@\n", @"Address", self.columnAddress];

    return result;
}

@end
