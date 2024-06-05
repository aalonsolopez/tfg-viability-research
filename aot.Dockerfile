FROM scratch
COPY target/wasm32-wasi/release/hello_aot.wasm /wasm-hello.wasm
ENTRYPOINT [ "/wasm-hello.wasm" ]