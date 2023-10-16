package backend;

//https://github.com/beihu235/AndroidDialogs
#if android
import extension.androiddialogs.AndroidDialogs;
//import extension.androiddialogs.CallbackHandler;

class AndroidDialogsExtend{

    public static function OpenToast(showtext:String, time:Int)
    {
        if (time != 1 && time != 2) time = 1;
			
        AndroidDialogs.ShowToast(showtext, time);//or LENGTH_SHORT duration
    }

    public static function OpenAlert(Title:String, Message:String, ConfirmName:String, CancelName:String)
    {
        /*
            param: Title dialog.
            param: Message dialog.
            param: Caption confirm button dialog.
            param: Caption cancel button dialog.
        */
        AndroidDialogs.ShowAlertDialog(Title, Message, ConfirmName, CancelName);
    }
    
    /*
    function OtherFunctionGetResult():Void
    {
        //get string user selection
        trace(AndroidDialogs.objHaxe.answerDialog);
    }
    */ //use AndroidDialogs.objHaxe.answerDialog get data
    
    public static function OpenAlertSelect(Title:String, choose1:String, choose2:String, choose3:String, choose4:String, choose5:String)
    {
        var names_players:Array<String> = new Array<String>();
        names_players.push(choose1);
        if (choose2 != null) names_players.push(choose2);
        if (choose3 != null) names_players.push(choose3);
        if (choose4 != null) names_players.push(choose4);
        if (choose5 != null) names_players.push(choose5);
        /*
            param: Title dialog.
            param: Array String values
        */
        AndroidDialogs.ShowAlertSelectOption(Title, names_players);
    }
    /*
    function OtherFunctionGetResult():Void
    {
        //get string user selection
        trace(AndroidDialogs.objHaxe.answerOptionSelected);
    }
    */ //use AndroidDialogs.objHaxe.answerOptionSelected get data
    
    /*
    function AnyFuntion():Void
    {
        var names_players:Array<String> = new Array<String>();
        names_players.push("Pity Martinez");
        names_players.push("Jonathan Maidana");
        names_players.push("Enzo Perez");
        names_players.push("Ignacio Scoco");
        names_players.push("Leonardo Ponzio");
        /*
            param: Title dialog.
            param: Array String values
        
        AndroidDialogs.ShowAlertMultipleSelectOption("Title", names_players);
    }

    function OtherFunctionGetResult():Void
    {
        //get value boolean user selection
        for (valueBoolean in AndroidDialogs.objHaxe.answersOptionsMultipleSelected)
        {
            trace("FLAG: " + valueBoolean);
        }
    }
    */
}
#end


