module Extism.PDK.Bindings where

import System.Exit
import Data.Word
import Data.Int
import Foreign.C.Types

type MemoryOffset = Word64
type InputOffset = Word64
type MemoryLength = Word64
type InputLength = Word64

foreign import ccall "extism_output_set" extismSetOutput :: MemoryOffset -> MemoryLength -> IO ()
foreign import ccall "extism_error_set" extismSetError :: MemoryOffset -> IO ()
foreign import ccall "extism_log_info" extismLogInfo :: MemoryOffset -> IO ()
foreign import ccall "extism_log_warn" extismLogWarn :: MemoryOffset -> IO ()
foreign import ccall "extism_log_debug" extismLogDebug :: MemoryOffset -> IO ()
foreign import ccall "extism_log_error" extismLogError :: MemoryOffset -> IO ()
foreign import ccall "extism_store_u8" extismStoreU8 :: MemoryOffset -> Word8 -> IO ()
foreign import ccall "extism_store_u64" extismStoreU64 :: MemoryOffset -> Word64 -> IO ()
foreign import ccall "extism_load_u8" extismLoadU8 :: MemoryOffset -> IO Word8
foreign import ccall "extism_load_u64" extismLoadU64 :: MemoryOffset -> IO Word64
foreign import ccall "extism_alloc" extismAlloc :: MemoryLength -> IO MemoryOffset
foreign import ccall "extism_length" extismLength :: MemoryOffset -> IO MemoryLength 
foreign import ccall "extism_free" extismFree :: MemoryOffset -> IO ()
foreign import ccall "extism_input_length" extismInputLength :: IO InputLength
foreign import ccall "extism_input_load_u8" extismInputLoadU8 :: InputOffset -> IO Word8
foreign import ccall "extism_input_load_u64" extismInputLoadU64 :: InputOffset -> IO Word64
foreign import ccall "extism_config_get" extismGetConfig :: MemoryOffset -> IO MemoryOffset
foreign import ccall "extism_var_get" extismGetVar :: MemoryOffset -> IO MemoryOffset
foreign import ccall "extism_var_set" extismSetVar :: MemoryOffset -> MemoryOffset -> IO ()
foreign import ccall "extism_http_request" extismHTTPRequest :: MemoryOffset -> MemoryOffset -> IO MemoryOffset
foreign import ccall "extism_http_status_code" extismHTTPStatusCode :: IO Int32
foreign import ccall "__wasm_call_ctors" wasmConstructor :: IO ()
foreign import ccall "__wasm_call_dtors" wasmDestructor :: IO ()