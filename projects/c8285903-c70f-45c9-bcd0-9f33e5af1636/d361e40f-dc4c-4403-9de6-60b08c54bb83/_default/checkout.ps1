$headers = @{
    'Authorization' = "Bearer $env:PAPERCLIP_API_KEY"
    'X-Paperclip-Run-Id' = "$env:PAPERCLIP_RUN_ID"
    'Content-Type' = 'application/json'
}
$body = @{
    agentId = "$env:PAPERCLIP_AGENT_ID"
    expectedStatuses = @("todo", "backlog", "blocked")
} | ConvertTo-Json

Invoke-RestMethod -Uri 'http://127.0.0.1:3100/api/issues/c8714942-311a-4430-8900-3c26b3cdb727/checkout' -Headers $headers -Method Post -Body $body
