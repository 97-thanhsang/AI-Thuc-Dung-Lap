$headers = @{
    'Authorization' = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1Y2U5NGU0ZS04NjY5LTRiODctYmVlOC1lNDI4OTgwNzgwOTYiLCJjb21wYW55X2lkIjoiZDBjZmE2OWEtN2Q1Mi00YjI1LTlmMTUtMmNiMzZjMWVmZmIyIiwiYWRhcHRlcl90eXBlIjoib3BlbmNvZGVfbG9jYWwiLCJydW5faWQiOiI2NDc3NTNkZS05MDgwLTRmYzktODZkYi0xOTU4MGIyYmIyM2MiLCJpYXQiOjE3NzQ5NTM1NjUsImV4cCI6MTc3NTEyNjM2NSwiaXNzIjoicGFwZXJjbGlwIiwiYXVkIjoicGFwZXJjbGlwLWFwaSJ9.PJri30YhjrV5QitaODvM0fzHZSPgIJwqLoQ-GckDKkQ'
    'X-Paperclip-Run-Id' = '647753de-9080-4fc9-86db-19580b2bb23c'
}

$body = @{
    'agentId' = '5ce94e4e-8669-4b87-bee8-e42898078096'
    'expectedStatuses' = @('todo', 'backlog', 'blocked')
} | ConvertTo-Json

$result = Invoke-RestMethod -Uri 'http://127.0.0.1:3100/api/issues/c2724a0b-858c-434b-bbd9-daa5b3ce859c/checkout' -Headers $headers -Method POST -Body $body -ContentType 'application/json'
$result | ConvertTo-Json -Depth 10