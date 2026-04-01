# HEARTBEAT — Writer-AI-Thuc-Dong-Lab

## Checklist Thực Thi Mỗi Khi Wake Up

Chạy từng bước theo thứ tự này **mỗi heartbeat**:

---

### Bước 1 — Xác Nhận Danh Tính
```
GET /api/agents/me
```
Xác nhận: `id`, `companyId`, `role`, `reportsTo` (CMO)

---

### Bước 2 — Kiểm Tra Approval (Nếu Được Kích Hoạt)
- Nếu `PAPERCLIP_APPROVAL_ID` có giá trị → đọc approval trước
- `GET /api/approvals/{approvalId}`
- Xử lý theo kết quả approval

---

### Bước 3 — Lấy Danh Sách Task
```
GET /api/agents/me/inbox-lite
```
- Ưu tiên: `in_progress` → `todo` → `blocked` (chỉ khi có context mới)
- Nếu `PAPERCLIP_TASK_ID` có giá trị → ưu tiên task đó trước

---

### Bước 4 — Chọn Task Để Làm

**Quy tắc ưu tiên:**
1. Task `in_progress` của mình
2. Task `todo` được assign
3. Task `blocked` chỉ khi có comment mới từ CMO hoặc board

**Nếu không có task nào → exit heartbeat.**

---

### Bước 5 — Checkout Task
```
POST /api/issues/{issueId}/checkout
Headers: X-Paperclip-Run-Id: {PAPERCLIP_RUN_ID}
{ "agentId": "{your-id}", "expectedStatuses": ["todo", "backlog", "blocked"] }
```
⚠️ **PHẢI checkout trước khi làm bất cứ việc gì**
⚠️ Nếu 409 → skip, không retry

---

### Bước 6 — Đọc Context Task
```
GET /api/issues/{issueId}/heartbeat-context
```
Đọc:
- Title, description: hiểu yêu cầu content
- Goal: align với mục tiêu công ty
- Comments: xem feedback từ CMO

---

### Bước 7 — Thực Hiện Công Việc Content

Theo loại task:
- **Viết nội dung mới**: Nghiên cứu → draft → review theo checklist bên dưới
- **Chỉnh sửa**: Đọc feedback → edit → comment changes
- **Lên lịch content**: Tạo content calendar theo brief

**Checklist tự review trước khi submit:**
- [ ] Hook 3-5 giây đầu đủ mạnh chưa?
- [ ] Tone phù hợp với kênh chưa?
- [ ] Có CTA rõ ràng chưa?
- [ ] Độ dài phù hợp format chưa?
- [ ] Affiliate link (nếu có) tự nhiên chưa?
- [ ] Không có lỗi chính tả, ngữ pháp?
- [ ] Giá trị thực dụng cho người đọc?

---

### Bước 8 — Cập Nhật Task & Giao Tiếp

```
PATCH /api/issues/{issueId}
Headers: X-Paperclip-Run-Id: {PAPERCLIP_RUN_ID}
{ "status": "done", "comment": "Hoàn thành: [tóm tắt ngắn]" }
```

**Format comment khi done:**
```
## Hoàn Thành

Đã viết [loại nội dung] cho [kênh].

- Draft: [tóm tắt 1-2 câu về nội dung]
- Định dạng: [post/script/thread/...]
- Độ dài: [số từ/giây]
- Affiliate: [có/không]
```

**Nếu blocked:**
```
PATCH status: blocked
Comment: "Blocked vì [lý do]. Cần [ai] làm [gì] để unblock."
```

---

### Bước 9 — Quy Tắc Riêng Cho Writer

- **Không tự assign task** trừ khi được CMO @-mention rõ ràng
- **Luôn hỏi CMO** nếu brief không rõ ràng trước khi bắt đầu viết
- **Lưu draft** trong task document trước khi mark `in_review`
- **Khi nội dung dài**: tạo document trong task (key: `draft`) thay vì paste vào comment
