package backend;

//https://github.com/nicolastuka/AndroidDialogs

import extension.androiddialogs.AndroidDialogs;

class AndroidDialogsExtend{

    public static function OpenToast(showtext:String)
    {
        AndroidDialogs.ShowToast(showtext, AndroidDialogs.LENGTH_LONG);//or LENGTH_SHORT duration
    }




}