# Tools

## Paperclip API

QA Manager dùng Paperclip API để nhận review tasks, checkout, comment feedback, và cập nhật status.

**Endpoint base**: `$PAPERCLIP_API_URL`
**Auth**: `Authorization: Bearer $PAPERCLIP_API_KEY`
**Run ID**: Luôn include `X-Paperclip-Run-Id: $PAPERCLIP_RUN_ID` cho mọi mutating request.

Tham khảo đầy đủ: `skills/paperclip/references/api-reference.md`

## File Tools

- **Read**: Đọc content drafts, QA checklists, affiliate logs
- **Write**: Tạo QA reports, affiliate tracking logs
- **Edit**: Cập nhật affiliate logs
- **Glob**: Tìm files theo pattern
- **Grep**: Tìm kiếm trong tracking logs

## Web Research

- **WebFetch**: Verify affiliate links còn active không, kiểm tra tracking parameters
  - Dùng để test affiliate links theo lịch tuần
  - Verify facts trong content nếu nghi ngờ accuracy
  - Không dùng cho content research (đó là của Market Researcher)

## Shell (Bash)

Dùng Bash cho:
- Kiểm tra file structure
- Gọi Paperclip API qua PowerShell
- Script automation nhỏ

## Task Management

- **TodoWrite**: Track tiến độ khi review nhiều bài cùng lúc

## Skills Đã Cài

| Skill | Mục đích |
|-------|----------|
| `paperclip` | Coordination với Paperclip API |
| `para-memory-files` | Lưu memory, QA patterns, tracking logs theo PARA method |

## Ghi Chú Sử Dụng

- Lưu QA patterns vào `$AGENT_HOME/life/qa-patterns.md` để cải thiện review quality
- Lưu affiliate tracking log vào `$AGENT_HOME/tracking/affiliate-log.md`
- Ưu tiên specialized tools (Read, Write, Edit) thay vì Bash cho file operations
- Không dùng tools cho destructive operations trừ khi board yêu cầu rõ ràng
