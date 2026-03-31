$headers = @{
    'Authorization' = "Bearer $env:PAPERCLIP_API_KEY"
    'X-Paperclip-Run-Id' = "$env:PAPERCLIP_RUN_ID"
}
$url = "http://127.0.0.1:3100/api/companies/c8285903-c70f-45c9-bcd0-9f33e5af1636/issues?assigneeAgentId=743ca119-66ce-4864-99e9-409807dea919&status=todo,in_progress,blocked"
$result = Invoke-RestMethod -Uri $url -Headers $headers
$result | ConvertTo-Json -Depth 10
