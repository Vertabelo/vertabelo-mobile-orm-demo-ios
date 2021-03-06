//
// Tag.m
//
// Representing row from Table tag.
//
// Generated by Mobi-ORM on Mon Nov 02 16:21:35 CET 2015
//

#import "Tag.h"

@implementation Tag

+ (Tag *)tag {
    return [[Tag alloc] init];
}

- (id)initWithName:(NSString *)aName {
    self = [super init];

    if (self) {
        self.columnName = aName;
    }
    return self;
}

- (BOOL)isEqualToTag:(Tag *)tag {
    if (!tag) {
        return NO;
    }

    BOOL result = YES;
    result = result && ((!self.columnName && !tag.columnName) || [self.columnName isEqualToString:tag.columnName]);

    return result;
}

#pragma mark - NSObject

// Non-argument initializer implementation using designated initializer.
- (id)init {
    return [self initWithName:nil];
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    } else if (![object isKindOfClass:[Tag class]]) {
        return NO;
    } else {
        return [self isEqualToTag:(Tag *)object];
    }
}

- (NSUInteger)hash {
    NSUInteger prime = 31;
    NSUInteger result = 1;

    result = prime * result + [self.columnName hash];

    return result;
}

- (NSString *)description {
    NSMutableString *result = [[NSMutableString alloc] init];

    [result appendString:@"Tag:\n"];
    [result appendFormat:@"\t%@: %@\n", @"Name", self.columnName];

    return result;
}

@end

