//
//  IRUnitLowering.swift
//  DLVMCodeGen
//
//  Copyright 2016-2017 Richard Wei.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import CoreTensor
import DLVM
import LLVM_C

extension DLVM.Variable: LLEmittable {
    public typealias LLUnit = LLVMValueRef
    @discardableResult
    public func emit<T>(to context: LLGenContext<T>,
                     in env: LLGenEnvironment) -> LLVMValueRef {
        let llType = type.emit(to: context, in: env)
        return LLVMAddGlobal(context.module, llType, name)
    }
}

extension DLVM.Module : LLEmittable {
    public typealias LLUnit = LLVMModuleRef
    @discardableResult
    public func emit<T>(to context: LLGenContext<T>,
                     in env: LLGenEnvironment) -> LLUnit {
        for global in variables {
            global.emit(to: context, in: env)
        }
        for alias in typeAliases {
            alias.emit(to: context, in: env)
        }
        for fun in self {
            fun.emit(to: context, in: env)
        }
        return context.module
    }
}

extension DLVM.Function : LLEmittable {
    public typealias LLUnit = LLVMValueRef
    @discardableResult
    public func emit<T>(to context: LLGenContext<T>,
                     in env: LLGenEnvironment) -> LLVMValueRef {
        DLUnimplemented()
    }
}

extension DLVM.BasicBlock : LLEmittable {
    public typealias LLUnit = LLVMBasicBlockRef
    public func emit<T>(to context: LLGenContext<T>,
                     in env: LLGenEnvironment) -> LLVMBasicBlockRef {
        DLUnimplemented()
    }
}