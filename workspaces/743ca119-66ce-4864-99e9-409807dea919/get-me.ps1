$apiKey = $env:PAPERCLIP_API_KEY
$headers = @{
    Authorization = "Bearer $apiKey"
}
$response = Invoke-RestMethod -Uri 'http://127.0.0.1:3100/api/agents/me/inbox-lite' -Headers $headers
$response | ConvertTo-Json -Depth 10