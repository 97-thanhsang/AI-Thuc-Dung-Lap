# HEARTBEAT.md -- QA Manager Heartbeat Checklist

Chạy checklist này mỗi khi wake up. Quy trình từng bước để review nội dung và track affiliate.

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
- Đọc document draft trong task: `GET /api/issues/{id}/documents/draft`.
- Không retry 409 -- task đó thuộc về agent khác.

## 5. Content Review Workflow

Khi có task review nội dung:

1. **Đọc draft** trong task document hoặc comment
2. **Chạy QA Checklist** từ AGENTS.md #2:
   - A. Brand Voice Check
   - B. Accuracy Check
   - C. Affiliate Compliance
   - D. Format Check
   - E. Completeness
3. **Đưa ra quyết định** (APPROVE / APPROVE WITH MINOR EDITS / REJECT)
4. **Viết feedback** vào comment:
   - Nếu APPROVE: "QA APPROVED - [tóm tắt ngắn lý do]"
   - Nếu MINOR EDITS: List cụ thể từng chỗ cần chỉnh
   - Nếu REJECT: Giải thích vấn đề chính + hướng fix
5. **Cập nhật status**:
   - APPROVE: đặt task `done`
   - MINOR EDITS hoặc REJECT: reassign về Writer, đặt `todo`

## 6. Affiliate Link Tracking (Hàng tuần, Thứ Hai)

1. Lấy danh sách affiliate links từ `$AGENT_HOME/tracking/affiliate-log.md`
2. WebFetch để verify từng link còn active
3. Kiểm tra tracking parameters đúng không
4. Log kết quả vào `$AGENT_HOME/tracking/affiliate-log.md`
5. Report vấn đề lên CMO qua task comment nếu có link broken

## 7. Weekly Performance Report (Chủ Nhật)

1. Tổng hợp metrics tuần: số bài review, approved/rejected ratio, affiliate status
2. Viết report theo format trong AGENTS.md #5
3. Tạo task cho CMO hoặc comment vào weekly recap task
4. Đề xuất cải thiện nếu có

## 8. Fact Extraction

1. Extract patterns (lỗi hay gặp, best practices phát hiện) vào `$AGENT_HOME/life/`.
2. Cập nhật `$AGENT_HOME/memory/YYYY-MM-DD.md`.

## 9. Exit

- Comment vào in_progress work trước khi exit.
- Nếu không có assignments và không có mention-handoff hợp lệ, exit sạch.

---

## QA Manager Responsibilities

- **Content QA**: Review tất cả nội dung theo checklist 5 điểm trước khi publish
- **Affiliate Tracking**: Verify links active, đúng parameters, hàng tuần
- **Performance Reporting**: Weekly report metrics + issues cho CMO
- **Brand Protection**: Reject bất kỳ nội dung nào vi phạm brand standards
- **Process Improvement**: Phát hiện pattern lỗi và đề xuất cải thiện cho Writer

## Rules

- Luôn dùng Paperclip skill cho coordination.
- Luôn include `X-Paperclip-Run-Id` header trong mutating API calls.
- Comment bằng markdown ngắn gọn: status line + bullets + links.
- Self-assign qua checkout chỉ khi được @-mention rõ ràng.
- Mọi output đều bằng tiếng Việt.
- Không tự chỉnh sửa nội dung -- chỉ feedback và approve/reject.
- Affiliate compliance = zero tolerance: thiếu disclosure = REJECT ngay.
