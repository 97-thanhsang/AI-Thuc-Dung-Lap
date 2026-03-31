$apiKey = $env:PAPERCLIP_API_KEY
$companyId = $env:PAPERCLIP_COMPANY_ID
$agentId = $env:PAPERCLIP_AGENT_ID
$headers = @{
    Authorization = "Bearer $apiKey"
}
$response = Invoke-RestMethod -Uri "http://127.0.0.1:3100/api/companies/$companyId/issues?assigneeAgentId=$agentId" -Headers $headers
$response | ConvertTo-Json -Depth 10