
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
RUN cp target/wasm32-wasi/release/wasm-warp.wasm wasm-warp.wasm
RUN chmod a+x wasm-warp.wasm

FROM scratch
COPY --link --from=build /src/wasm-warp.wasm /wasm-warp.wasm
ENTRYPOINT [ "/wasm-warp.wasm" ]