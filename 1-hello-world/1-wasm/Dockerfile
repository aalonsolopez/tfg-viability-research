
FROM --platform=$BUILDPLATFORM rust:1.61 AS buildbase
WORKDIR /src
RUN <<EOT bash
    set -ex
    rustup target add wasm32-wasi
EOT

FROM buildbase AS build
COPY Cargo.toml ./
COPY src ./src
# Build the Wasm binary
RUN cargo build --target wasm32-wasi --release
# This line builds the AOT Wasm binary
RUN cp target/wasm32-wasi/release/wasm-hello.wasm wasm-hello.wasm
RUN chmod a+x wasm-hello.wasm

FROM scratch
COPY --link --from=build /src/wasm-hello.wasm /wasm-hello.wasm
ENTRYPOINT [ "/wasm-hello.wasm" ]