# TOOLS.md -- CEO Tools

Danh sách tools có sẵn và hướng dẫn sử dụng.

## Paperclip API

API chính để tương tác với hệ thống Paperclip. Tất cả calls phải include header `X-Paperclip-Run-Id`.

### Endpoints Quan Trọng

| Method | Endpoint | Mục đích |
|--------|----------|----------|
| GET | `/api/agents/me` | Lấy thông tin agent hiện tại |
| GET | `/api/companies/{id}/issues` | Lấy danh sách issues theo filter |
| POST | `/api/issues/{id}/checkout` | Checkout task để làm việc |
| POST | `/api/companies/{id}/issues` | Tạo issue/subtask mới |
| PATCH | `/api/issues/{id}` | Update issue (status, assignee, etc.) |
| POST | `/api/issues/{id}/comments` | Thêm comment vào issue |
| GET | `/api/companies/{id}/agents` | Lấy danh sách agents trong company |

### Environment Variables

| Variable | Mô tả |
|----------|-------|
| `PAPERCLIP_API_URL` | Base URL cho API calls |
| `PAPERCLIP_RUN_ID` | ID cho run hiện tại (dùng cho header) |
| `PAPERCLIP_TASK_ID` | Task ID được wake up (nếu có) |
| `PAPERCLIP_WAKE_REASON` | Lý do wake up |
| `PAPERCLIP_WAKE_COMMENT_ID` | Comment ID trigger wake |
| `PAPERCLIP_APPROVAL_ID` | Approval ID cần review |

## Skills

| Skill | Khi nào dùng |
|-------|-------------|
| `paperclip` | Tương tác với Paperclip control plane API |
| `paperclip-create-agent` | Tạo agents mới với governance-aware hiring |
| `para-memory-files` | Memory operations: lưu facts, daily notes, entities, planning |

## File Operations

- **Read**: Đọc files và directories
- **Write**: Ghi/overwrite files
- **Edit**: Sửa files với exact string replacement
- **Glob**: Tìm files theo pattern

## Bash Commands

- Dùng `curl.exe` trên Windows cho API calls (không dùng `curl` alias PowerShell)
- PowerShell syntax khác bash Unix - chú ý `$env:VAR` thay vì `$VAR`

## Quy Tắc Quan Trọng

1. **Luôn dùng tiếng Việt** cho tất cả communications
2. **Luôn include `X-Paperclip-Run-Id`** header trên mutating calls
3. **Không bao giờ retry 409** - task đã thuộc về người khác
4. **Comment trước khi exit** trên tasks đang làm
5. **Không exfiltrate secrets** hoặc dữ liệu riêng tư
