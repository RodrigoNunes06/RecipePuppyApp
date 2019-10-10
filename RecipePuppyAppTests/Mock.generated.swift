// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 3.3.4

import SwiftyMocky
#if !MockyCustom
import XCTest
#endif
import Foundation
@testable import RecipePuppyApp


// MARK: - NetworkEndPoint
open class NetworkEndPointMock: NetworkEndPoint, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    public var baseURL: URL {
		get {	invocations.append(.p_baseURL_get); return __p_baseURL ?? givenGetterValue(.p_baseURL_get, "NetworkEndPointMock - stub value for baseURL was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_baseURL = newValue }
	}
	private var __p_baseURL: (URL)?

    public var path: String {
		get {	invocations.append(.p_path_get); return __p_path ?? givenGetterValue(.p_path_get, "NetworkEndPointMock - stub value for path was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_path = newValue }
	}
	private var __p_path: (String)?

    public var httpMethod: HTTPMethod {
		get {	invocations.append(.p_httpMethod_get); return __p_httpMethod ?? givenGetterValue(.p_httpMethod_get, "NetworkEndPointMock - stub value for httpMethod was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_httpMethod = newValue }
	}
	private var __p_httpMethod: (HTTPMethod)?

    public var task: HTTPTask {
		get {	invocations.append(.p_task_get); return __p_task ?? givenGetterValue(.p_task_get, "NetworkEndPointMock - stub value for task was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_task = newValue }
	}
	private var __p_task: (HTTPTask)?

    public var headers: HTTPHeaders? {
		get {	invocations.append(.p_headers_get); return __p_headers ?? optionalGivenGetterValue(.p_headers_get, "NetworkEndPointMock - stub value for headers was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_headers = newValue }
	}
	private var __p_headers: (HTTPHeaders)?






    fileprivate enum MethodType {
        case p_baseURL_get
        case p_path_get
        case p_httpMethod_get
        case p_task_get
        case p_headers_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_baseURL_get,.p_baseURL_get): return true
            case (.p_path_get,.p_path_get): return true
            case (.p_httpMethod_get,.p_httpMethod_get): return true
            case (.p_task_get,.p_task_get): return true
            case (.p_headers_get,.p_headers_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_baseURL_get: return 0
            case .p_path_get: return 0
            case .p_httpMethod_get: return 0
            case .p_task_get: return 0
            case .p_headers_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func baseURL(getter defaultValue: URL...) -> PropertyStub {
            return Given(method: .p_baseURL_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func path(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_path_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func httpMethod(getter defaultValue: HTTPMethod...) -> PropertyStub {
            return Given(method: .p_httpMethod_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func task(getter defaultValue: HTTPTask...) -> PropertyStub {
            return Given(method: .p_task_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func headers(getter defaultValue: HTTPHeaders?...) -> PropertyStub {
            return Given(method: .p_headers_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var baseURL: Verify { return Verify(method: .p_baseURL_get) }
        public static var path: Verify { return Verify(method: .p_path_get) }
        public static var httpMethod: Verify { return Verify(method: .p_httpMethod_get) }
        public static var task: Verify { return Verify(method: .p_task_get) }
        public static var headers: Verify { return Verify(method: .p_headers_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - NetworkRequestBuilderApi
open class NetworkRequestBuilderApiMock: NetworkRequestBuilderApi, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func buildRequest(from endPoint: NetworkEndPoint) throws -> URLRequest {
        addInvocation(.m_buildRequest__from_endPoint(Parameter<NetworkEndPoint>.value(`endPoint`)))
		let perform = methodPerformValue(.m_buildRequest__from_endPoint(Parameter<NetworkEndPoint>.value(`endPoint`))) as? (NetworkEndPoint) -> Void
		perform?(`endPoint`)
		var __value: URLRequest
		do {
		    __value = try methodReturnValue(.m_buildRequest__from_endPoint(Parameter<NetworkEndPoint>.value(`endPoint`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for buildRequest(from endPoint: NetworkEndPoint). Use given")
			Failure("Stub return value not specified for buildRequest(from endPoint: NetworkEndPoint). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func configureParameters(bodyParameters: Parameters?,                             urlParameters: Parameters?,                             request: inout URLRequest) throws {
        addInvocation(.m_configureParameters__bodyParameters_bodyParametersurlParameters_urlParametersrequest_request(Parameter<Parameters?>.value(`bodyParameters`), Parameter<Parameters?>.value(`urlParameters`), Parameter<URLRequest>.value(`request`)))
		let perform = methodPerformValue(.m_configureParameters__bodyParameters_bodyParametersurlParameters_urlParametersrequest_request(Parameter<Parameters?>.value(`bodyParameters`), Parameter<Parameters?>.value(`urlParameters`), Parameter<URLRequest>.value(`request`))) as? (Parameters?, Parameters?, inout URLRequest) -> Void
		perform?(`bodyParameters`, `urlParameters`, &`request`)
		do {
		    _ = try methodReturnValue(.m_configureParameters__bodyParameters_bodyParametersurlParameters_urlParametersrequest_request(Parameter<Parameters?>.value(`bodyParameters`), Parameter<Parameters?>.value(`urlParameters`), Parameter<URLRequest>.value(`request`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func addAdditionalHeaders(_ additionalHeaders : HTTPHeaders?, request: inout URLRequest) {
        addInvocation(.m_addAdditionalHeaders__additionalHeadersrequest_request(Parameter<HTTPHeaders?>.value(`additionalHeaders`), Parameter<URLRequest>.value(`request`)))
		let perform = methodPerformValue(.m_addAdditionalHeaders__additionalHeadersrequest_request(Parameter<HTTPHeaders?>.value(`additionalHeaders`), Parameter<URLRequest>.value(`request`))) as? (HTTPHeaders?, inout URLRequest) -> Void
		perform?(`additionalHeaders`, &`request`)
    }


    fileprivate enum MethodType {
        case m_buildRequest__from_endPoint(Parameter<NetworkEndPoint>)
        case m_configureParameters__bodyParameters_bodyParametersurlParameters_urlParametersrequest_request(Parameter<Parameters?>, Parameter<Parameters?>, Parameter<URLRequest>)
        case m_addAdditionalHeaders__additionalHeadersrequest_request(Parameter<HTTPHeaders?>, Parameter<URLRequest>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_buildRequest__from_endPoint(let lhsEndpoint), .m_buildRequest__from_endPoint(let rhsEndpoint)):
                guard Parameter.compare(lhs: lhsEndpoint, rhs: rhsEndpoint, with: matcher) else { return false } 
                return true 
            case (.m_configureParameters__bodyParameters_bodyParametersurlParameters_urlParametersrequest_request(let lhsBodyparameters, let lhsUrlparameters, let lhsRequest), .m_configureParameters__bodyParameters_bodyParametersurlParameters_urlParametersrequest_request(let rhsBodyparameters, let rhsUrlparameters, let rhsRequest)):
                guard Parameter.compare(lhs: lhsBodyparameters, rhs: rhsBodyparameters, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsUrlparameters, rhs: rhsUrlparameters, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsRequest, rhs: rhsRequest, with: matcher) else { return false } 
                return true 
            case (.m_addAdditionalHeaders__additionalHeadersrequest_request(let lhsAdditionalheaders, let lhsRequest), .m_addAdditionalHeaders__additionalHeadersrequest_request(let rhsAdditionalheaders, let rhsRequest)):
                guard Parameter.compare(lhs: lhsAdditionalheaders, rhs: rhsAdditionalheaders, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsRequest, rhs: rhsRequest, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_buildRequest__from_endPoint(p0): return p0.intValue
            case let .m_configureParameters__bodyParameters_bodyParametersurlParameters_urlParametersrequest_request(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case let .m_addAdditionalHeaders__additionalHeadersrequest_request(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func buildRequest(from endPoint: Parameter<NetworkEndPoint>, willReturn: URLRequest...) -> MethodStub {
            return Given(method: .m_buildRequest__from_endPoint(`endPoint`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func buildRequest(from endPoint: Parameter<NetworkEndPoint>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_buildRequest__from_endPoint(`endPoint`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func buildRequest(from endPoint: Parameter<NetworkEndPoint>, willProduce: (StubberThrows<URLRequest>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_buildRequest__from_endPoint(`endPoint`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (URLRequest).self)
			willProduce(stubber)
			return given
        }
        public static func configureParameters(bodyParameters: Parameter<Parameters?>, urlParameters: Parameter<Parameters?>, request: Parameter<URLRequest>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_configureParameters__bodyParameters_bodyParametersurlParameters_urlParametersrequest_request(`bodyParameters`, `urlParameters`, `request`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func configureParameters(bodyParameters: Parameter<Parameters?>, urlParameters: Parameter<Parameters?>, request: Parameter<URLRequest>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_configureParameters__bodyParameters_bodyParametersurlParameters_urlParametersrequest_request(`bodyParameters`, `urlParameters`, `request`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func buildRequest(from endPoint: Parameter<NetworkEndPoint>) -> Verify { return Verify(method: .m_buildRequest__from_endPoint(`endPoint`))}
        public static func configureParameters(bodyParameters: Parameter<Parameters?>, urlParameters: Parameter<Parameters?>, request: Parameter<URLRequest>) -> Verify { return Verify(method: .m_configureParameters__bodyParameters_bodyParametersurlParameters_urlParametersrequest_request(`bodyParameters`, `urlParameters`, `request`))}
        public static func addAdditionalHeaders(_ additionalHeaders: Parameter<HTTPHeaders?>, request: Parameter<URLRequest>) -> Verify { return Verify(method: .m_addAdditionalHeaders__additionalHeadersrequest_request(`additionalHeaders`, `request`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func buildRequest(from endPoint: Parameter<NetworkEndPoint>, perform: @escaping (NetworkEndPoint) -> Void) -> Perform {
            return Perform(method: .m_buildRequest__from_endPoint(`endPoint`), performs: perform)
        }
        public static func configureParameters(bodyParameters: Parameter<Parameters?>, urlParameters: Parameter<Parameters?>, request: Parameter<URLRequest>, perform: @escaping (Parameters?, Parameters?, inout URLRequest) -> Void) -> Perform {
            return Perform(method: .m_configureParameters__bodyParameters_bodyParametersurlParameters_urlParametersrequest_request(`bodyParameters`, `urlParameters`, `request`), performs: perform)
        }
        public static func addAdditionalHeaders(_ additionalHeaders: Parameter<HTTPHeaders?>, request: Parameter<URLRequest>, perform: @escaping (HTTPHeaders?, inout URLRequest) -> Void) -> Perform {
            return Perform(method: .m_addAdditionalHeaders__additionalHeadersrequest_request(`additionalHeaders`, `request`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - RecipesListInteractorInterface
open class RecipesListInteractorInterfaceMock: RecipesListInteractorInterface, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func getRecipes(query: String, page: Int, completion: @escaping ([Recipe]?, Error?) -> ()) {
        addInvocation(.m_getRecipes__query_querypage_pagecompletion_completion(Parameter<String>.value(`query`), Parameter<Int>.value(`page`), Parameter<([Recipe]?, Error?) -> ()>.value(`completion`)))
		let perform = methodPerformValue(.m_getRecipes__query_querypage_pagecompletion_completion(Parameter<String>.value(`query`), Parameter<Int>.value(`page`), Parameter<([Recipe]?, Error?) -> ()>.value(`completion`))) as? (String, Int, @escaping ([Recipe]?, Error?) -> ()) -> Void
		perform?(`query`, `page`, `completion`)
    }


    fileprivate enum MethodType {
        case m_getRecipes__query_querypage_pagecompletion_completion(Parameter<String>, Parameter<Int>, Parameter<([Recipe]?, Error?) -> ()>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getRecipes__query_querypage_pagecompletion_completion(let lhsQuery, let lhsPage, let lhsCompletion), .m_getRecipes__query_querypage_pagecompletion_completion(let rhsQuery, let rhsPage, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsQuery, rhs: rhsQuery, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsPage, rhs: rhsPage, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getRecipes__query_querypage_pagecompletion_completion(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getRecipes(query: Parameter<String>, page: Parameter<Int>, completion: Parameter<([Recipe]?, Error?) -> ()>) -> Verify { return Verify(method: .m_getRecipes__query_querypage_pagecompletion_completion(`query`, `page`, `completion`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getRecipes(query: Parameter<String>, page: Parameter<Int>, completion: Parameter<([Recipe]?, Error?) -> ()>, perform: @escaping (String, Int, @escaping ([Recipe]?, Error?) -> ()) -> Void) -> Perform {
            return Perform(method: .m_getRecipes__query_querypage_pagecompletion_completion(`query`, `page`, `completion`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - RecipesListPresenterInterface
open class RecipesListPresenterInterfaceMock: RecipesListPresenterInterface, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func viewModelForIndex(_ index: Int) -> RecipeCollectionCellViewModel {
        addInvocation(.m_viewModelForIndex__index(Parameter<Int>.value(`index`)))
		let perform = methodPerformValue(.m_viewModelForIndex__index(Parameter<Int>.value(`index`))) as? (Int) -> Void
		perform?(`index`)
		var __value: RecipeCollectionCellViewModel
		do {
		    __value = try methodReturnValue(.m_viewModelForIndex__index(Parameter<Int>.value(`index`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for viewModelForIndex(_ index: Int). Use given")
			Failure("Stub return value not specified for viewModelForIndex(_ index: Int). Use given")
		}
		return __value
    }

    open func onTapFavorite() {
        addInvocation(.m_onTapFavorite)
		let perform = methodPerformValue(.m_onTapFavorite) as? () -> Void
		perform?()
    }

    open func onTapCellWithIndex(_ index: Int) {
        addInvocation(.m_onTapCellWithIndex__index(Parameter<Int>.value(`index`)))
		let perform = methodPerformValue(.m_onTapCellWithIndex__index(Parameter<Int>.value(`index`))) as? (Int) -> Void
		perform?(`index`)
    }

    open func onPagination() {
        addInvocation(.m_onPagination)
		let perform = methodPerformValue(.m_onPagination) as? () -> Void
		perform?()
    }

    open func onTapShowFavorites() {
        addInvocation(.m_onTapShowFavorites)
		let perform = methodPerformValue(.m_onTapShowFavorites) as? () -> Void
		perform?()
    }

    open func onSearchRecipe(recipe: String) {
        addInvocation(.m_onSearchRecipe__recipe_recipe(Parameter<String>.value(`recipe`)))
		let perform = methodPerformValue(.m_onSearchRecipe__recipe_recipe(Parameter<String>.value(`recipe`))) as? (String) -> Void
		perform?(`recipe`)
    }

    open func recipesAmount() -> Int {
        addInvocation(.m_recipesAmount)
		let perform = methodPerformValue(.m_recipesAmount) as? () -> Void
		perform?()
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_recipesAmount).casted()
		} catch {
			onFatalFailure("Stub return value not specified for recipesAmount(). Use given")
			Failure("Stub return value not specified for recipesAmount(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_viewModelForIndex__index(Parameter<Int>)
        case m_onTapFavorite
        case m_onTapCellWithIndex__index(Parameter<Int>)
        case m_onPagination
        case m_onTapShowFavorites
        case m_onSearchRecipe__recipe_recipe(Parameter<String>)
        case m_recipesAmount

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_viewModelForIndex__index(let lhsIndex), .m_viewModelForIndex__index(let rhsIndex)):
                guard Parameter.compare(lhs: lhsIndex, rhs: rhsIndex, with: matcher) else { return false } 
                return true 
            case (.m_onTapFavorite, .m_onTapFavorite):
                return true 
            case (.m_onTapCellWithIndex__index(let lhsIndex), .m_onTapCellWithIndex__index(let rhsIndex)):
                guard Parameter.compare(lhs: lhsIndex, rhs: rhsIndex, with: matcher) else { return false } 
                return true 
            case (.m_onPagination, .m_onPagination):
                return true 
            case (.m_onTapShowFavorites, .m_onTapShowFavorites):
                return true 
            case (.m_onSearchRecipe__recipe_recipe(let lhsRecipe), .m_onSearchRecipe__recipe_recipe(let rhsRecipe)):
                guard Parameter.compare(lhs: lhsRecipe, rhs: rhsRecipe, with: matcher) else { return false } 
                return true 
            case (.m_recipesAmount, .m_recipesAmount):
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_viewModelForIndex__index(p0): return p0.intValue
            case .m_onTapFavorite: return 0
            case let .m_onTapCellWithIndex__index(p0): return p0.intValue
            case .m_onPagination: return 0
            case .m_onTapShowFavorites: return 0
            case let .m_onSearchRecipe__recipe_recipe(p0): return p0.intValue
            case .m_recipesAmount: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func viewModelForIndex(_ index: Parameter<Int>, willReturn: RecipeCollectionCellViewModel...) -> MethodStub {
            return Given(method: .m_viewModelForIndex__index(`index`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func recipesAmount(willReturn: Int...) -> MethodStub {
            return Given(method: .m_recipesAmount, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func viewModelForIndex(_ index: Parameter<Int>, willProduce: (Stubber<RecipeCollectionCellViewModel>) -> Void) -> MethodStub {
            let willReturn: [RecipeCollectionCellViewModel] = []
			let given: Given = { return Given(method: .m_viewModelForIndex__index(`index`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (RecipeCollectionCellViewModel).self)
			willProduce(stubber)
			return given
        }
        public static func recipesAmount(willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_recipesAmount, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func viewModelForIndex(_ index: Parameter<Int>) -> Verify { return Verify(method: .m_viewModelForIndex__index(`index`))}
        public static func onTapFavorite() -> Verify { return Verify(method: .m_onTapFavorite)}
        public static func onTapCellWithIndex(_ index: Parameter<Int>) -> Verify { return Verify(method: .m_onTapCellWithIndex__index(`index`))}
        public static func onPagination() -> Verify { return Verify(method: .m_onPagination)}
        public static func onTapShowFavorites() -> Verify { return Verify(method: .m_onTapShowFavorites)}
        public static func onSearchRecipe(recipe: Parameter<String>) -> Verify { return Verify(method: .m_onSearchRecipe__recipe_recipe(`recipe`))}
        public static func recipesAmount() -> Verify { return Verify(method: .m_recipesAmount)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func viewModelForIndex(_ index: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_viewModelForIndex__index(`index`), performs: perform)
        }
        public static func onTapFavorite(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_onTapFavorite, performs: perform)
        }
        public static func onTapCellWithIndex(_ index: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_onTapCellWithIndex__index(`index`), performs: perform)
        }
        public static func onPagination(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_onPagination, performs: perform)
        }
        public static func onTapShowFavorites(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_onTapShowFavorites, performs: perform)
        }
        public static func onSearchRecipe(recipe: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_onSearchRecipe__recipe_recipe(`recipe`), performs: perform)
        }
        public static func recipesAmount(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_recipesAmount, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - RecipesListRouterInterface
open class RecipesListRouterInterfaceMock: RecipesListRouterInterface, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func showFavoritesScreen() {
        addInvocation(.m_showFavoritesScreen)
		let perform = methodPerformValue(.m_showFavoritesScreen) as? () -> Void
		perform?()
    }

    open func showWebView(url: URL) {
        addInvocation(.m_showWebView__url_url(Parameter<URL>.value(`url`)))
		let perform = methodPerformValue(.m_showWebView__url_url(Parameter<URL>.value(`url`))) as? (URL) -> Void
		perform?(`url`)
    }


    fileprivate enum MethodType {
        case m_showFavoritesScreen
        case m_showWebView__url_url(Parameter<URL>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_showFavoritesScreen, .m_showFavoritesScreen):
                return true 
            case (.m_showWebView__url_url(let lhsUrl), .m_showWebView__url_url(let rhsUrl)):
                guard Parameter.compare(lhs: lhsUrl, rhs: rhsUrl, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_showFavoritesScreen: return 0
            case let .m_showWebView__url_url(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func showFavoritesScreen() -> Verify { return Verify(method: .m_showFavoritesScreen)}
        public static func showWebView(url: Parameter<URL>) -> Verify { return Verify(method: .m_showWebView__url_url(`url`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func showFavoritesScreen(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_showFavoritesScreen, performs: perform)
        }
        public static func showWebView(url: Parameter<URL>, perform: @escaping (URL) -> Void) -> Perform {
            return Perform(method: .m_showWebView__url_url(`url`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - RecipesListViewControllerInterface
open class RecipesListViewControllerInterfaceMock: RecipesListViewControllerInterface, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func showLoading() {
        addInvocation(.m_showLoading)
		let perform = methodPerformValue(.m_showLoading) as? () -> Void
		perform?()
    }

    open func hideLoading() {
        addInvocation(.m_hideLoading)
		let perform = methodPerformValue(.m_hideLoading) as? () -> Void
		perform?()
    }

    open func reloadData() {
        addInvocation(.m_reloadData)
		let perform = methodPerformValue(.m_reloadData) as? () -> Void
		perform?()
    }

    open func appendData(at indexes: [Int]) {
        addInvocation(.m_appendData__at_indexes(Parameter<[Int]>.value(`indexes`)))
		let perform = methodPerformValue(.m_appendData__at_indexes(Parameter<[Int]>.value(`indexes`))) as? ([Int]) -> Void
		perform?(`indexes`)
    }


    fileprivate enum MethodType {
        case m_showLoading
        case m_hideLoading
        case m_reloadData
        case m_appendData__at_indexes(Parameter<[Int]>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_showLoading, .m_showLoading):
                return true 
            case (.m_hideLoading, .m_hideLoading):
                return true 
            case (.m_reloadData, .m_reloadData):
                return true 
            case (.m_appendData__at_indexes(let lhsIndexes), .m_appendData__at_indexes(let rhsIndexes)):
                guard Parameter.compare(lhs: lhsIndexes, rhs: rhsIndexes, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_showLoading: return 0
            case .m_hideLoading: return 0
            case .m_reloadData: return 0
            case let .m_appendData__at_indexes(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func showLoading() -> Verify { return Verify(method: .m_showLoading)}
        public static func hideLoading() -> Verify { return Verify(method: .m_hideLoading)}
        public static func reloadData() -> Verify { return Verify(method: .m_reloadData)}
        public static func appendData(at indexes: Parameter<[Int]>) -> Verify { return Verify(method: .m_appendData__at_indexes(`indexes`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func showLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_showLoading, performs: perform)
        }
        public static func hideLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_hideLoading, performs: perform)
        }
        public static func reloadData(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_reloadData, performs: perform)
        }
        public static func appendData(at indexes: Parameter<[Int]>, perform: @escaping ([Int]) -> Void) -> Perform {
            return Perform(method: .m_appendData__at_indexes(`indexes`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - RecipesServiceInterface
open class RecipesServiceInterfaceMock: RecipesServiceInterface, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func getRecipes(query: String,                     page: Int,                     completion: @escaping ServiceResult) {
        addInvocation(.m_getRecipes__query_querypage_pagecompletion_completion(Parameter<String>.value(`query`), Parameter<Int>.value(`page`), Parameter<ServiceResult>.any))
		let perform = methodPerformValue(.m_getRecipes__query_querypage_pagecompletion_completion(Parameter<String>.value(`query`), Parameter<Int>.value(`page`), Parameter<ServiceResult>.any)) as? (String, Int, @escaping ServiceResult) -> Void
		perform?(`query`, `page`, `completion`)
    }


    fileprivate enum MethodType {
        case m_getRecipes__query_querypage_pagecompletion_completion(Parameter<String>, Parameter<Int>, Parameter<ServiceResult>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getRecipes__query_querypage_pagecompletion_completion(let lhsQuery, let lhsPage, let lhsCompletion), .m_getRecipes__query_querypage_pagecompletion_completion(let rhsQuery, let rhsPage, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsQuery, rhs: rhsQuery, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsPage, rhs: rhsPage, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getRecipes__query_querypage_pagecompletion_completion(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getRecipes(query: Parameter<String>, page: Parameter<Int>, completion: Parameter<ServiceResult>) -> Verify { return Verify(method: .m_getRecipes__query_querypage_pagecompletion_completion(`query`, `page`, `completion`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getRecipes(query: Parameter<String>, page: Parameter<Int>, completion: Parameter<ServiceResult>, perform: @escaping (String, Int, @escaping ServiceResult) -> Void) -> Perform {
            return Perform(method: .m_getRecipes__query_querypage_pagecompletion_completion(`query`, `page`, `completion`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

