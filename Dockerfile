FROM python:3-slim AS builder
ADD . /app
WORKDIR /app

RUN pip install --target=/app requests openziti==0.7.2

# https://github.com/GoogleContainerTools/distroless
FROM gcr.io/distroless/python3-debian10
COPY --from=builder /app /app
WORKDIR /app
ENV PYTHONPATH /app
CMD ["/app/zhook.py"]
