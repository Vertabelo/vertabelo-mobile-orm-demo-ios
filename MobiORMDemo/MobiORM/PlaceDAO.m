//
// PlaceDAO.m
//
// DAO for Table place.
//
// Generated by Mobi-ORM on Mon Nov 02 16:21:35 CET 2015
//

#import "PlaceDAO.h"
#import "Place.h"
#import "MOSQLiteManager.h"
#import "PlaceRowHandler.h"
#import "MORowHandlerForNumber.h"
#import "MORowHandlerForObject.h"
#import "MORowHandlerForData.h"

@interface PlaceDAO ()

@property MOSQLiteManager *manager;

@end

@implementation PlaceDAO

+ (PlaceDAO *)daoWithDataSource:(id <MOSQLiteDataSource>)dataSource {
    return [[PlaceDAO alloc] initWithDataSource:dataSource];
}

- (id)initWithDataSource:(id <MOSQLiteDataSource>)dataSource {
    self = [super init];

    if (self) {
        self.manager = [[MOSQLiteManager alloc] initWithDataSource:dataSource];
        _TABLE_EXPRESSION = [[MOTableExpression alloc] initWithName:@"place"];
        _rowHandler = [[PlaceRowHandler alloc] init];

        _ID = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"id" type:INT];
        [self.TABLE_EXPRESSION addAsPrimaryKeyColumn:self.ID];

        _NAME = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"name" type:VARCHAR];
        [self.TABLE_EXPRESSION addColumn:self.NAME];

        _ADDRESS_ID = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"address_id" type:INT];
        [self.TABLE_EXPRESSION addColumn:self.ADDRESS_ID];

        _RATING = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"rating" type:INT];
        [self.TABLE_EXPRESSION addColumn:self.RATING];

        _ADDED = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"added" type:TIMESTAMP];
        [self.TABLE_EXPRESSION addColumn:self.ADDED];

        _COMMENT = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"comment" type:TEXT];
        [self.TABLE_EXPRESSION addColumn:self.COMMENT];

        [self.TABLE_EXPRESSION addBlobColumnWithName:@"image"];
    }
    return self;
}

- (NSArray *)select:(MOSelectQuery *)query {
    return [self.manager loadDataFromQuery:query withRowHandler:self.rowHandler];
}

- (NSArray *)select:(MOSelectQuery *)query withRowHandler:(id <MORowHandler>)rowHandler {
    return [self.manager loadDataFromQuery:query withRowHandler:rowHandler];
}

- (Place *)selectOne:(MOSelectQuery *)query {
    NSArray *result = [self select:query];

    if ([result count] == 1) {
        return result[0];
    } else if ([result count] > 1) {
        @throw [NSException exceptionWithName:@"MultipleRowsException" reason:@"Query returned more than one row" userInfo:nil];
    } else {
        return nil;
    }
}

- (Place *)getById:(NSNumber *)anId {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.ID isEqualToNumber:anId]];

    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];

    return [self selectOne:query];
}

- (Place *)getByAddress:(Address *)address {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.ADDRESS_ID isEqualToNumber:address.columnId]];
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];
    return [self selectOne:query];
}

- (Place *)getByPlaceTag:(PlaceTag *)placeTag {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.ID isEqualToNumber:placeTag.columnPlaceId]];
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];
    return [self selectOne:query];
}

- (NSArray *)getPlaceArray {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    return [self select:query];
}

- (NSArray *)getPlaceArrayOrderAscByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.orderBy = @[[MOOrderBy orderAscByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getPlaceArrayOrderDescByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.orderBy = @[[MOOrderBy orderDescByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getPlaceArrayWhere:(MOLExp *)where {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = where;
    return [self select:query];
}

- (NSArray *)getPlaceArrayWhere:(MOLExp *)where orderAscByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = where;
    query.orderBy = @[[MOOrderBy orderAscByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getPlaceArrayWhere:(MOLExp *)where orderDescByColumn:(MOAExp *)orderBy {
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

- (void)insert:(MOInsertStatement *)query {
    [self.manager executeQuery:query];
}

- (void)insertPlace:(Place *)place {
    MOInsertStatement *query = [[MOInsertStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];

    [query addColumn:self.ID withValue:place.columnId];
    [query addColumn:self.NAME withValue:place.columnName];
    [query addColumn:self.ADDRESS_ID withValue:place.columnAddressId];
    [query addColumn:self.RATING withValue:place.columnRating];
    [query addColumn:self.ADDED withValue:place.columnAdded];
    [query addColumn:self.COMMENT withValue:place.columnComment];

    NSNumber *num = [self.manager executeInsertStatement:query];
    if (num) {
        place.columnId = num;
    }
}

- (void)insertPlaceArray:(NSArray *)array {
    for (Place *place in array) {
        [self insertPlace:place];
    }
}

- (void)update:(MOUpdateStatement *)query {
    [self.manager executeQuery:query];
}

- (void)updatePlace:(Place *)place {
    MOUpdateStatement *query = [[MOUpdateStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];

    [query updateColumn:self.ID withValue:place.columnId];
    [query updateColumn:self.NAME withValue:place.columnName];
    [query updateColumn:self.ADDRESS_ID withValue:place.columnAddressId];
    [query updateColumn:self.RATING withValue:place.columnRating];
    [query updateColumn:self.ADDED withValue:place.columnAdded];
    [query updateColumn:self.COMMENT withValue:place.columnComment];

    NSMutableArray *pk = [[NSMutableArray alloc] init];
    [pk addObject:[self.ID isEqualToNumber:place.columnId]];

    query.where = [MOLExp andArray:pk];
    [self.manager executeQuery:query];
}

- (void)updatePlaceArray:(NSArray *)array {
    for (Place *place in array) {
        [self updatePlace:place];
    }
}

- (void)delete:(MODeleteStatement *)query {
    [self.manager executeQuery:query];
}

- (void)deletePlace:(Place *)place {
    MODeleteStatement *query = [[MODeleteStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];

    NSMutableArray *pk = [[NSMutableArray alloc] init];
    [pk addObject:[self.ID isEqualToNumber:place.columnId]];

    query.where = [MOLExp andArray:pk];
    [self.manager executeQuery:query];
}

- (void)deletePlaceArray:(NSArray *)array {
    for (Place *place in array) {
        [self deletePlace:place];
    }
}

- (void)deleteById:(NSNumber *)anId {
    NSMutableArray *pk = [[NSMutableArray alloc] init];
    [pk addObject:[self.ID isEqualToNumber:anId]];

    MODeleteStatement *query = [[MODeleteStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:pk];

    [self.manager executeQuery:query];
}

- (void)deleteWhere:(MOLExp *)where {
    MODeleteStatement *query = [[MODeleteStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];
    query.where = where;
    [self.manager executeQuery:query];
}

- (BOOL)isEqualByPK:(Place *)place1 and:(Place *)place2 {
    BOOL result = YES;
    result = result && ((!place1.columnId && !place2.columnId) || [place1.columnId isEqualToNumber:place2.columnId]);

    return result;
}

- (NSData *)getImageForPlace:(Place *)place {
    return [self getImageById:place.columnId];
}

- (NSData *)getImageById:(NSNumber *)anId {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.ID isEqualToNumber:anId]];

    MOSelectQuery *query = [MOSelectQuery selectColumn:[MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"image" type:BYTEA] fromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];
    return [self select:query withRowHandler:[[MORowHandlerForData alloc] init]][0];
}

- (void)setImage:(NSData *)blob forPlace:(Place *)place {
    [self setImage:blob byId:place.columnId];
}

- (void)setImage:(NSData *)blob byId:(NSNumber *)anId {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.ID isEqualToNumber:anId]];

    MOUpdateStatement *query = [[MOUpdateStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];

    [query updateColumn:[MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"image" type:BYTEA] withValue:blob];
    [self update:query];
}

@end

