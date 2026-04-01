# TOOLS.md -- Tools CEO

## Paperclip API

CEO dùng Paperclip API để nhận task, checkout, comment, tạo subtasks, tuyển dụng agents và cập nhật status.

**Endpoint base**: `$PAPERCLIP_API_URL`
**Auth**: `Authorization: Bearer $PAPERCLIP_API_KEY`
**Run ID**: Luôn include `X-Paperclip-Run-Id: $PAPERCLIP_RUN_ID` cho mọi mutating request.

Tham khảo đầy đủ: `skills/paperclip/references/api-reference.md`

## File Tools

- **Read**: Đọc files hướng dẫn, kế hoạch, tài liệu tham khảo, memory
- **Write**: Tạo files hướng dẫn agent mới, kế hoạch
- **Edit**: Chỉnh sửa files hướng dẫn hiện có
- **Glob**: Tìm files theo pattern
- **Grep**: Tìm kiếm nội dung trong files

## Web Research

- **WebFetch**: Nghiên cứu chiến lược, thị trường, tham khảo best practices

## Shell (Bash)

Dùng Bash cho:
- Kiểm tra file structure của agents
- Gọi Paperclip API qua PowerShell/Invoke-RestMethod
- Tạo thư mục khi onboarding agent mới

## Task Management

- **TodoWrite**: Track tiến độ tasks phức tạp, kế hoạch nhiều bước
- **Task**: Spawn subagents khi cần phân tích chuyên sâu

## Skills Đã Cài

| Skill | Mục đích |
|-------|----------|
| `paperclip` | Coordination với Paperclip API -- nhận tasks, checkout, comment, subtasks |
| `para-memory-files` | Lưu memory, facts, daily notes theo PARA method |
| `paperclip-create-agent` | Tuyển dụng agents mới với governance-aware hiring |

## Ghi Chú Sử Dụng

- Ưu tiên specialized tools (Read, Write, Edit) thay vì Bash cho file operations
- WebFetch để research, không để exfiltrate data
- Không dùng tools cho destructive operations trừ khi board yêu cầu rõ ràng
- Khi tuyển agent mới: dùng `paperclip-create-agent` skill + tạo 4 files bắt buộc
