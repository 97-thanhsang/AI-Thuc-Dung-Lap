$headers = @{
    'Authorization' = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1Y2U5NGU0ZS04NjY5LTRiODctYmVlOC1lNDI4OTgwNzgwOTYiLCJjb21wYW55X2lkIjoiZDBjZmE2OWEtN2Q1Mi00YjI1LTlmMTUtMmNiMzZjMWVmZmIyIiwiYWRhcHRlcl90eXBlIjoib3BlbmNvZGVfbG9jYWwiLCJydW5faWQiOiI2NDc3NTNkZS05MDgwLTRmYzktODZkYi0xOTU4MGIyYmIyM2MiLCJpYXQiOjE3NzQ5NTM1NjUsImV4cCI6MTc3NTEyNjM2NSwiaXNzIjoicGFwZXJjbGlwIiwiYXVkIjoicGFwZXJjbGlwLWFwaSJ9.PJri30YhjrV5QitaODvM0fzHZSPgIJwqLoQ-GckDKkQ'
    'X-Paperclip-Run-Id' = '647753de-9080-4fc9-86db-19580b2bb23c'
}
$result = Invoke-RestMethod -Uri 'http://127.0.0.1:3100/api/agents/me' -Headers $headers
$result | ConvertTo-Json -Depth 10