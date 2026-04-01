$headers = @{
    'Authorization' = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1Y2U5NGU0ZS04NjY5LTRiODctYmVlOC1lNDI4OTgwNzgwOTYiLCJjb21wYW55X2lkIjoiZDBjZmE2OWEtN2Q1Mi00YjI1LTlmMTUtMmNiMzZjMWVmZmIyIiwiYWRhcHRlcl90eXBlIjoib3BlbmNvZGVfbG9jYWwiLCJydW5faWQiOiI2NDc3NTNkZS05MDgwLTRmYzktODZkYi0xOTU4MGIyYmIyM2MiLCJpYXQiOjE3NzQ5NTM1NjUsImV4cCI6MTc3NTEyNjM2NSwiaXNzIjoicGFwZXJjbGlwIiwiYXVkIjoicGFwZXJjbGlwLWFwaSJ9.PJri30YhjrV5QitaODvM0fzHZSPgIJwqLoQ-GckDKkQ'
    'X-Paperclip-Run-Id' = '647753de-9080-4fc9-86db-19580b2bb23c'
}

$body = @{
    'status' = 'done'
    'comment' = '## Update

Da cap nhat AGENTS.md cho CMO agent voi day du instructions:

- Role: Chief Marketing Officer - AI Thuc Dong Lab
- Content pillars: 6 loai content voi ti trong
- Weekly rhythm: Lich content chi tiet theo ngay
- Metrics: Target Month 1 (2,000 followers, 28 content pieces, $50 affiliate revenue)
- Delegation rules: Quy trinh tao subtask cho team
- Communication: Vietnamese, grade 7 readability

Approved hire request dang cho board review: [e54e7dab-f887-4016-87b1-32c167193404](/AITAA/approvals/e54e7dab-f887-4016-87b1-32c167193404)'
} | ConvertTo-Json -Depth 10

$result = Invoke-RestMethod -Uri 'http://127.0.0.1:3100/api/issues/c2724a0b-858c-434b-bbd9-daa5b3ce859c' -Headers $headers -Method PATCH -Body $body -ContentType 'application/json'
$result | ConvertTo-Json -Depth 10