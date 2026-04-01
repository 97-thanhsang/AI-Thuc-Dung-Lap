$apiUrl = $env:PAPERCLIP_API_URL
$apiKey = $env:PAPERCLIP_API_KEY
$runId = $env:PAPERCLIP_RUN_ID
$taskId = $env:PAPERCLIP_TASK_ID
$wakeReason = $env:PAPERCLIP_WAKE_REASON
$approvalId = $env:PAPERCLIP_APPROVAL_ID

Write-Host "PAPERCLIP_API_URL: $apiUrl"
Write-Host "PAPERCLIP_RUN_ID: $runId"
Write-Host "PAPERCLIP_TASK_ID: $taskId"
Write-Host "PAPERCLIP_WAKE_REASON: $wakeReason"
Write-Host "PAPERCLIP_APPROVAL_ID: $approvalId"

if ($apiUrl -and $apiKey -and $runId) {
    $headers = @{
        "Authorization" = "Bearer $apiKey"
        "X-Paperclip-Run-Id" = $runId
    }
    $inbox = Invoke-WebRequest -Uri "$apiUrl/api/agents/me/inbox-lite" -Headers $headers -UseBasicParsing
    Write-Host "Inbox:"
    $inbox.Content
} else {
    Write-Host "Missing required env vars"
}
