//
// TagDAO.m
//
// DAO for Table tag.
//
// Generated by Mobi-ORM on Mon Nov 02 16:21:35 CET 2015
//

#import "TagDAO.h"
#import "Tag.h"
#import "MOSQLiteManager.h"
#import "TagRowHandler.h"
#import "MORowHandlerForNumber.h"
#import "MORowHandlerForObject.h"
#import "MORowHandlerForData.h"

@interface TagDAO ()

@property MOSQLiteManager *manager;

@end

@implementation TagDAO

+ (TagDAO *)daoWithDataSource:(id <MOSQLiteDataSource>)dataSource {
    return [[TagDAO alloc] initWithDataSource:dataSource];
}

- (id)initWithDataSource:(id <MOSQLiteDataSource>)dataSource {
    self = [super init];

    if (self) {
        self.manager = [[MOSQLiteManager alloc] initWithDataSource:dataSource];
        _TABLE_EXPRESSION = [[MOTableExpression alloc] initWithName:@"tag"];
        _rowHandler = [[TagRowHandler alloc] init];

        _NAME = [MOColumn columnWithOwner:self.TABLE_EXPRESSION name:@"name" type:VARCHAR];
        [self.TABLE_EXPRESSION addAsPrimaryKeyColumn:self.NAME];

    }
    return self;
}

- (NSArray *)select:(MOSelectQuery *)query {
    return [self.manager loadDataFromQuery:query withRowHandler:self.rowHandler];
}

- (NSArray *)select:(MOSelectQuery *)query withRowHandler:(id <MORowHandler>)rowHandler {
    return [self.manager loadDataFromQuery:query withRowHandler:rowHandler];
}

- (Tag *)selectOne:(MOSelectQuery *)query {
    NSArray *result = [self select:query];

    if ([result count] == 1) {
        return result[0];
    } else if ([result count] > 1) {
        @throw [NSException exceptionWithName:@"MultipleRowsException" reason:@"Query returned more than one row" userInfo:nil];
    } else {
        return nil;
    }
}

- (Tag *)getByName:(NSString *)aName {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.NAME isEqualToString:aName]];

    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];

    return [self selectOne:query];
}

- (Tag *)getByPlaceTag:(PlaceTag *)placeTag {
    NSMutableArray *conditions = [[NSMutableArray alloc] init];
    [conditions addObject:[self.NAME isEqualToString:placeTag.columnTagName]];
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:conditions];
    return [self selectOne:query];
}

- (NSArray *)getTagArray {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    return [self select:query];
}

- (NSArray *)getTagArrayOrderAscByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.orderBy = @[[MOOrderBy orderAscByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getTagArrayOrderDescByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.orderBy = @[[MOOrderBy orderDescByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getTagArrayWhere:(MOLExp *)where {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = where;
    return [self select:query];
}

- (NSArray *)getTagArrayWhere:(MOLExp *)where orderAscByColumn:(MOAExp *)orderBy {
    MOSelectQuery *query = [MOSelectQuery selectFromTable:self.TABLE_EXPRESSION];
    query.where = where;
    query.orderBy = @[[MOOrderBy orderAscByColumn:orderBy]];
    return [self select:query];
}

- (NSArray *)getTagArrayWhere:(MOLExp *)where orderDescByColumn:(MOAExp *)orderBy {
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

- (void)insertTag:(Tag *)tag {
    MOInsertStatement *query = [[MOInsertStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];

    [query addColumn:self.NAME withValue:tag.columnName];

    [self.manager executeInsertStatement:query];
}

- (void)insertTagArray:(NSArray *)array {
    for (Tag *tag in array) {
        [self insertTag:tag];
    }
}

- (void)update:(MOUpdateStatement *)query {
    [self.manager executeQuery:query];
}

- (void)updateTag:(Tag *)tag {
    MOUpdateStatement *query = [[MOUpdateStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];

    [query updateColumn:self.NAME withValue:tag.columnName];

    NSMutableArray *pk = [[NSMutableArray alloc] init];
    [pk addObject:[self.NAME isEqualToString:tag.columnName]];

    query.where = [MOLExp andArray:pk];
    [self.manager executeQuery:query];
}

- (void)updateTagArray:(NSArray *)array {
    for (Tag *tag in array) {
        [self updateTag:tag];
    }
}

- (void)delete:(MODeleteStatement *)query {
    [self.manager executeQuery:query];
}

- (void)deleteTag:(Tag *)tag {
    MODeleteStatement *query = [[MODeleteStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];

    NSMutableArray *pk = [[NSMutableArray alloc] init];
    [pk addObject:[self.NAME isEqualToString:tag.columnName]];

    query.where = [MOLExp andArray:pk];
    [self.manager executeQuery:query];
}

- (void)deleteTagArray:(NSArray *)array {
    for (Tag *tag in array) {
        [self deleteTag:tag];
    }
}

- (void)deleteByName:(NSString *)aName {
    NSMutableArray *pk = [[NSMutableArray alloc] init];
    [pk addObject:[self.NAME isEqualToString:aName]];

    MODeleteStatement *query = [[MODeleteStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];
    query.where = [MOLExp andArray:pk];

    [self.manager executeQuery:query];
}

- (void)deleteWhere:(MOLExp *)where {
    MODeleteStatement *query = [[MODeleteStatement alloc] initWithTableExpression:self.TABLE_EXPRESSION];
    query.where = where;
    [self.manager executeQuery:query];
}

- (BOOL)isEqualByPK:(Tag *)tag1 and:(Tag *)tag2 {
    BOOL result = YES;
    result = result && ((!tag1.columnName && !tag2.columnName) || [tag1.columnName isEqualToString:tag2.columnName]);

    return result;
}

@end

