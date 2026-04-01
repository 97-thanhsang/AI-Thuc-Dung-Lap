$apiUrl = $env:PAPERCLIP_API_URL
$apiKey = $env:PAPERCLIP_API_KEY
$runId = $env:PAPERCLIP_RUN_ID

$headers = @{
    "Authorization" = "Bearer $apiKey"
    "X-Paperclip-Run-Id" = $runId
}

$companyId = "5e23172a-7344-459e-b5ae-1ec00f93c2fd"
$agentId = "6ac43b66-e557-4017-be6f-5520ce62bb8e"

$response = Invoke-WebRequest -Uri "$apiUrl/api/agents/me/inbox-lite" -Headers $headers -UseBasicParsing
$response.Content
