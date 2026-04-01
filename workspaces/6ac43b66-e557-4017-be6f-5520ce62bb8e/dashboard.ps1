$apiUrl = $env:PAPERCLIP_API_URL
$apiKey = $env:PAPERCLIP_API_KEY
$runId = $env:PAPERCLIP_RUN_ID
$companyId = "5e23172a-7344-459e-b5ae-1ec00f93c2fd"

$headers = @{
    "Authorization" = "Bearer $apiKey"
    "X-Paperclip-Run-Id" = $runId
}

$response = Invoke-WebRequest -Uri "$apiUrl/api/companies/$companyId/dashboard" -Headers $headers -UseBasicParsing
$response.Content
