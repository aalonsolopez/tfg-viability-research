
FROM --platform=$BUILDPLATFORM rust:latest AS buildbase
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
RUN cp target/wasm32-wasi/release/tfg-viability-research.wasm tfg-viability-research.wasm
RUN chmod a+x tfg-viability-research.wasm

FROM scratch
COPY --link --from=build /src/tfg-viability-research.wasm /tfg-viability-research.wasm
ENTRYPOINT [ "/tfg-viability-research.wasm" ]