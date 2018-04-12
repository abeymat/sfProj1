public with sharing class myObj
{
    /*private final expSuitepreferences__c preferencesObj;
    String contact_name;
    public expSuitepreferences__c pref;
    public expEmailSeedlist__c[] seed;
    private String delete_id;
    private String fname,lname,email;
    public String mark_delete_id {get;set;}
   */
    public myObj__c myObj;
    public myObjDetails__c[]  mydetalList{get;set;}

    public myObj__c getmyObj()
    {
        try
        {
            myObj = [Select  e.name,active__c,Contact__r.firstName,seasons__c,serailNo__c,(select name from myObjDetails__r) from myObj__c e where
             id =: ApexPages.currentPage().getParameters().get('id') ];
        }
        catch(QueryException e)
        {
            myObj = new myObj__c(Name = 'hhhhh');
        }


         mydetalList = myObj.myObjDetails__r;

    	 myObjDetails__c myDetObj = new myObjDetails__c(name='ahalya',myObj__c=ApexPages.currentPage().getParameters().get('id'));
    	 mydetalList.add(myDetObj);
    	 //myObj.myObjDetails__r.add(myDetObj);


        return myObj;
    }


    public void save()
    {
    	
        myObjDetails__c[]  mydetalList = myObj.myObjDetails__r;
        //System.debug('ALLLOC -->'+myObj.myObjDetails__r[0].name+'  ');
    	update(myObj);
    	update(mydetalList);
    }

     public void clear()
    {
    }

    public void addChild()
    {
    	

    }
}