package backend;

//https://github.com/nicolastuka/AndroidDialogs

import extension.androiddialogs.AndroidDialogs;

class AndroidDialogs{
    public function ShowToast(showtext:String)
    {
        AndroidDialogs.ShowToast(showtext, AndroidDialogs.LENGTH_LONG);//or LENGTH_SHORT duration
    }




}