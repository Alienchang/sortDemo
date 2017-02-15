//
//  ViewController.m
//  SortDemo
//
//  Created by Alienchang on 2017/2/15.
//  Copyright © 2017年 Alienchang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self quickSort];
//    [self bubleSort];
//    [self selectionSort];
    [self insertSort];
}

//****************************************快速排序****************************************
- (void)quickSort{
    NSLog(@"quicksort start");
    NSMutableArray *originArray = [@[] mutableCopy];
    for (NSInteger i = 0; i < 10; ++i) {
        [originArray addObject:@(arc4random() % 20)];
    }
    NSLog(@"originArray == %@",originArray);
    [self quicksortStackWithArray:originArray leftIndex:0 rightIndex:originArray.count - 1];
    NSLog(@"sortedArray == %@",originArray);
}

- (void)quicksortStackWithArray:(NSMutableArray *)array leftIndex:(NSInteger)left rightIndex:(NSInteger)right{
    
    if (left >= right) {
        return;
    }
    
    NSInteger key = [(NSNumber *)array[left] integerValue];
    NSInteger i = left;
    NSInteger j = right;
    
    while (i < j) {
        while (i < j && key <= [(NSNumber *)array[j] integerValue]) {
            j --;
        }
        
        array[i] = array[j];
        array[j] = @(key);
        
        while (i < j && key >= [(NSNumber *)array[i] integerValue]) {
            i ++;
        }
        array[j] = array[i];
        array[i] = @(key);
    }
    
    [self quicksortStackWithArray:array leftIndex:left rightIndex:i - 1];
    [self quicksortStackWithArray:array leftIndex:i + 1 rightIndex:right];
}
//****************************************快速排序 end****************************************

//****************************************堆排序****************************************
- (void)heapSort{
    NSLog(@"heapsort start");
    NSMutableArray *originArray = [@[] mutableCopy];
    for (NSInteger i = 0; i < 10; ++i) {
        [originArray addObject:@(arc4random() % 20)];
    }
    NSLog(@"originArray == %@",originArray);
    [self quicksortStackWithArray:originArray leftIndex:0 rightIndex:originArray.count - 1];
    NSLog(@"sortedArray == %@",originArray);
}

//****************************************堆排序 end****************************************


//****************************************冒泡排序****************************************
- (void)bubleSort{
    NSLog(@"bublesort start");
    NSMutableArray *originArray = [@[] mutableCopy];
    for (NSInteger i = 0; i < 10; ++i) {
        [originArray addObject:@(arc4random() % 20)];
    }
    NSLog(@"originArray == %@",originArray);
    
    for (NSInteger i = 0; i < originArray.count; ++i) {
        for (NSInteger j = 0; j < originArray.count - i - 1; ++j) {
            NSInteger a = [(NSNumber *)originArray[j] integerValue];
            NSInteger b = [(NSNumber *)originArray[j + 1] integerValue];
            if (a > b) {
                originArray[j] = @(b);
                originArray[j + 1] = @(a);
            }
        }
    }
    
    NSLog(@"sortedArray == %@",originArray);
}
//****************************************冒泡排序 end****************************************

//****************************************选择排序****************************************
- (void)selectionSort{
    NSLog(@"selectionSort start");
    NSMutableArray *originArray = [@[] mutableCopy];
    for (NSInteger i = 0; i < 10; ++i) {
        [originArray addObject:@(arc4random() % 20)];
    }
    NSLog(@"originArray == %@",originArray);
    
    for (NSInteger i = 0; i < originArray.count; ++i) {
        NSInteger max = [(NSNumber *)originArray[i] integerValue];
        for (NSInteger j = i + 1; j < originArray.count; ++j) {
            NSInteger b = [(NSNumber *)originArray[j] integerValue];
            if (max < b) {
                originArray[i] = @(b);
                originArray[j] = @(max);
                max = b;
            }
        }
    }
    
    NSLog(@"sortedArray == %@",originArray);
}
//****************************************选择排序 end****************************************

//****************************************插入排序****************************************
- (void)insertSort{
    NSLog(@"insertSort start");
    NSMutableArray *originArray = [@[] mutableCopy];
    for (NSInteger i = 0; i < 10; ++i) {
        [originArray addObject:@(arc4random() % 20)];
    }
    NSLog(@"originArray == %@",originArray);
    
    for (NSInteger i = 1; i < originArray.count; ++i) {
        NSInteger temp = [(NSNumber *)originArray[i] integerValue];
        NSInteger j = i - 1;
        while (j >= 0 && [(NSNumber *)originArray[j] integerValue] > temp) {
            originArray[j + 1] = originArray[j];
            j --;
        }
        if (j != i - 1) {
            originArray[j + 1] = @(temp);
        }
    }
    NSLog(@"sortedArray == %@",originArray);
}
//****************************************插入排序 end****************************************
@end
