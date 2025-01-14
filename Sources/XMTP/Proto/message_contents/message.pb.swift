// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: message_contents/message.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

/// Messages used for transport and storage of user conversations.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Message header is encoded separately as the bytes are also used
/// as associated data for authenticated encryption
public struct Xmtp_MessageContents_MessageHeaderV1 {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var sender: Xmtp_MessageContents_PublicKeyBundle {
    get {return _storage._sender ?? Xmtp_MessageContents_PublicKeyBundle()}
    set {_uniqueStorage()._sender = newValue}
  }
  /// Returns true if `sender` has been explicitly set.
  public var hasSender: Bool {return _storage._sender != nil}
  /// Clears the value of `sender`. Subsequent reads from it will return its default value.
  public mutating func clearSender() {_uniqueStorage()._sender = nil}

  public var recipient: Xmtp_MessageContents_PublicKeyBundle {
    get {return _storage._recipient ?? Xmtp_MessageContents_PublicKeyBundle()}
    set {_uniqueStorage()._recipient = newValue}
  }
  /// Returns true if `recipient` has been explicitly set.
  public var hasRecipient: Bool {return _storage._recipient != nil}
  /// Clears the value of `recipient`. Subsequent reads from it will return its default value.
  public mutating func clearRecipient() {_uniqueStorage()._recipient = nil}

  public var timestamp: UInt64 {
    get {return _storage._timestamp}
    set {_uniqueStorage()._timestamp = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Message is the top level protocol element
public struct Xmtp_MessageContents_MessageV1 {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// encapsulates encoded MessageHeaderV1
  public var headerBytes: Data = Data()

  /// Ciphertext.payload MUST contain encrypted EncodedContent
  public var ciphertext: Xmtp_MessageContents_Ciphertext {
    get {return _ciphertext ?? Xmtp_MessageContents_Ciphertext()}
    set {_ciphertext = newValue}
  }
  /// Returns true if `ciphertext` has been explicitly set.
  public var hasCiphertext: Bool {return self._ciphertext != nil}
  /// Clears the value of `ciphertext`. Subsequent reads from it will return its default value.
  public mutating func clearCiphertext() {self._ciphertext = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _ciphertext: Xmtp_MessageContents_Ciphertext? = nil
}

/// Message header carries information that is not encrypted, and is therefore
/// observable by the network. It is however authenticated as associated data
/// of the AEAD encryption used to protect the message,
/// thus providing tamper evidence.
public struct Xmtp_MessageContents_MessageHeaderV2 {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// sender specified message creation time
  public var createdNs: UInt64 = 0

  /// the topic the message belongs to
  public var topic: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Message combines the encoded header with the encrypted payload.
public struct Xmtp_MessageContents_MessageV2 {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// encapsulates encoded MessageHeaderV2
  public var headerBytes: Data = Data()

  /// Ciphertext.payload MUST contain encrypted SignedContent
  public var ciphertext: Xmtp_MessageContents_Ciphertext {
    get {return _ciphertext ?? Xmtp_MessageContents_Ciphertext()}
    set {_ciphertext = newValue}
  }
  /// Returns true if `ciphertext` has been explicitly set.
  public var hasCiphertext: Bool {return self._ciphertext != nil}
  /// Clears the value of `ciphertext`. Subsequent reads from it will return its default value.
  public mutating func clearCiphertext() {self._ciphertext = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _ciphertext: Xmtp_MessageContents_Ciphertext? = nil
}

/// Versioned Message
public struct Xmtp_MessageContents_Message {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var version: Xmtp_MessageContents_Message.OneOf_Version? = nil

  public var v1: Xmtp_MessageContents_MessageV1 {
    get {
      if case .v1(let v)? = version {return v}
      return Xmtp_MessageContents_MessageV1()
    }
    set {version = .v1(newValue)}
  }

  public var v2: Xmtp_MessageContents_MessageV2 {
    get {
      if case .v2(let v)? = version {return v}
      return Xmtp_MessageContents_MessageV2()
    }
    set {version = .v2(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_Version: Equatable {
    case v1(Xmtp_MessageContents_MessageV1)
    case v2(Xmtp_MessageContents_MessageV2)

  #if !swift(>=4.1)
    public static func ==(lhs: Xmtp_MessageContents_Message.OneOf_Version, rhs: Xmtp_MessageContents_Message.OneOf_Version) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.v1, .v1): return {
        guard case .v1(let l) = lhs, case .v1(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.v2, .v2): return {
        guard case .v2(let l) = lhs, case .v2(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  public init() {}
}

/// DecodedMessage represents the decrypted message contents.
/// DecodedMessage instances are not stored on the network, but
/// may be serialized and stored by clients
public struct Xmtp_MessageContents_DecodedMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var id: String = String()

  public var messageVersion: String = String()

  public var senderAddress: String = String()

  public var recipientAddress: String {
    get {return _recipientAddress ?? String()}
    set {_recipientAddress = newValue}
  }
  /// Returns true if `recipientAddress` has been explicitly set.
  public var hasRecipientAddress: Bool {return self._recipientAddress != nil}
  /// Clears the value of `recipientAddress`. Subsequent reads from it will return its default value.
  public mutating func clearRecipientAddress() {self._recipientAddress = nil}

  public var sentNs: UInt64 = 0

  public var contentTopic: String = String()

  public var conversation: Xmtp_MessageContents_ConversationReference {
    get {return _conversation ?? Xmtp_MessageContents_ConversationReference()}
    set {_conversation = newValue}
  }
  /// Returns true if `conversation` has been explicitly set.
  public var hasConversation: Bool {return self._conversation != nil}
  /// Clears the value of `conversation`. Subsequent reads from it will return its default value.
  public mutating func clearConversation() {self._conversation = nil}

  /// encapsulates EncodedContent
  public var contentBytes: Data = Data()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _recipientAddress: String? = nil
  fileprivate var _conversation: Xmtp_MessageContents_ConversationReference? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Xmtp_MessageContents_MessageHeaderV1: @unchecked Sendable {}
extension Xmtp_MessageContents_MessageV1: @unchecked Sendable {}
extension Xmtp_MessageContents_MessageHeaderV2: @unchecked Sendable {}
extension Xmtp_MessageContents_MessageV2: @unchecked Sendable {}
extension Xmtp_MessageContents_Message: @unchecked Sendable {}
extension Xmtp_MessageContents_Message.OneOf_Version: @unchecked Sendable {}
extension Xmtp_MessageContents_DecodedMessage: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "xmtp.message_contents"

extension Xmtp_MessageContents_MessageHeaderV1: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MessageHeaderV1"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .same(proto: "recipient"),
    3: .same(proto: "timestamp"),
  ]

  fileprivate class _StorageClass {
    var _sender: Xmtp_MessageContents_PublicKeyBundle? = nil
    var _recipient: Xmtp_MessageContents_PublicKeyBundle? = nil
    var _timestamp: UInt64 = 0

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _sender = source._sender
      _recipient = source._recipient
      _timestamp = source._timestamp
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every case branch when no optimizations are
        // enabled. https://github.com/apple/swift-protobuf/issues/1034
        switch fieldNumber {
        case 1: try { try decoder.decodeSingularMessageField(value: &_storage._sender) }()
        case 2: try { try decoder.decodeSingularMessageField(value: &_storage._recipient) }()
        case 3: try { try decoder.decodeSingularUInt64Field(value: &_storage._timestamp) }()
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every if/case branch local when no optimizations
      // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
      // https://github.com/apple/swift-protobuf/issues/1182
      try { if let v = _storage._sender {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      } }()
      try { if let v = _storage._recipient {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      } }()
      if _storage._timestamp != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._timestamp, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Xmtp_MessageContents_MessageHeaderV1, rhs: Xmtp_MessageContents_MessageHeaderV1) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._sender != rhs_storage._sender {return false}
        if _storage._recipient != rhs_storage._recipient {return false}
        if _storage._timestamp != rhs_storage._timestamp {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Xmtp_MessageContents_MessageV1: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MessageV1"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "header_bytes"),
    2: .same(proto: "ciphertext"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.headerBytes) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._ciphertext) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.headerBytes.isEmpty {
      try visitor.visitSingularBytesField(value: self.headerBytes, fieldNumber: 1)
    }
    try { if let v = self._ciphertext {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Xmtp_MessageContents_MessageV1, rhs: Xmtp_MessageContents_MessageV1) -> Bool {
    if lhs.headerBytes != rhs.headerBytes {return false}
    if lhs._ciphertext != rhs._ciphertext {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Xmtp_MessageContents_MessageHeaderV2: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MessageHeaderV2"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "created_ns"),
    2: .same(proto: "topic"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.createdNs) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.topic) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.createdNs != 0 {
      try visitor.visitSingularUInt64Field(value: self.createdNs, fieldNumber: 1)
    }
    if !self.topic.isEmpty {
      try visitor.visitSingularStringField(value: self.topic, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Xmtp_MessageContents_MessageHeaderV2, rhs: Xmtp_MessageContents_MessageHeaderV2) -> Bool {
    if lhs.createdNs != rhs.createdNs {return false}
    if lhs.topic != rhs.topic {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Xmtp_MessageContents_MessageV2: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MessageV2"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "header_bytes"),
    2: .same(proto: "ciphertext"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.headerBytes) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._ciphertext) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.headerBytes.isEmpty {
      try visitor.visitSingularBytesField(value: self.headerBytes, fieldNumber: 1)
    }
    try { if let v = self._ciphertext {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Xmtp_MessageContents_MessageV2, rhs: Xmtp_MessageContents_MessageV2) -> Bool {
    if lhs.headerBytes != rhs.headerBytes {return false}
    if lhs._ciphertext != rhs._ciphertext {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Xmtp_MessageContents_Message: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Message"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "v1"),
    2: .same(proto: "v2"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: Xmtp_MessageContents_MessageV1?
        var hadOneofValue = false
        if let current = self.version {
          hadOneofValue = true
          if case .v1(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.version = .v1(v)
        }
      }()
      case 2: try {
        var v: Xmtp_MessageContents_MessageV2?
        var hadOneofValue = false
        if let current = self.version {
          hadOneofValue = true
          if case .v2(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.version = .v2(v)
        }
      }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    switch self.version {
    case .v1?: try {
      guard case .v1(let v)? = self.version else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }()
    case .v2?: try {
      guard case .v2(let v)? = self.version else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Xmtp_MessageContents_Message, rhs: Xmtp_MessageContents_Message) -> Bool {
    if lhs.version != rhs.version {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Xmtp_MessageContents_DecodedMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".DecodedMessage"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .standard(proto: "message_version"),
    3: .standard(proto: "sender_address"),
    4: .standard(proto: "recipient_address"),
    5: .standard(proto: "sent_ns"),
    6: .standard(proto: "content_topic"),
    7: .same(proto: "conversation"),
    8: .standard(proto: "content_bytes"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.messageVersion) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.senderAddress) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self._recipientAddress) }()
      case 5: try { try decoder.decodeSingularUInt64Field(value: &self.sentNs) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.contentTopic) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._conversation) }()
      case 8: try { try decoder.decodeSingularBytesField(value: &self.contentBytes) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.messageVersion.isEmpty {
      try visitor.visitSingularStringField(value: self.messageVersion, fieldNumber: 2)
    }
    if !self.senderAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.senderAddress, fieldNumber: 3)
    }
    try { if let v = self._recipientAddress {
      try visitor.visitSingularStringField(value: v, fieldNumber: 4)
    } }()
    if self.sentNs != 0 {
      try visitor.visitSingularUInt64Field(value: self.sentNs, fieldNumber: 5)
    }
    if !self.contentTopic.isEmpty {
      try visitor.visitSingularStringField(value: self.contentTopic, fieldNumber: 6)
    }
    try { if let v = self._conversation {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    } }()
    if !self.contentBytes.isEmpty {
      try visitor.visitSingularBytesField(value: self.contentBytes, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Xmtp_MessageContents_DecodedMessage, rhs: Xmtp_MessageContents_DecodedMessage) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.messageVersion != rhs.messageVersion {return false}
    if lhs.senderAddress != rhs.senderAddress {return false}
    if lhs._recipientAddress != rhs._recipientAddress {return false}
    if lhs.sentNs != rhs.sentNs {return false}
    if lhs.contentTopic != rhs.contentTopic {return false}
    if lhs._conversation != rhs._conversation {return false}
    if lhs.contentBytes != rhs.contentBytes {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
