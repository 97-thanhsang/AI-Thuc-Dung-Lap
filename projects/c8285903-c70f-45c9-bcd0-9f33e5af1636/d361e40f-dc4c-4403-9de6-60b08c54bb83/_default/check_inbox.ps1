$headers = @{
    'Authorization' = "Bearer $env:PAPERCLIP_API_KEY"
    'X-Paperclip-Run-Id' = "$env:PAPERCLIP_RUN_ID"
}
$result = Invoke-RestMethod -Uri 'http://127.0.0.1:3100/api/agents/me/inbox-lite' -Headers $headers
$result | ConvertTo-Json -Depth 10
