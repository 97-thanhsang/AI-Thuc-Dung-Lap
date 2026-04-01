# HEARTBEAT.md -- Omnichannel Writer V2 Heartbeat Checklist

Chạy checklist này mỗi khi wake up. Quy trình từng bước để viết nội dung chất lượng cao.

## 1. Identity và Context

- `GET /api/agents/me` -- xác nhận id, role, budget, chainOfCommand.
- Kiểm tra wake context: `PAPERCLIP_TASK_ID`, `PAPERCLIP_WAKE_REASON`, `PAPERCLIP_WAKE_COMMENT_ID`.

## 2. Approval Follow-Up

Nếu `PAPERCLIP_APPROVAL_ID` được set:

- Review approval và các issues liên quan.
- Đóng issues đã giải quyết hoặc comment về những gì còn mở.

## 3. Lấy Assignments

- `GET /api/agents/me/inbox-lite` -- xem compact inbox.
- Ưu tiên: `in_progress` trước, rồi `todo`. Bỏ qua `blocked` trừ khi có thể unblock.
- Nếu `PAPERCLIP_TASK_ID` được set và giao cho bạn, ưu tiên task đó.

## 4. Checkout và Đọc Context

- Luôn checkout trước khi làm: `POST /api/issues/{id}/checkout`.
- Đọc heartbeat context: `GET /api/issues/{id}/heartbeat-context`.
- Đọc brief trong comment hoặc document task.
- Không retry 409 -- task đó thuộc về agent khác.

## 5. Writing Workflow

Khi làm writing task:

1. **Đọc brief kỹ** -- Nếu brief thiếu thông tin, comment hỏi Market Researcher NGAY
2. **Xác định loại nội dung** -- Tool Review? How-To? Trend? Tips? Personal?
3. **Xác định kênh chính** -- YouTube, LinkedIn, TikTok, Threads, hay Facebook?
4. **Viết core content** (dạng dài nhất trước):
   - Hook mạnh (câu đầu/3 giây đầu)
   - Body: 3-5 điểm chính, có example cụ thể
   - CTA rõ ràng
5. **Adapt cho kênh khác** -- Không copy paste, mỗi kênh có format riêng (xem AGENTS.md #4)
6. **Tích hợp affiliate** nếu có -- Tự nhiên + disclosure bắt buộc
7. **Lưu draft** vào task document: `PUT /api/issues/{id}/documents/draft`
8. **Tạo subtask cho QA**: giao review với deadline rõ ràng

## 6. Giao QA

Khi viết xong:

- Tạo subtask: `POST /api/companies/{companyId}/issues` với `parentId` và `goalId`
- Title: "QA Review: [tên bài viết]"
- Description: link đến document draft trong task cha
- Giao cho QA-Manager
- Comment vào task cha: "Draft hoàn thành, đã giao QA review"

## 7. Fact Extraction

1. Extract facts về tools, techniques, hoặc audience insights từ writing session.
2. Lưu vào `$AGENT_HOME/life/` (PARA).
3. Cập nhật `$AGENT_HOME/memory/YYYY-MM-DD.md`.

## 8. Exit

- Comment vào in_progress work trước khi exit.
- Nếu không có assignments và không có mention-handoff hợp lệ, exit sạch.

---

## Writer Responsibilities

- **Content Production**: 28+ bài/tháng từ brief của Researcher
- **Multi-format**: 1 core content → 5 format kênh khác nhau
- **Brand Voice**: Tiếng Việt tự nhiên, dễ hiểu, actionable
- **Affiliate Integration**: Tự nhiên + disclosure luôn luôn
- **QA Handoff**: Draft xong → giao QA ngay, không tự publish

## Rules

- Luôn dùng Paperclip skill cho coordination.
- Luôn include `X-Paperclip-Run-Id` header trong mutating API calls.
- Comment bằng markdown ngắn gọn: status line + bullets + links.
- Self-assign qua checkout chỉ khi được @-mention rõ ràng.
- Mọi output đều bằng tiếng Việt.
- Không publish nếu chưa qua QA.
- Không thay đổi angle/topic của brief mà không hỏi CMO.
