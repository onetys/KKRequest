//
//  NSString+SandBoxPath.h
//  KKKit
//
//  Created by MR.KING on 16/7/8.
//  Copyright © 2016年 KING. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (URL)

@property(nonatomic,readonly)NSURL * kk_URL;

@property(nonatomic,readonly)NSURL * kk_fileURL;

@end


@interface NSString (SandBoxPath)

#pragma mark - OC
/// /Library/Caches
+(nullable NSString*)kk_cachesDirectory;

/// Documents
+(nullable NSString *)kk_DocDirectory;

/// /Library/Prefrence
+(nullable NSString *)kkPrefrenceDirectory;

/// tmp directory
+(nullable NSString *)kk_temporaryDirectory;


-(BOOL)kk_fileIsReadable;

-(BOOL)kk_fileIsWritable;

-(BOOL)kk_fileIsExecutable;

-(BOOL)kk_fileIsExist;

-(void)kk_fileIsExistAndDirectory:(void(^)(BOOL exist, BOOL directory))T;

-(NSString *)kk_docPath;

-(NSString *)kk_cachesPath;



-(void)kk_fileAtts:(void(^)(NSDictionary * att, NSError * error))T;

-(NSDate*)kk_fileCreateData;

-(BOOL)kk_fileExpiredWithTimeInterval:(NSTimeInterval)seconds;



#pragma mark - C

/// file manager
FOUNDATION_EXTERN_INLINE NSFileManager * KKFileManager(void);

/// /Library/Caches
FOUNDATION_EXTERN_INLINE NSString * KKCachesDirectory(void);

/// Documents
FOUNDATION_EXTERN_INLINE NSString * KKDocDirectory(void);

/// /Library/Prefrence
FOUNDATION_EXTERN_INLINE NSString * KKPrefrenceDirecory(void);

/// tmp directory
FOUNDATION_EXTERN_INLINE NSString * KKTemporaryDirectory(void);

/* The following methods are of limited utility. Attempting to predicate behavior based on the current state of the filesystem or a particular file on the filesystem is encouraging odd behavior in the face of filesystem race conditions. It's far better to attempt an operation (like loading a file or creating a directory) and handle the error gracefully than it is to try to figure out ahead of time whether the operation will succeed.
 */
/// whether the file at path is readable
FOUNDATION_EXTERN_INLINE BOOL KKFileIsReadable(NSString * path);

/// whether the file at path is writable
FOUNDATION_EXTERN_INLINE BOOL KKFileIsWritable(NSString * path);

/// whether the file at path is readabel
FOUNDATION_EXTERN_INLINE BOOL KKFileIsExecutable(NSString * path);

/// whether path is exist
FOUNDATION_EXTERN_INLINE BOOL KKFileExist(NSString * path);

/// whether path is exist and is a directory
FOUNDATION_EXTERN_INLINE void KKFileExistAndDirectory(NSString * path, void(^T)(BOOL exist, BOOL isDirectory));

/**
 *  combine path
 */
/// Documents/component
FOUNDATION_EXTERN_INLINE NSString * KKDocFullPath(NSString * component);

/// /Library/Caches/component
FOUNDATION_EXTERN_INLINE NSString * KKCacheFullPath(NSString * component);

/// attributes of special path
FOUNDATION_EXTERN_INLINE void KKFileAtts(NSString * path, void(^T)(NSDictionary * att, NSError * error));

/// time of special file's create date
FOUNDATION_EXTERN_INLINE NSDate * KKFileCreateData(NSString * path);

/// whether file is time out of date
FOUNDATION_EXTERN_INLINE BOOL KKFileExpired(NSString * path, NSTimeInterval seconds);

@end
