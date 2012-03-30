//
//  WebView+Utilites.m
//
//  Created by Sergey Lenkov on 28.10.10.
//  Copyright 2010 Positive Team. All rights reserved.
//

#import "WebView+Utilites.h"

@implementation WebView (Utilites)

- (NSImage *)snapshot {
    WebFrame *frame = self.mainFrame;
    WebFrameView *view = frame.frameView;
    NSRect imageRect = view.documentView.frame;
    
    imageRect.origin.x = 0;
    imageRect.origin.y = 0;
    
    NSBitmapImageRep *imageRep = [view.documentView bitmapImageRepForCachingDisplayInRect:view.documentView.frame];
    [view.documentView cacheDisplayInRect:imageRect toBitmapImageRep:imageRep];
    
    NSImage *image = [[[NSImage alloc] initWithSize:imageRect.size] autorelease];
    
    [image addRepresentation:imageRep];
    
    return image;
}

@end
