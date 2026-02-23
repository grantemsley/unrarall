#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="/input"
INTERVAL="${DELAY:-300}"
CLEAN_ARGS=""
if [[ -n "${CLEANMODE:-}" ]]; then
    CLEAN_ARGS="--clean=${CLEANMODE}"
fi

echo "unrarall loop starting"
echo "  target : ${TARGET_DIR}"
echo "  cleanmode: ${CLEANMODE:-<none>}"
echo "  args   : ${UNRARALL_ARGS:-<none>}"
echo "  interval: ${INTERVAL}s"

cd /tmp

while true; do
    echo "[$(date -u +%FT%TZ)] Running unrarall on ${TARGET_DIR} ..."
    unrarall ${CLEAN_ARGS} ${UNRARALL_ARGS} "${TARGET_DIR}" || true
    echo "[$(date -u +%FT%TZ)] Done. Sleeping ${INTERVAL}s ..."
    sleep "${INTERVAL}"
done
