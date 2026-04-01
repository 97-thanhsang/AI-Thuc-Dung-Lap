# TOOLS — Writer-AI-Thuc-Dong-Lab

## Tools Có Sẵn

### 1. Paperclip API (Task Management)

**Mục đích**: Quản lý tasks, giao tiếp với CMO, cập nhật tiến độ

**Authentication**: `Authorization: Bearer $PAPERCLIP_API_KEY`
**Run tracking**: Thêm `X-Paperclip-Run-Id: $PAPERCLIP_RUN_ID` vào TẤT CẢ requests thay đổi dữ liệu

**Endpoints hay dùng:**

| Hành động | Endpoint |
|-----------|----------|
| Lấy identity của mình | `GET /api/agents/me` |
| Xem inbox | `GET /api/agents/me/inbox-lite` |
| Checkout task | `POST /api/issues/{id}/checkout` |
| Đọc context task | `GET /api/issues/{id}/heartbeat-context` |
| Đọc comments | `GET /api/issues/{id}/comments` |
| Cập nhật task | `PATCH /api/issues/{id}` |
| Thêm comment | `POST /api/issues/{id}/comments` |
| Tạo document trong task | `PUT /api/issues/{id}/documents/{key}` |

**Lưu nội dung dài vào document:**
```json
PUT /api/issues/{issueId}/documents/draft
{
  "title": "Draft Content",
  "format": "markdown",
  "body": "# [Tên bài]\n\n[Nội dung]",
  "baseRevisionId": null
}
```

---

### 2. File Tools (Đọc/Ghi Files)

**Mục đích**: Đọc brief files, lưu draft nội dung, tham khảo templates

**Read**: Đọc files từ workspace
**Write**: Tạo hoặc ghi đè files
**Edit**: Chỉnh sửa phần cụ thể trong file

---

### 3. Web Research

**Mục đích**: Nghiên cứu chủ đề, tìm số liệu, verify thông tin về AI tools

**WebFetch**: Lấy nội dung từ URL cụ thể
**Search (nếu có MCP)**: Tìm kiếm web

**Khi dùng cho content research:**
- Verify tính năng của AI tools trước khi viết
- Tìm case studies thực tế
- Check số liệu, thống kê
- Đọc changelog/release notes

---

### 4. Shell/Bash

**Mục đích**: Chỉ dùng khi thực sự cần thiết cho công việc kỹ thuật

Thông thường Writer **không cần** shell. Chỉ dùng nếu CMO yêu cầu xử lý files đặc biệt.

---

## Hướng Dẫn Paperclip Chi Tiết

### Checkout Task
```json
POST /api/issues/{issueId}/checkout
{
  "agentId": "3738f9a8-5a7f-4c0f-afc1-656904b62089",
  "expectedStatuses": ["todo", "backlog", "blocked"]
}
```

### Update Task Khi Done
```json
PATCH /api/issues/{issueId}
{
  "status": "done",
  "comment": "Đã hoàn thành [mô tả ngắn]. Draft lưu tại document 'draft'."
}
```

### Update Task Khi Blocked
```json
PATCH /api/issues/{issueId}
{
  "status": "blocked",
  "comment": "Blocked: [lý do cụ thể]. Cần CMO [hành động cần thiết]."
}
```

### Gửi Draft Cho CMO Review
```json
PATCH /api/issues/{issueId}
{
  "status": "in_review",
  "comment": "Draft hoàn thành, gửi CMO review. Xem document 'draft'."
}
```

---

## Quy Tắc Sử Dụng Tools

1. **Luôn checkout** trước khi làm việc
2. **Luôn thêm Run-Id header** khi PATCH/POST task
3. **Lưu draft dài** vào document, không paste vào comment
4. **Comment mỗi heartbeat** dù task chưa done
5. **Không self-assign** trừ khi được @-mention rõ ràng

---

## Skills Đã Cài

| Skill | Mô tả | Khi nào dùng |
|-------|-------|--------------|
| `paperclip` | Paperclip API workflow | Mỗi heartbeat |
| `para-memory-files` | Hệ thống ký ức PARA | Lưu/truy xuất context |

---

## Environment Variables

| Biến | Mô tả |
|------|-------|
| `PAPERCLIP_API_URL` | URL của Paperclip server |
| `PAPERCLIP_API_KEY` | JWT token xác thực |
| `PAPERCLIP_AGENT_ID` | ID của Writer agent |
| `PAPERCLIP_COMPANY_ID` | ID công ty |
| `PAPERCLIP_RUN_ID` | ID của heartbeat run hiện tại |
| `PAPERCLIP_TASK_ID` | Task được trigger (nếu có) |
| `PAPERCLIP_WAKE_REASON` | Lý do wake up |
| `PAPERCLIP_WAKE_COMMENT_ID` | Comment trigger (nếu được mention) |
