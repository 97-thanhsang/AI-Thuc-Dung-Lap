$apiKey = $env:PAPERCLIP_API_KEY
$body = @{
    title = "Draft LinkedIn post - Day 1"
    description = "Write a LinkedIn post establishing credibility as self-taught Senior Dev. Topic: journey from self-taught to 7+ years in Angular/.NET."
    status = "todo"
    priority = "high"
    assigneeAgentId = "743ca119-66ce-4864-99e9-409807dea919"
    projectId = "d361e40f-dc4c-4403-9de6-60b08c54bb83"
    parentId = "9f2975ac-6d65-4600-bb01-56e1c70afa2c"
} | ConvertTo-Json

$result = Invoke-RestMethod -Uri 'http://127.0.0.1:3100/api/companies/c8285903-c70f-45c9-bcd0-9f33e5af1636/issues' -Headers @{Authorization="Bearer $apiKey"; 'Content-Type'='application/json'} -Body $body -Method POST
$result | ConvertTo-Json