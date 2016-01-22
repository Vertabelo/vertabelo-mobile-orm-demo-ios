//
// AddressViewDAO.m
//
// DAO for View address_view.
//
// Generated by Mobi-ORM on Mon Nov 02 16:21:35 CET 2015
//

#import "AddressViewDAO.h"
#import "AddressView.h"
#import "MOSQLiteManager.h"
#import "AddressViewRowHandler.h"
#import "MORowHandlerForNumber.h"
#import "MORowHandlerForObject.h"
#import "MORowHandlerForData.h"

@interface AddressViewDAO ()

@property MOSQLiteManager *manager;

@end

@implementation AddressViewDAO

+ (AddressViewDAO *)daoWithDataSource:(id <MOSQLiteDataSource>)dataSource {
    return [[AddressViewDAO alloc] initWithDataSource:dataSource];
}

- (id)initWithDataSource:(id <MOSQLiteDataSource>)dataSource {
    self = [super init];

    if (self) {
        self.manager = [[MOSQLiteManager alloc] initWithDataSource:dataSource];
        _TABLE_EXPRESSION = [[MOTableExpression alloc] initWithName:@"address_view"];
        _rowHandler = [[AddressViewRowHandler alloc] init];

        _ADDRESS_ID = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"address_id" type:INT];
        [self.TABLE_EXPRESSION addColumn:self.ADDRESS_ID];

        _ADDRESS = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"address" type:VARCHAR];
        [self.TABLE_EXPRESSION addColumn:self.ADDRESS];

        _CITY_NAME = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"city_name" type:VARCHAR];
        [self.TABLE_EXPRESSION addColumn:self.CITY_NAME];

        _COUNTRY_NAME = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"country_name" type:VARCHAR];
        [self.TABLE_EXPRESSION addColumn:self.COUNTRY_NAME];

    }
    return self;
}

- (NSArray *)select:(MOSelectQuery *)query {
    return [self.manager loadDataFromQuery:query withRowHandler:self.rowHandler];
}

- (NSArray *)select:(MOSelectQuery *)query withRowHandler:(id <MORowHandler>)rowHandler {
    return [self.manager loadDataFromQuery:query withRowHandler:rowHandler];
}

- (AddressView *)selectOne:(MOSelectQuery *)query {
    NSArray *result = [self select:query];

    if ([result count] == 1) {
        return result[0];
    } else if ([result count] > 1) {
        @throw [NSException exceptionWithName:@"MultipleRowsException" reason:@"Query returned more than one row" userInfo:nil];
    } else {
        return nil;
    }
}

- (NSArray *)getAddressViewArray {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    return [self select:query];
}

- (NSArray *)getAddressViewArrayOrderAscByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.orderBy = @[[MOOrderBy orderAscByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getAddressViewArrayOrderDescByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.orderBy = @[[MOOrderBy orderDescByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getAddressViewArrayWhere:(MOLExp *)where {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = where;
    return [self select:query];
}

- (NSArray *)getAddressViewArrayWhere:(MOLExp *)where orderAscByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = where;
    query.orderBy = @[[MOOrderBy orderAscByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getAddressViewArrayWhere:(MOLExp *)where orderDescByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = where;
    query.orderBy = @[[MOOrderBy orderDescByColumn:orderBy]];
    return [self select:query];
}

- (NSUInteger)getCount {
    MOSelectQuery *query = [MOSelectQuery selectColumn:[MOAExp funWithName:@"COUNT" forArgument:[MOColumn asterisk]] fromTable:self.TABLE_EXPRESSION];
    return (NSUInteger)[[self select:query withRowHandler:[[MORowHandlerForNumber alloc] init]][0] integerValue];
}

- (NSUInteger)getCountWhere:(MOLExp *)where {
    MOSelectQuery *query = [MOSelectQuery selectColumn:[MOAExp funWithName:@"COUNT" forArgument:[MOColumn asterisk]] fromTable:self.TABLE_EXPRESSION];
    query.where = where;
    return (NSUInteger)[[self select:query withRowHandler:[[MORowHandlerForNumber alloc] init]][0] integerValue];
}

- (id)invokeFunction:(NSString *)name withArgument:(MOAExp *)arg {
    MOSelectQuery *query = [MOSelectQuery selectColumn:[MOAExp funWithName:name forArgument:arg] fromTable:self.TABLE_EXPRESSION];
    return [self select:query withRowHandler:[[MORowHandlerForObject alloc] init]][0];
}

- (id)invokeFunction:(NSString *)name withArgument:(MOAExp *)arg where:(MOLExp *)where {
    MOSelectQuery *query = [MOSelectQuery selectColumn:[MOAExp funWithName:name forArgument:arg] fromTable:self.TABLE_EXPRESSION];
    query.where = where;
    return [self select:query withRowHandler:[[MORowHandlerForObject alloc] init]][0];
}

- (id)invokeForAllFunction:(NSString *)name {
    MOSelectQuery *query = [MOSelectQuery selectColumn:[MOAExp funWithName:name forArgument:[MOColumn asterisk]] fromTable:self.TABLE_EXPRESSION];
    return [self select:query withRowHandler:[[MORowHandlerForObject alloc] init]][0];
}

@end

