@_expose(wasm, "bjs_asyncThrowsVoid")
@_cdecl("bjs_asyncThrowsVoid")
public func _bjs_asyncThrowsVoid() -> Int32 {
    #if arch(wasm32)
    let __bjs_capture = 0
    return _bjs_makePromise(resolve: Promise_resolve_y, reject: Promise_reject) { [__bjs_capture] () async throws(JSException) -> Void in
        _ = __bjs_capture
        try await asyncThrowsVoid()
    }
    #else
    fatalError("Only available on WebAssembly")
    #endif
}

@_expose(wasm, "bjs_asyncThrowsWithResult")
@_cdecl("bjs_asyncThrowsWithResult")
public func _bjs_asyncThrowsWithResult() -> Int32 {
    #if arch(wasm32)
    let __bjs_capture = 0
    return _bjs_makePromise(resolve: Promise_resolve_Si, reject: Promise_reject) { [__bjs_capture] () async throws(JSException) -> Int in
        _ = __bjs_capture
        return try await asyncThrowsWithResult()
    }
    #else
    fatalError("Only available on WebAssembly")
    #endif
}

@JSFunction func Promise_reject(_ promise: JSObject, _ value: JSValue) throws(JSException)

#if arch(wasm32)
@_extern(wasm, module: "bjs", name: "promise_reject_TestModule")
fileprivate func promise_reject_TestModule_extern(_ promise: Int32, _ valueKind: Int32, _ valuePayload1: Int32, _ valuePayload2: Float64) -> Void
#else
fileprivate func promise_reject_TestModule_extern(_ promise: Int32, _ valueKind: Int32, _ valuePayload1: Int32, _ valuePayload2: Float64) -> Void {
    fatalError("Only available on WebAssembly")
}
#endif
@inline(never) fileprivate func promise_reject_TestModule(_ promise: Int32, _ valueKind: Int32, _ valuePayload1: Int32, _ valuePayload2: Float64) -> Void {
    return promise_reject_TestModule_extern(promise, valueKind, valuePayload1, valuePayload2)
}

func _$Promise_reject(_ promise: JSObject, _ value: JSValue) throws(JSException) -> Void {
    let promiseValue = promise.bridgeJSLowerParameter()
    let (valueKind, valuePayload1, valuePayload2) = value.bridgeJSLowerParameter()
    promise_reject_TestModule(promiseValue, valueKind, valuePayload1, valuePayload2)
    if let error = _swift_js_take_exception() { throw error }
}

@JSFunction func Promise_resolve_y(_ promise: JSObject) throws(JSException)

#if arch(wasm32)
@_extern(wasm, module: "bjs", name: "promise_resolve_TestModule_y")
fileprivate func promise_resolve_TestModule_y_extern(_ promise: Int32) -> Void
#else
fileprivate func promise_resolve_TestModule_y_extern(_ promise: Int32) -> Void {
    fatalError("Only available on WebAssembly")
}
#endif
@inline(never) fileprivate func promise_resolve_TestModule_y(_ promise: Int32) -> Void {
    return promise_resolve_TestModule_y_extern(promise)
}

func _$Promise_resolve_y(_ promise: JSObject) throws(JSException) -> Void {
    let promiseValue = promise.bridgeJSLowerParameter()
    promise_resolve_TestModule_y(promiseValue)
    if let error = _swift_js_take_exception() { throw error }
}

@JSFunction func Promise_resolve_Si(_ promise: JSObject, _ value: Int) throws(JSException)

#if arch(wasm32)
@_extern(wasm, module: "bjs", name: "promise_resolve_TestModule_Si")
fileprivate func promise_resolve_TestModule_Si_extern(_ promise: Int32, _ value: Int32) -> Void
#else
fileprivate func promise_resolve_TestModule_Si_extern(_ promise: Int32, _ value: Int32) -> Void {
    fatalError("Only available on WebAssembly")
}
#endif
@inline(never) fileprivate func promise_resolve_TestModule_Si(_ promise: Int32, _ value: Int32) -> Void {
    return promise_resolve_TestModule_Si_extern(promise, value)
}

func _$Promise_resolve_Si(_ promise: JSObject, _ value: Int) throws(JSException) -> Void {
    let promiseValue = promise.bridgeJSLowerParameter()
    let valueValue = value.bridgeJSLowerParameter()
    promise_resolve_TestModule_Si(promiseValue, valueValue)
    if let error = _swift_js_take_exception() { throw error }
}