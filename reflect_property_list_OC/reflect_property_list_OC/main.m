//
//  main.m
//  reflect_property_list_OC
//
//  Created by 邬一平 on 17/1/9.
//  Copyright © 2017年 wyp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import <objc/objc-runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Product *product = [Product new];
        Class clazz = product.class;
        
        unsigned int count = 0;
        objc_property_t *properties = class_copyPropertyList(clazz, &count);
        for (int i=0; i<count; i++) {
            objc_property_t property = properties[i];
            
            NSLog(@"Property %s\t\t\t%s", property_getName(property), property_getAttributes(property));
        }
        Ivar *ivers = class_copyIvarList(clazz, &count);
        for (int i=0; i<count; i++) {
            Ivar iver = ivers[i];
            NSLog(@"Ivar %s \t %s", ivar_getName(iver), ivar_getTypeEncoding(iver));
        }
        
        Ivar iver = class_getInstanceVariable(clazz, "_build");
        
        int *iver_pointer = (int *)((__bridge void *)product + ivar_getOffset(iver));
        *iver_pointer = 250;
        
        [product buildInfo];
    }
    return 0;
}
