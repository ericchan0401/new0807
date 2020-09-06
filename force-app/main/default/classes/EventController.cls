public class EventController {

    public String debug{get;Set;}
    private String SObjectPrefix = null;
    public EventController(ApexPages.StandardController controller){
        this.SObjectPrefix = controller.getRecord().getSObjectType().getDescribe().getKeyPrefix();
    }
    
    public PageReference onLoadPage(){
        this.debug = JSON.serializePretty(ApexPages.currentPage().getParameters());
        String retURL = ApexPages.currentPage().getParameters().get('retURL');
        
        // パラメータ取得
        Map<String, String> parameterMap = ApexPages.CurrentPage().getParameters();
        for (String iskey : parameterMap.keyset()) {
            System.debug(iskey + ':' + parameterMap.get(iskey));
        }
        

        if(ApexPages.currentPage().getParameters().get('aid') != null &&
           ApexPages.currentPage().getParameters().get('evt4') == null){
           // ホームカレンダーから新規の場合
           PageReference pg = new PAgeReference('/');
           for(String key : ApexPages.currentPage().getParameters().keyset()){
               if(key == 'save_new' || key == 'sfdc.override' || key == 'aid' ||
                  key == 'anm' || key == 'tsk5' || key == 'what_id') continue;
               pg.getParameters().put(key, ApexPages.currentPage().getParameters().get(key));
            }
            pg.getParameters().put('nooverride','1');
            pg.setRedirect(false);
            return pg;
        } else if(ApexPages.currentPage().getParameters().get('evt4') != null){
            // カレンダーから新規行動の場合
            PageReference pg = new PAgeReference('/'+this.SObjectPrefix+'/e');
            for(String key : ApexPages.currentPage().getParameters().keyset()){
                if(key == 'save_new' || key == 'sfdc.override') continue;
                pg.getParameters().put(key, ApexPages.currentPage().getParameters().get(key));
            }
            pg.getParameters().put('nooverride','1');
            pg.setRedirect(true);
            return pg;
        } else {
            // 新規行動の場合
            PageReference pg = new PAgeReference('/'+this.SObjectPrefix+'/e');
            for(String key : ApexPages.currentPage().getParameters().keyset()){
                if(key == 'save_new' || key == 'sfdc.override') continue;
                pg.getParameters().put(key, ApexPages.currentPage().getParameters().get(key));
            }
            pg.getParameters().put('nooverride','1');
            pg.setRedirect(true);
            return pg;
        }
    }
}