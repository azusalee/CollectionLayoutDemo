//
//  main.m
//  CardCollect
//
//  Created by yangming on 2019/5/24.
//  Copyright © 2019 AL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//#if CODECOVERAGE
//#import <Coverage/GCDAProfiling.h>
//#endif

int main(int argc, char * argv[]) {
    @autoreleasepool {
#if CODECOVERAGE
        //CODE_CCOVER_START
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"gcda_files"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:documentsDirectory]) [fileManager removeItemAtPath:documentsDirectory error:nil];
        NSLog(@"%@", documentsDirectory);
        setenv("GCOV_PREFIX", [documentsDirectory cStringUsingEncoding:NSUTF8StringEncoding], 1);
        setenv("GCOV_PREFIX_STRIP", "14", 1);
        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
        dispatch_source_set_event_handler(timer, ^{
            extern void __gcov_flush(void);
            __gcov_flush();
        });
        dispatch_resume(timer);
#endif

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
