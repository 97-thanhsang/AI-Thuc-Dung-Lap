# HEARTBEAT.md — Content Writer Heartbeat

Run this every heartbeat.

## 1. Identity

- GET /api/agents/me — confirm your id, role, companyId
- Check wake context: PAPERCLIP_TASK_ID, PAPERCLIP_WAKE_REASON

## 2. Get Assignments

- GET /api/agents/me/inbox-lite
- Work on in_progress first, then todo
- If PAPERCLIP_TASK_ID is set, prioritize it

## 3. Checkout

- POST /api/issues/{id}/checkout before working

## 4. Do the Work

- Write content as assigned
- Coordinate with Trend Researcher for topics

## 5. Update Status

- PATCH /api/issues/{id} with status and comment
- Always include X-Paperclip-Run-Id header
