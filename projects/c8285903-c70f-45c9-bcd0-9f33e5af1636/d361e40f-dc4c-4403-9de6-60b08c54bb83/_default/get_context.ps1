$headers = @{
    'Authorization' = "Bearer $env:PAPERCLIP_API_KEY"
    'X-Paperclip-Run-Id' = "$env:PAPERCLIP_RUN_ID"
}
$result = Invoke-RestMethod -Uri 'http://127.0.0.1:3100/api/issues/6227b833-153d-4497-b1f6-2bb34367028d/heartbeat-context' -Headers $headers
$result | ConvertTo-Json -Depth 10
