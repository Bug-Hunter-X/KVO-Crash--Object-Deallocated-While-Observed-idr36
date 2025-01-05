In the observer's dealloc method, ensure to remove the observation:

```objectivec
@interface MyObserver : NSObject
@property (nonatomic, strong) NSObject *observedObject;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;
@end

@implementation MyObserver
- (void)dealloc {
    [self.observedObject removeObserver:self forKeyPath:@"someProperty"];
    // ... other dealloc operations
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // ... handle KVO change
}
@end

//In the observed object's dealloc method
//Always removeObserver to prevent crash
- (void)dealloc {
[self removeObserver:observer forKeyPath:@