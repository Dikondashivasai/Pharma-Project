global class ProspectLookUpAccount {
     @InvocableMethod(label='Get Account IDs' description='Returns a list of Account IDs based on StageName = Closed Won')
        public static List<List<Account>> getAccountsFromClosedWonOpportunities() {
               Set<Id> accountIds = new Set<Id>();
            List<Opportunity> closedWonOpportunities = [SELECT Id, AccountId FROM Opportunity WHERE StageName = 'Closed Won'];
       
        for (Opportunity opp : closedWonOpportunities) {
            accountIds.add(opp.AccountId);
        }
             List<Account> closedWonAccounts =[SELECT Id,Name from Account where Id in :accountIds];
            List<List<Account>> Acc=new List<List<Account>>();
            acc.add(closedWonAccounts);
        return acc;

        }
global class AccountListOutput {
@InvocableVariable(label='Account IDs' description='List of Account IDs')
    public List<Account> accountRecords;
        public AccountListOutput(List<Account> records) {
            accountRecords = records;
        }
    }
}