public class MySecondController {
    public String getName() {
        return 'MyController';
    }

    public Account getAccount() {
        return [SELECT id, name FROM Account WHERE id = :ApexPages.currentPage().getParameters().get('id')];
    }
}
