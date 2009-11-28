//
//  PSTitleValueSpecifierCell.m
//  InAppSettingsTestApp
//
//  Created by David Keegan on 11/21/09.
//  Copyright 2009 InScopeApps{+}. All rights reserved.
//

#import "PSTitleValueSpecifierCell.h"

@implementation PSTitleValueSpecifierCell

- (NSString *)getValueTitle{
    NSArray *titles = [self.setting valueForKey:@"Titles"];
    NSArray *values = [self.setting valueForKey:@"Values"];
    if(titles || values){
        if(([titles count] == 0) || ([values count] == 0) || ([titles count] != [values count])){
            return nil;
        }
        NSInteger valueIndex = [values indexOfObject:[self getValue]];
        if((valueIndex >= 0) && (valueIndex < (NSInteger)[titles count])){
            return [titles objectAtIndex:valueIndex];
        }
        
        return nil;
    }
    
    return [self getValue];
}

- (void)setValue{
    [super setValue];
    
    [self setDetail:[self getValueTitle]];
}

- (void)setupCell{
    [super setupCell];
    
    [self setTitle];
}

@end