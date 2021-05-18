public with sharing class myDivision {
    void printError(String s, Exception e) {
        System.debug('Custom Error Msg: ' + s);
        System.debug('Error Type: ' + e.getTypeName());
        System.debug('Error Message: ' + e.getMessage());
    }
    public void myDivision(Integer dividend,  Integer divisor) {
      try {
        System.debug(dividend / divisor);
      } catch(MathException e) {
        printError('Math Error ', e);
      } catch(NullPointerException e) {
        printError('Null divisor or dividend ', e);
      } catch(Exception e) {
        printError('Unknown Exception ', e);
      } finally {
        System.debug('Exiting myDivision()');
      }
    }
}


// Salesforce has naming convention for creating custom exception class
// Class name should be end with the string 'exception'
// ex. public virtual class MyException extends Exception {}