# Tools

## Paperclip API

Omnichannel Writer dùng Paperclip API để nhận task, checkout, comment, tạo subtasks QA, và cập nhật status.

**Endpoint base**: `$PAPERCLIP_API_URL`
**Auth**: `Authorization: Bearer $PAPERCLIP_API_KEY`
**Run ID**: Luôn include `X-Paperclip-Run-Id: $PAPERCLIP_RUN_ID` cho mọi mutating request.

Tham khảo đầy đủ: `skills/paperclip/references/api-reference.md`

## File Tools

- **Read**: Đọc briefs, templates, content cũ để tham khảo
- **Write**: Tạo drafts mới
- **Edit**: Chỉnh sửa drafts
- **Glob**: Tìm files theo pattern
- **Grep**: Tìm kiếm trong drafts và templates

## Web Research (Khi cần thiết)

- **WebFetch**: Khi brief cần bổ sung thêm data hoặc example cụ thể
  - Không thay thế Research -- nếu cần research nhiều, yêu cầu brief từ Researcher
  - Dùng để verify facts hoặc lấy ví dụ cụ thể

## Shell (Bash)

Dùng Bash cho:
- Kiểm tra file structure
- Gọi Paperclip API qua PowerShell
- Script automation nhỏ

## Task Management

- **TodoWrite**: Track tiến độ khi viết nhiều bài cùng lúc

## Skills Đã Cài

| Skill | Mục đích |
|-------|----------|
| `paperclip` | Coordination với Paperclip API |
| `para-memory-files` | Lưu memory, drafts, content templates theo PARA method |

## Ghi Chú Sử Dụng

- Lưu draft vào task document: `PUT /api/issues/{id}/documents/draft`
- Lưu templates hay dùng vào `$AGENT_HOME/life/templates/`
- Ưu tiên specialized tools (Read, Write, Edit) thay vì Bash cho file operations
- Không dùng tools cho destructive operations trừ khi board yêu cầu rõ ràng
