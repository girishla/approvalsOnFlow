@isTest
public with sharing class SendHTMLEmailTest {


    @isTest
    public static void CanSendEmail () {

        SendHTMLEmail.Request testReq = new SendHTMLEmail.Request();
        testReq.HTMLbody = 'this is the body';
        testReq.Subject = 'this is the subject';
        testReq.SendTOthisOneEmailAddress = 'test@foo.com';
        testReq.SendCCthisOneEmailAddress = 'test@foo.com';
        testReq.SendBCCthisOneEmailAddress = 'test@foo.com';

        List<SendHTMLEmail.Request> reqList = new List<SendHTMLEmail.Request>();
        reqList.add(testReq);

        List<SendHTMLEmail.Response> testResponseList = SendHTMLEmail.SendEmail(reqList);
        System.assertEquals(testResponseList[0].isSuccess,true);



    }

    @isTest
    public static void errorIfNoAddress () {

        SendHTMLEmail.Request testReq = new SendHTMLEmail.Request();
        testReq.HTMLbody = 'this is the body';
        testReq.Subject = 'this is the subject';
        //testReq.SendTOthisOneEmailAddress = 'test@foo.com';

        List<SendHTMLEmail.Request> reqList = new List<SendHTMLEmail.Request>();
        reqList.add(testReq);

        List<SendHTMLEmail.Response> testResponseList = SendHTMLEmail.SendEmail(reqList);
        System.assertEquals(testResponseList[0].isSuccess,false);



    }

    @isTest
    public static void errorIfBothTemplateandBody () {

        SendHTMLEmail.Request testReq = new SendHTMLEmail.Request();
        testReq.HTMLbody = 'this is the body';
        testReq.templateID = 'temp';
        testReq.Subject = 'this is the subject';
        testReq.SendTOthisOneEmailAddress = 'test@foo.com';

        List<SendHTMLEmail.Request> reqList = new List<SendHTMLEmail.Request>();
        reqList.add(testReq);
        Boolean exceptionHit=false;
        try {
            List<SendHTMLEmail.Response> testResponseList = SendHTMLEmail.SendEmail(reqList);
        
        } catch (SendHTMLEmail.FlowEmailActionException e) {
            exceptionHit=true;
        }
        System.assertEquals(true, exceptionHit);



    }

     @isTest
    public static void errorIfTemplateButNoContextRecord () {

        SendHTMLEmail.Request testReq = new SendHTMLEmail.Request();
        //testReq.HTMLbody = 'this is the body';
        testReq.templateID = 'temp';
        testReq.Subject = 'this is the subject';
        testReq.SendTOthisOneEmailAddress = 'test@foo.com';

        List<SendHTMLEmail.Request> reqList = new List<SendHTMLEmail.Request>();
        reqList.add(testReq);
		Boolean exceptionHit=false;
        try {
            List<SendHTMLEmail.Response> testResponseList = SendHTMLEmail.SendEmail(reqList);
        
        } catch (SendHTMLEmail.FlowEmailActionException e) {
            exceptionHit=true;
        }
        System.assertEquals(true, exceptionHit);
       

    }
}