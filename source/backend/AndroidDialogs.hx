package backend;

//https://github.com/nicolastuka/AndroidDialogs

import extension.androiddialogs.AndroidDialogs;

class AndroidDialogs{
    public static function OpenToast(showtext:String)
    {
        AndroidDialogs.ShowToast(showtext, LENGTH_LONG);//or LENGTH_SHORT duration
    }




}