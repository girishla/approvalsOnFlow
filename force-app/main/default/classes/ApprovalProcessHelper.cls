public with sharing class ApprovalProcessHelper {
    @AuraEnabled(cacheable=true)
    public static String getApprovalProcessHistory(Id processId) {
        List<Approval_Process_Step_Task__c> tasks = [
                SELECT Id, Name, Status__c, Comments__c, (SELECT Id, CreatedDate, Comments__c, Status__c, Original_User__c,Original_User__r.Name, Assigned_User__c, Assigned_User__r.Name FROM AP_ApprovalInstanceHistoryItems__r)
                FROM Approval_Process_Step_Task__c
                WHERE Parent_Approval_Process_Instance__r.ApprovalProcessDefinition__c = :processId
        ];
        return JSON.serialize(tasks);
    }
}