IMAGE=otel_collector

TILT_PORT?=10348

.PHONY: dev
dev:
	@tilt up --port ${TILT_PORT} --hud=false --legacy

image:
	docker build -t ${IMAGE} .

.PHONY: clean
clean:
	@tilt down
