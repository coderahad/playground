// This file contains all test code, experiment code, practice code from APEX DEVELOPER GUIDE

// Collections can be a key of map
List<Integer> intList = new List<Integer>{1,2,3};
List<String> strLIst = new List<String>{'a', 'b', 'c'};
Account acc = new Account(Name='test');

Map<List<Integer>, Account> mapIntAcc = new Map<List<Integer>, Account>();
mapIntAcc.put(intList, acc);
System.debug(mapIntAcc);