//
//  Product.h
//  reflect_property_list_OC
//
//  Created by 邬一平 on 17/1/9.
//  Copyright © 2017年 wyp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject {
    int _build;
}

@property(nonatomic, assign)int count;
@property(nonatomic, strong)NSDate *date;
@property(nonatomic, assign)double price;
@property(nonatomic, copy)NSString *introduce;
@property(nonatomic, assign)BOOL isSale;

@property(nonatomic, readonly)NSArray *pictureArr;
@property(nonatomic, strong)NSDictionary *versionDic;

- (void)buildInfo;

@end
