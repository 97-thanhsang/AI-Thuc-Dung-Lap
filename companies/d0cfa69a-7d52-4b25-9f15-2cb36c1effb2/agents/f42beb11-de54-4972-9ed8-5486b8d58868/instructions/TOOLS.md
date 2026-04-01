# Tools

## Paperclip API

CMO dùng Paperclip API để nhận task, checkout, comment, tạo subtasks, và cập nhật status.

**Endpoint base**: `$PAPERCLIP_API_URL`
**Auth**: `Authorization: Bearer $PAPERCLIP_API_KEY`
**Run ID**: Luôn include `X-Paperclip-Run-Id: $PAPERCLIP_RUN_ID` cho mọi mutating request.

Tham khảo đầy đủ: `skills/paperclip/references/api-reference.md`

## File Tools

- **Read**: Đọc files nội dung, plans, references
- **Write**: Tạo draft nội dung, plans
- **Edit**: Chỉnh sửa nội dung hiện có
- **Glob**: Tìm files theo pattern
- **Grep**: Tìm kiếm nội dung trong files

## Web Research

- **WebFetch**: Nghiên cứu xu hướng AI, tools mới, giá cả affiliate programs
  - Tìm thông tin công cụ AI mới nhất
  - Research competitor content
  - Check affiliate program terms

## Shell (Bash)

Dùng Bash cho:
- Kiểm tra file structure
- Gọi Paperclip API qua PowerShell/curl
- Script automation nhỏ

## Task Management

- **TodoWrite**: Track tiến độ tasks phức tạp
- **Task**: Spawn subagents khi cần

## Skills Đã Cài

| Skill              | Mục đích                                           |
| ------------------ | -------------------------------------------------- |
| `paperclip`        | Coordination với Paperclip API                     |
| `para-memory-files`| Lưu memory, facts, daily notes theo PARA method    |
| `receival`         | Phân tích và lên kế hoạch tasks mới               |

## Ghi Chú Sử Dụng

- Ưu tiên specialized tools (Read, Write, Edit) thay vì Bash cho file operations
- WebFetch để research, không để exfiltrate data
- Không dùng tools cho destructive operations trừ khi board yêu cầu rõ ràng
