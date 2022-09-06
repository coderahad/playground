public class IntvFuncTest {
    String name = 'JOHN';
    
    public IntvFuncTest() {
    this.name = 'JOHN';
        if(name == 'JOHN' && callDoe()) {
            System.debug('This is JOHN');
        }
        if(name == 'DAVID' && callDoe()) {
            System.debug('This is DAVID');
        }
        if(name == 'JOHN' || callDoe()) {
            System.debug('This is JOHN');
        }
        if(name == 'DAVID' || callDoe()) {
            System.debug('This is DAVID');
        }
     }
    private Boolean callDoe() {
        System.debug('This is DOE');
        return false;
    }
}
// IntvFuncTest tst = new IntvFuncTest();