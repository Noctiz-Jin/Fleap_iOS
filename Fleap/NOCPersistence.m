//
//  NOCPersistence.m
//  Fleap
//
//  Created by Yuning Jin on 3/25/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCPersistence.h"

@implementation NOCPersistence

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _myBool = [aDecoder decodeBoolForKey:@"myBool"];
        _myString = [aDecoder decodeObjectForKey:@"myString"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeBool:_myBool forKey:@"myBool"];
    [aCoder encodeObject:_myString forKey:@"myString"];
}

- (void)testArchiving
{
    NOCPersistence *noc = [[NOCPersistence alloc] init];
    noc.myString = @"Snarl";
    noc.myBool = YES;
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directoryPath = [NSString stringWithFormat:@"%@/noctizArchive", path[0]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:directoryPath] == NO)
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *filePath = [NSString stringWithFormat:@"%@/noc",directoryPath];
    BOOL success = [NSKeyedArchiver archiveRootObject:noc toFile:filePath];
    NOCPersistence *newNoc = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSString *STR = newNoc.myBool ? @"YES" : @"NO";
    NSLog(@"Recovered from NSFileManager: %@ and %@", STR, newNoc.myString);
    
    
    // NSData version
    NSData *dataNoc = [NSKeyedArchiver archivedDataWithRootObject:noc];
    NSString *dataPath = [NSString stringWithFormat:@"%@/dataNoc", directoryPath];
    [dataNoc writeToFile:dataPath atomically:YES];
    NSData *recoverData = [NSData dataWithContentsOfFile:dataPath];
    NOCPersistence *newDataNoc = [NSKeyedUnarchiver unarchiveObjectWithData:recoverData];
    NSString *dataSTR = newDataNoc.myBool ? @"YES" : @"NO";
    NSLog(@"Recovered from NSData: %@ and %@", dataSTR, newDataNoc.myString);
    //
}

@end
