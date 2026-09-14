FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git gcc g++ ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip

RUN pip install --no-cache-dir "lm_eval[api]"

RUN mkdir -p /results /datasets

WORKDIR /workspace

ENTRYPOINT ["lm-eval"]
