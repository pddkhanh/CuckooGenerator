import Cuckoo

import Foundation

class MockEmptyClass: EmptyClass, Cuckoo.Mock {
    typealias Stubbing = __StubbingProxy_EmptyClass
    typealias Verification = __VerificationProxy_EmptyClass
    let manager = Cuckoo.MockManager()
    
    private var observed: EmptyClass?
    
    required override init() {
    }
    
    required init(spyOn victim: EmptyClass) {
        observed = victim
    }
    
    struct __StubbingProxy_EmptyClass: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
    }
    
    struct __VerificationProxy_EmptyClass: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    }
}
