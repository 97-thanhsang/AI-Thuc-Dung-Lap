# Tools

## Paperclip API

Market Researcher dùng Paperclip API để nhận task, checkout, comment, và cập nhật status.

**Endpoint base**: `$PAPERCLIP_API_URL`
**Auth**: `Authorization: Bearer $PAPERCLIP_API_KEY`
**Run ID**: Luôn include `X-Paperclip-Run-Id: $PAPERCLIP_RUN_ID` cho mọi mutating request.

Tham khảo đầy đủ: `skills/paperclip/references/api-reference.md`

## File Tools

- **Read**: Đọc research notes, briefs cũ, references
- **Write**: Tạo topic briefs, research reports, trend digests
- **Edit**: Chỉnh sửa briefs
- **Glob**: Tìm files theo pattern
- **Grep**: Tìm kiếm trong research notes

## Web Research (Công cụ chính)

- **WebFetch**: Research xu hướng AI, tools mới, affiliate programs, competitor content
  - ProductHunt: `https://www.producthunt.com`
  - Hacker News: `https://news.ycombinator.com`
  - LinkedIn: tìm AI content Việt Nam
  - PartnerStack/Impact.com: affiliate programs
  - Tool-specific affiliate pages

## Shell (Bash)

Dùng Bash cho:
- Kiểm tra file structure
- Gọi Paperclip API qua PowerShell
- Script automation nhỏ

## Task Management

- **TodoWrite**: Track tiến độ research tasks phức tạp

## Skills Đã Cài

| Skill | Mục đích |
|-------|----------|
| `paperclip` | Coordination với Paperclip API |
| `para-memory-files` | Lưu memory, research notes, facts theo PARA method |

## Ghi Chú Sử Dụng

- WebFetch là công cụ chính cho research -- dùng thường xuyên
- Lưu research findings vào `$AGENT_HOME/life/` để không research lại từ đầu
- Ưu tiên specialized tools (Read, Write, Edit) thay vì Bash cho file operations
- Không dùng tools cho destructive operations trừ khi board yêu cầu rõ ràng
