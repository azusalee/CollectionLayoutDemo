//
//  main.m
//  CardCollect
//
//  Created by yangming on 2019/5/24.
//  Copyright © 2019 AL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#if CODECOVERAGE
#import <Coverage/GCDAProfiling.h>
#endif

int main(int argc, char * argv[]) {
    @autoreleasepool {
#if CODECOVERAGE
        CODE_CCOVER_START
#endif

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
