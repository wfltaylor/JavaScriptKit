@JS func asyncThrowsVoid() async throws(JSException) {
    throw JSException(message: "TestError")
}

@JS func asyncThrowsWithResult() async throws(JSException) -> Int {
    return 1
}

struct AsyncCustomError: ConvertibleToJSException {
    var jsException: JSException { JSException(message: "AsyncCustomError") }
}

@JS func asyncThrowsCustomError() async throws(AsyncCustomError) {
    throw AsyncCustomError()
}

@JS func asyncThrowsCustomErrorWithResult(value: Int) async throws(AsyncCustomError) -> Int {
    return value
}
