//
// PlaceTagDAO.m
//
// DAO for Table place_tag.
//
// Generated by Mobi-ORM on Mon Nov 02 16:21:35 CET 2015
//

#import "PlaceTagDAO.h"
#import "PlaceTag.h"
#import "MOSQLiteManager.h"
#import "PlaceTagRowHandler.h"
#import "MORowHandlerForNumber.h"
#import "MORowHandlerForObject.h"
#import "MORowHandlerForData.h"

@interface PlaceTagDAO ()

@property MOSQLiteManager *manager;

@end

@implementation PlaceTagDAO

+ (PlaceTagDAO *)daoWithDataSource:(id <MOSQLiteDataSource>)dataSource {
    return [[PlaceTagDAO alloc] initWithDataSource:dataSource];
}

- (id)initWithDataSource:(id <MOSQLiteDataSource>)dataSource {
    self = [super init];

    if (self) {
        self.manager = [[MOSQLiteManager alloc] initWithDataSource:dataSource];
        _TABLE_EXPRESSION = [[MOTableExpression alloc] initWithName:@"place_tag"];
        _rowHandler = [[PlaceTagRowHandler alloc] init];

        _PLACE_ID = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"place_id" type:INT];
        [self.TABLE_EXPRESSION addAsPrimaryKeyColumn:self.PLACE_ID];

        _TAG_NAME = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"tag_name" type:VARCHAR];
        [self.TABLE_EXPRESSION addAsPrimaryKeyColumn:self.TAG_NAME];

    }
    return self;
}

- (NSArray *)select:(MOSelectQuery *)query {
    return [self.manager loadDataFromQuery:query withRowHandler:self.rowHandler];
}

- (NSArray *)select:(MOSelectQuery *)query withRowHandler:(id <MORowHandler>)rowHandler {
    return [self.manager loadDataFromQuery:query withRowHandler:rowHandler];
}

- (PlaceTag *)selectOne:(MOSelectQuery *)query {
    NSArray *result = [self select:query];

    if ([result count] == 1) {
        return result[0];
    } else if ([result count] > 1) {
        @throw [NSException exceptionWithName:@"MultipleRowsException" reason:@"Query returned more than one row" userInfo:nil];
    } else {
        return nil;
    }
}

- (PlaceTag *)getByPlaceId:(NSNumber *)aPlaceId tagName:(NSString *)aTagName {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.PLACE_ID isEqualToNumber:aPlaceId]];
    [conditions addObject:[self.TAG_NAME isEqualToString:aTagName]];

    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];

    return [self selectOne:query];
}

- (NSArray *)getByPlace:(Place *)place {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.PLACE_ID isEqualToNumber:place.columnId]];
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];
    return [self select:query];
}

- (NSArray *)getByPlace:(Place *)place orderAscendingBy:(MOAExp *)orderBy {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.PLACE_ID isEqualToNumber:place.columnId]];
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];
    query.orderBy = @[[MOOrderBy orderAscByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getByPlace:(Place *)place orderDescendingBy:(MOAExp *)orderBy {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.PLACE_ID isEqualToNumber:place.columnId]];
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];
    query.orderBy = @[[MOOrderBy orderDescByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getByTag:(Tag *)tag {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.TAG_NAME isEqualToString:tag.columnName]];
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];
    return [self select:query];
}

- (NSArray *)getByTag:(Tag *)tag orderAscendingBy:(MOAExp *)orderBy {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.TAG_NAME isEqualToString:tag.columnName]];
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];
    query.orderBy = @[[MOOrderBy orderAscByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getByTag:(Tag *)tag orderDescendingBy:(MOAExp *)orderBy {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.TAG_NAME isEqualToString:tag.columnName]];
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];
    query.orderBy = @[[MOOrderBy orderDescByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getPlaceTagArray {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    return [self select:query];
}

- (NSArray *)getPlaceTagArrayOrderAscByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.orderBy = @[[MOOrderBy orderAscByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getPlaceTagArrayOrderDescByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.orderBy = @[[MOOrderBy orderDescByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getPlaceTagArrayWhere:(MOLExp *)where {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = where;
    return [self select:query];
}

- (NSArray *)getPlaceTagArrayWhere:(MOLExp *)where orderAscByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = where;
    query.orderBy = @[[MOOrderBy orderAscByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getPlaceTagArrayWhere:(MOLExp *)where orderDescByColumn:(MOAExp *)orderBy {
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

- (void)insertPlaceTag:(PlaceTag *)placeTag {
    MOInsertStatement *query = [[MOInsertStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];

    [query addColumn:self.PLACE_ID withValue:placeTag.columnPlaceId];
    [query addColumn:self.TAG_NAME withValue:placeTag.columnTagName];

    [self.manager executeInsertStatement:query];
}

- (void)insertPlaceTagArray:(NSArray *)array {
    for (PlaceTag *placeTag in array) {
        [self insertPlaceTag:placeTag];
    }
}

- (void)update:(MOUpdateStatement *)query {
    [self.manager executeQuery:query];
}

- (void)updatePlaceTag:(PlaceTag *)placeTag {
    MOUpdateStatement *query = [[MOUpdateStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];

    [query updateColumn:self.PLACE_ID withValue:placeTag.columnPlaceId];
    [query updateColumn:self.TAG_NAME withValue:placeTag.columnTagName];

    NSMutableArray *pk = [[NSMutableArray alloc] init];
    [pk addObject:[self.PLACE_ID isEqualToNumber:placeTag.columnPlaceId]];
    [pk addObject:[self.TAG_NAME isEqualToString:placeTag.columnTagName]];

    query.where = [MOLExp andArray:pk];
    [self.manager executeQuery:query];
}

- (void)updatePlaceTagArray:(NSArray *)array {
    for (PlaceTag *placeTag in array) {
        [self updatePlaceTag:placeTag];
    }
}

- (void)delete:(MODeleteStatement *)query {
    [self.manager executeQuery:query];
}

- (void)deletePlaceTag:(PlaceTag *)placeTag {
    MODeleteStatement *query = [[MODeleteStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];

    NSMutableArray *pk = [[NSMutableArray alloc] init];
    [pk addObject:[self.PLACE_ID isEqualToNumber:placeTag.columnPlaceId]];
    [pk addObject:[self.TAG_NAME isEqualToString:placeTag.columnTagName]];

    query.where = [MOLExp andArray:pk];
    [self.manager executeQuery:query];
}

- (void)deletePlaceTagArray:(NSArray *)array {
    for (PlaceTag *placeTag in array) {
        [self deletePlaceTag:placeTag];
    }
}

- (void)deleteByPlaceId:(NSNumber *)aPlaceId tagName:(NSString *)aTagName {
    NSMutableArray *pk = [[NSMutableArray alloc] init];
    [pk addObject:[self.PLACE_ID isEqualToNumber:aPlaceId]];
    [pk addObject:[self.TAG_NAME isEqualToString:aTagName]];

    MODeleteStatement *query = [[MODeleteStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:pk];

    [self.manager executeQuery:query];
}

- (void)deleteWhere:(MOLExp *)where {
    MODeleteStatement *query = [[MODeleteStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];
    query.where = where;
    [self.manager executeQuery:query];
}

- (BOOL)isEqualByPK:(PlaceTag *)placeTag1 and:(PlaceTag *)placeTag2 {
    BOOL result = YES;
    result = result && ((!placeTag1.columnPlaceId && !placeTag2.columnPlaceId) || [placeTag1.columnPlaceId isEqualToNumber:placeTag2.columnPlaceId]);
    result = result && ((!placeTag1.columnTagName && !placeTag2.columnTagName) || [placeTag1.columnTagName isEqualToString:placeTag2.columnTagName]);

    return result;
}

@end

