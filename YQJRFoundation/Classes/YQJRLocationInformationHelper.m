//
//  YQJRLocationInformationHelper.m
//  Pods-YQJRFoundation_Example
//
//  Created by wangzhen on 2019/9/19.
//

#import "YQJRLocationInformationHelper.h"

@interface YQJRLocationInformationHelper () <CLLocationManagerDelegate>

@property(nonatomic, strong)CLLocationManager *locationmanager;
@property(nonatomic, strong)CLLocation *location;

@end

@implementation YQJRLocationInformationHelper

#pragma mark - Public Method

+ (instancetype)sharedManager {
    static YQJRLocationInformationHelper *helper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[YQJRLocationInformationHelper alloc] init];
        [helper startLocation];
    });
    return helper;
}

- (CLLocation *)getLocation {
    return self.location;
}

#pragma mark - Private Method

- (void)startLocation {
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationmanager = [[CLLocationManager alloc] init];
        self.locationmanager.delegate = self;
        [self.locationmanager requestAlwaysAuthorization];
        [self.locationmanager startUpdatingLocation];
        
        self.location = self.locationmanager.location;
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.location = [locations lastObject];
}

@end
